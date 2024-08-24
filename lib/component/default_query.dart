import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hitomi_search_plus/db/default_query.dart';
import 'package:hitomi_search_plus/page/default_query.dart';
import 'package:hitomi_search_plus/tools/hook.dart';
import 'package:hitomi_search_plus/tools/suger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OneLineDefaultQueryController {
  SelectDefaultQuery _selected;

  OneLineDefaultQueryController({required SelectDefaultQuery initialSelected})
      : _selected = initialSelected;

  SelectDefaultQuery get selected => _selected;
}

class OneLineDefaultQuery extends HookConsumerWidget {
  final OneLineDefaultQueryController controller;
  const OneLineDefaultQuery({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queries = ref.watch(defaultQueryDataProvider);
    final selected = useState(controller._selected);
    final colorScheme = Theme.of(context).colorScheme;

    final init = useMemoized(() => WrapObject(true));
    useEffect(() {
      if (init.value) {
        init.value = false;
        return null;
      }
      selected.value = controller._selected;
      return null;
    }, [controller._selected]);

    useEffect(() {
      controller._selected = selected.value;
      return null;
    }, [selected.value]);

    return GestureDetector(
      onTap: () => _showEditDialog(context, ref, selected),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(Icons.edit, color: colorScheme.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                selected.value.selected.isEmpty
                    ? 'No default query selected'
                    : queries.queries
                        .where((element) =>
                            selected.value.selected.contains(element.id))
                        .map((e) => e.title)
                        .join(', '),
                style: TextStyle(
                    fontSize: 16, color: colorScheme.onSurfaceVariant),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, WidgetRef ref,
      ValueNotifier<SelectDefaultQuery> selected) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
              maxWidth: MediaQuery.of(context).size.width * 0.9,
            ),
            child: SelectDefaultQueryDetail(
              initialSelected: selected.value,
              onSave: (newSelected) {
                selected.value = newSelected;
              },
            ),
          ),
        );
      },
    );
  }
}

class SelectDefaultQueryDetail extends HookConsumerWidget {
  final SelectDefaultQuery initialSelected;
  final void Function(SelectDefaultQuery) onSave;

  const SelectDefaultQueryDetail({
    super.key,
    required this.initialSelected,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queries = ref.watch(defaultQueryDataProvider);
    final selected = useState(initialSelected);
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  context.push(const DefaultQueryListScreen());
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: queries.queries.length,
              itemBuilder: (context, index) {
                final query = queries.queries[index];
                return CheckboxListTile(
                  title: Text(query.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface)),
                  subtitle: Text(query.query,
                      style: TextStyle(
                          fontSize: 12, color: colorScheme.onSurfaceVariant)),
                  value: selected.value.selected.contains(query.id),
                  onChanged: (value) {
                    if (value == true) {
                      selected.value = SelectDefaultQuery(
                        List.from(selected.value.selected)..add(query.id),
                        selected.value.newestId,
                      );
                    } else {
                      selected.value = SelectDefaultQuery(
                        List.from(selected.value.selected)..remove(query.id),
                        selected.value.newestId,
                      );
                    }
                  },
                  activeColor: colorScheme.primary,
                  checkColor: colorScheme.onPrimary,
                  controlAffinity: ListTileControlAffinity.leading,
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text('Cancel',
                    style: TextStyle(color: colorScheme.primary)),
                onPressed: () => Navigator.of(context).pop(),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary),
                onPressed: () {
                  onSave(selected.value);
                  Navigator.of(context).pop();
                },
                child: Text('Save',
                    style: TextStyle(color: colorScheme.onPrimary)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DefaultQueryPC extends HookConsumerWidget {
  final OneLineDefaultQueryController controller;
  const DefaultQueryPC({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queries = ref.watch(defaultQueryDataProvider);
    final selected = useState(controller._selected);
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Row(
          children: [
            Text(
              'Default Query',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                context.push(const DefaultQueryListScreen());
              },
            ),
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: queries.queries.length,
          itemBuilder: (context, index) {
            final query = queries.queries[index];
            return CheckboxListTile(
              title: Text(query.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface)),
              subtitle: Text(query.query,
                  style: TextStyle(
                      fontSize: 12, color: colorScheme.onSurfaceVariant)),
              value: selected.value.selected.contains(query.id),
              onChanged: (value) {
                SelectDefaultQuery newSelected;
                if (value == true) {
                  newSelected = SelectDefaultQuery(
                    List.from(selected.value.selected)..add(query.id),
                    selected.value.newestId,
                  );
                } else {
                  newSelected = SelectDefaultQuery(
                    List.from(selected.value.selected)..remove(query.id),
                    selected.value.newestId,
                  );
                }
                selected.value = newSelected;
                controller._selected = newSelected;
              },
              activeColor: colorScheme.primary,
              checkColor: colorScheme.onPrimary,
              controlAffinity: ListTileControlAffinity.leading,
            );
          },
        ),
      ],
    );
  }
}
