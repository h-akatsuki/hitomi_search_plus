import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hitomi_search_plus/component/default_query.dart';
import 'package:hitomi_search_plus/db/default_query.dart';
import 'package:hitomi_search_plus/server/query.dart';
import 'package:hitomi_search_plus/server/tags.dart' as tags
    show applySuggestion;
import 'package:hitomi_search_plus/server/tags.dart' hide applySuggestion;
import 'package:hitomi_search_plus/src/rust/api/suggest.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchController extends ChangeNotifier {
  String _query;
  String _editedQuery = '';
  AsyncValue<TagsResult> _state = const AsyncValue.loading();
  bool _isProcessing = false;
  final FocusNode focusNode = FocusNode();

  SearchController({String initialQuery = ''}) : _query = initialQuery {
    setQuery(initialQuery);
  }

  String get query => _query;
  String get editedQuery => _editedQuery;
  AsyncValue<TagsResult> get state => _state;

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  Future<void> setQuery(String newQuery) async {
    if (_isProcessing) return;
    _isProcessing = true;
    _query = newQuery;
    notifyListeners();

    try {
      final suggest = await tagsSuggest;
      final queryResult = extractSuggestion(_query);
      _editedQuery = queryResult.name ?? '';
      if (queryResult.name == null) {
        _state = AsyncValue.data(await TagsResult.empty());
      } else {
        TagType? tagType = queryResult.category != null
            ? TagConverter.fromTextFlex(queryResult.category!)
            : null;
        final result = tagType == null
            ? await suggest.suggest(query: queryResult.name!)
            : await suggest.suggestWithType(
                query: queryResult.name!, tagType: tagType);
        _state = AsyncValue.data(result);
      }
    } catch (e, st) {
      _state = AsyncValue.error(e, st);
    } finally {
      _isProcessing = false;
      notifyListeners();
    }
  }

  void applySuggestion(String type, String name) {
    _query = tags.applySuggestion(_query, type, name);
    notifyListeners();
    setQuery(_query);
    focusNode.requestFocus();
  }

  String get queryText => _query.trim();
}

class SearchForm extends HookWidget {
  final SearchController controller;
  final Function(String) onSubmitted;

  const SearchForm({
    super.key,
    required this.controller,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController(text: controller.query);

    useEffect(() {
      void listener() {
        final controllerQuery = controller.query;
        if (textController.text != controllerQuery) {
          textController.value = TextEditingValue(
            text: controllerQuery,
            selection: TextSelection.collapsed(offset: controllerQuery.length),
          );
        }
      }

      controller.addListener(listener);
      return () => controller.removeListener(listener);
    }, [controller, textController]);

    return TextField(
      controller: textController,
      focusNode: controller.focusNode,
      decoration: InputDecoration(
        hintText: 'Search',
        suffixIcon: ExcludeFocus(
          child: GestureDetector(
            onTap: () {
              onSubmitted(textController.text);
              controller.focusNode.requestFocus();
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                customBorder: CircleBorder(),
                child: Icon(Icons.search),
              ),
            ),
          ),
        ),
        border: const OutlineInputBorder(),
      ),
      onChanged: (value) {
        if (value != controller.query) {
          controller.setQuery(value);
        }
      },
      onSubmitted: (value) {
        onSubmitted(value);
        controller.focusNode.requestFocus();
      },
    );
  }
}

class ExcludeFocus extends StatelessWidget {
  final Widget child;

  const ExcludeFocus({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      child: child,
    );
  }
}

class QueryForm extends HookWidget {
  final SearchController controller;

  const QueryForm({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController(text: controller.query);

    useEffect(() {
      void listener() {
        final controllerQuery = controller.query;
        if (textController.text != controllerQuery) {
          textController.value = TextEditingValue(
            text: controllerQuery,
            selection: TextSelection.collapsed(offset: controllerQuery.length),
          );
        }
      }

      controller.addListener(listener);
      return () => controller.removeListener(listener);
    }, [controller, textController]);

    return TextField(
      controller: textController,
      focusNode: controller.focusNode,
      decoration: const InputDecoration(
        hintText: 'Query',
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        if (value != controller.query) {
          controller.setQuery(value);
        }
      },
      onSubmitted: (value) {
        controller.focusNode.requestFocus();
      },
    );
  }
}

class SearchSuggestions extends HookWidget {
  final SearchController controller;

  const SearchSuggestions({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final state = useListenable(controller).state;

    return state.when(
      data: (tagsResult) => ListView.builder(
        shrinkWrap: true,
        itemCount: tagsResult.len,
        itemBuilder: (context, index) {
          final tag = tagsResult.getTag(index: index);
          return FutureBuilder<Tag>(
            future: tag,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final tagData = snapshot.data!;
                return TagSuggestionItem(
                  tag: tagData,
                  onTap: controller.applySuggestion,
                  query: controller.editedQuery,
                );
              } else {
                return const ListTile(title: Text('Loading...'));
              }
            },
          );
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}

class TagSuggestionItem extends StatelessWidget {
  final Tag tag;
  final Function(String, String) onTap;
  final String query;

  const TagSuggestionItem({
    super.key,
    required this.tag,
    required this.onTap,
    required this.query,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: HighlightText(
        query: query,
        text: '${tag.name} (${tag.count})',
      ),
      leading: Icon(tag.tagType.toIcon()),
      onTap: () => onTap(tag.tagType.toText(), tag.name),
    );
  }
}

class HighlightText extends StatelessWidget {
  final String? query;
  final String text;

  const HighlightText({
    super.key,
    required this.query,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final TextStyle defaultNormalStyle = theme.textTheme.bodyLarge!.copyWith(
      color: colorScheme.onSurface,
    );

    final TextStyle defaultHighlightStyle = theme.textTheme.bodyLarge!.copyWith(
      color: colorScheme.primary,
      fontWeight: FontWeight.bold,
    );

    final TextStyle effectiveNormalStyle = defaultNormalStyle;
    final TextStyle effectiveHighlightStyle = defaultHighlightStyle;

    if (query == null || query!.isEmpty) {
      return Text(text, style: effectiveNormalStyle);
    }

    List<TextSpan> spans = [];
    int lastMatchEnd = 0;
    String lowercaseText = text.toLowerCase();
    String lowercaseQuery = query!.toLowerCase();

    List<int> matchIndices = _findMatchIndices(lowercaseText, lowercaseQuery);

    for (int i = 0; i < matchIndices.length; i++) {
      int start = matchIndices[i];
      int end = start + 1;
      if (start > lastMatchEnd) {
        spans.add(TextSpan(
            text: text.substring(lastMatchEnd, start),
            style: effectiveNormalStyle));
      }
      spans.add(TextSpan(
          text: text.substring(start, end), style: effectiveHighlightStyle));

      lastMatchEnd = end;
    }
    if (lastMatchEnd < text.length) {
      spans.add(TextSpan(
          text: text.substring(lastMatchEnd), style: effectiveNormalStyle));
    }

    return RichText(text: TextSpan(children: spans));
  }

  List<int> _findMatchIndices(String text, String query) {
    List<int> indices = [];
    int textIndex = 0;
    int queryIndex = 0;

    while (textIndex < text.length && queryIndex < query.length) {
      if (text[textIndex] == query[queryIndex]) {
        indices.add(textIndex);
        queryIndex++;
      }
      textIndex++;
    }

    return queryIndex == query.length ? indices : [];
  }
}

class SearchWidget extends HookConsumerWidget {
  final SearchBuilder? initialSearchBuilder;
  final Function(SearchBuilder) onSubmitted;

  const SearchWidget({
    super.key,
    this.initialSearchBuilder,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useMemoized(
        () => SearchController(initialQuery: initialSearchBuilder?.query ?? ''),
        [initialSearchBuilder?.query]);
    final defController = useMemoized(() {
      if (initialSearchBuilder != null) {
        return OneLineDefaultQueryController(
            initialSelected: initialSearchBuilder!.defaultQuery);
      }
      final defaultValue =
          ref.read(defaultQueryDataProvider.notifier).defaultSelect();
      return OneLineDefaultQueryController(initialSelected: defaultValue);
    }, [initialSearchBuilder?.defaultQuery]);
    useEffect(() {
      return controller.dispose;
    }, [controller]);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: FocusTraversalGroup(
                    child: Column(
                      children: [
                        SearchForm(
                            controller: controller,
                            onSubmitted: (query) {
                              onSubmitted(SearchBuilder(
                                  query: query,
                                  defaultQuery: defController.selected));
                            }),
                        Expanded(
                          child: SearchSuggestions(controller: controller),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: DefaultQueryPC(controller: defController),
                ),
              ],
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                OneLineDefaultQuery(controller: defController),
                SearchForm(
                    controller: controller,
                    onSubmitted: (query) {
                      onSubmitted(SearchBuilder(
                          query: query, defaultQuery: defController.selected));
                    }),
                Expanded(
                  child: SearchSuggestions(controller: controller),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
