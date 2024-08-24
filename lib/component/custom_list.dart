import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hitomi_search_plus/page/online_reader.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomListViewController {
  final StreamController<double> _scrollProgressController;
  final StreamController<int> _currentPageController;
  ScrollController? _scrollController;
  late int _itemCount;
  late List<double> _itemPositions;
  late double _totalHeight;
  final int initialPage;
  bool _isInitialJump = true;

  CustomListViewController({
    StreamController<double>? progressStreamController,
    StreamController<int>? pageStreamController,
    this.initialPage = 0,
  })  : _scrollProgressController =
            progressStreamController ?? StreamController<double>.broadcast(),
        _currentPageController =
            pageStreamController ?? StreamController<int>.broadcast();

  Stream<double> get scrollProgress => _scrollProgressController.stream;
  Stream<int> get currentPage => _currentPageController.stream;

  void _init(ScrollController controller, int itemCount,
      List<double> itemPositions, double totalHeight) {
    _scrollController = controller;
    _itemCount = itemCount;
    _itemPositions = itemPositions;
    _totalHeight = totalHeight;
    _scrollController!.addListener(_updateProgress);

    if (_isInitialJump && _itemCount > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        jump(initialPage);
        _isInitialJump = false;
      });
    }
  }

  void _updateProgress() {
    if (_scrollController != null && _totalHeight > 0) {
      final progress = _scrollController!.offset /
          (_totalHeight - _scrollController!.position.viewportDimension);
      _scrollProgressController.add(progress.clamp(0.0, 1.0));

      final currentIndex =
          _binarySearch(_itemPositions, _scrollController!.offset);
      _currentPageController.add(currentIndex.clamp(0, _itemCount - 1));
    }
  }

  void jump(int index) {
    if (_scrollController != null &&
        _itemCount > 0 &&
        index >= 0 &&
        index < _itemCount) {
      final targetPosition = _itemPositions[index];
      final viewportHeight = _scrollController!.position.viewportDimension;
      final centerOffset = math.max(0, targetPosition - (viewportHeight / 2));
      _scrollController!.jumpTo(
          centerOffset.toDouble().clamp(0.0, _totalHeight - viewportHeight));
    }
  }

  int _binarySearch(List<double> positions, double target) {
    int low = 0;
    int high = positions.length - 1;

    while (low <= high) {
      final mid = (low + high) ~/ 2;
      if (positions[mid] < target) {
        low = mid + 1;
      } else if (positions[mid] > target) {
        high = mid - 1;
      } else {
        return mid;
      }
    }

    return low;
  }

  void dispose() {
    _scrollProgressController.close();
    _currentPageController.close();
  }
}

class CustomListView extends StatefulWidget {
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final double Function(double width, int index) itemHeight;
  final CustomListViewController? controller;

  CustomListView({
    required this.itemBuilder,
    required this.itemCount,
    required this.itemHeight,
    this.controller,
  }) : super(key: UniqueKey());

  @override
  CustomListViewState createState() => CustomListViewState();
}

class CustomListViewState extends State<CustomListView> {
  late ScrollController _scrollController;
  late List<double> _itemPositions;
  late double _viewportHeight;
  late double _viewportWidth;
  late double _totalHeight;

  final Map<int, Widget> _itemCache = {};
  final Set<int> _visibleItemIndices = {};

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_updateVisibleItems);
    _itemPositions = [];
    _viewportHeight = 0;
    _viewportWidth = 0;
    _totalHeight = 0;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _calculateItemPositions() {
    _itemPositions = List.filled(widget.itemCount, 0);
    double currentPosition = 0;
    for (int i = 0; i < widget.itemCount; i++) {
      _itemPositions[i] = currentPosition;
      currentPosition += widget.itemHeight(_viewportWidth, i);
    }
    _totalHeight = currentPosition;

    widget.controller?._init(
        _scrollController, widget.itemCount, _itemPositions, _totalHeight);
  }

  void _updateVisibleItems() {
    if (widget.itemCount == 0) {
      setState(() {
        _visibleItemIndices.clear();
        _itemCache.clear();
      });
      return;
    }

    final scrollOffset = _scrollController.offset;
    final viewportBottom = scrollOffset + _viewportHeight;

    int startIndex =
        widget.controller?._binarySearch(_itemPositions, scrollOffset) ?? 0;
    startIndex = math.max(0, startIndex - 1);

    int endIndex =
        widget.controller?._binarySearch(_itemPositions, viewportBottom) ??
            widget.itemCount - 1;
    endIndex = math.min(widget.itemCount - 1, endIndex + 1);

    final newVisibleIndices = Set<int>.from(List.generate(
        endIndex - startIndex + 1, (index) => startIndex + index));

    if (setEquals(newVisibleIndices, _visibleItemIndices)) return;

    setState(() {
      final itemsToRemove = _visibleItemIndices.difference(newVisibleIndices);
      for (final index in itemsToRemove) {
        _itemCache.remove(index);
      }
      _visibleItemIndices.clear();
      _visibleItemIndices.addAll(newVisibleIndices);
    });
  }

  Widget _buildItem(int index) {
    return _itemCache.putIfAbsent(index, () {
      return SizedBox(
        height: widget.itemHeight(_viewportWidth, index),
        child: widget.itemBuilder(context, index),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _viewportWidth = constraints.maxWidth;
        _viewportHeight = constraints.maxHeight;
        _calculateItemPositions();

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_visibleItemIndices.isEmpty && widget.itemCount > 0) {
            _updateVisibleItems();
          }
        });

        if (widget.itemCount == 0) {
          return SizedBox(
            width: _viewportWidth,
            height: _viewportHeight,
          );
        }

        return SingleChildScrollView(
          controller: _scrollController,
          child: SizedBox(
            width: _viewportWidth,
            height: _totalHeight,
            child: Stack(
              children: _visibleItemIndices.map((index) {
                return Positioned(
                  key: ValueKey(widget.key.toString() + index.toString()),
                  top: _itemPositions[index],
                  left: 0,
                  right: 0,
                  height: widget.itemHeight(_viewportWidth, index),
                  child: _buildItem(index),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

class FixedSizeListViewController {
  final StreamController<double> _scrollProgressController;
  final StreamController<int> _currentPageController;
  ScrollController? _scrollController;
  late int _itemCount;
  late double _itemHeight;
  late double _totalHeight;
  final int initialPage;
  bool _isInitialJump = true;

  FixedSizeListViewController({
    StreamController<double>? progressStreamController,
    StreamController<int>? pageStreamController,
    this.initialPage = 0,
  })  : _scrollProgressController =
            progressStreamController ?? StreamController<double>.broadcast(),
        _currentPageController =
            pageStreamController ?? StreamController<int>.broadcast();

  Stream<double> get scrollProgress => _scrollProgressController.stream;
  Stream<int> get currentPage => _currentPageController.stream;

  void _init(ScrollController controller, int itemCount, double itemHeight,
      double totalHeight) {
    _scrollController = controller;
    _itemCount = itemCount;
    _itemHeight = itemHeight;
    _totalHeight = totalHeight;
    _scrollController!.addListener(_updateProgress);

    if (_isInitialJump && _itemCount > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        jump(initialPage);
        _isInitialJump = false;
      });
    }
  }

  void _updateProgress() {
    if (_scrollController != null && _totalHeight > 0) {
      final progress = _scrollController!.offset /
          (_totalHeight - _scrollController!.position.viewportDimension);
      _scrollProgressController.add(progress.clamp(0.0, 1.0));

      final currentIndex = (_scrollController!.offset / _itemHeight).floor();
      _currentPageController.add(currentIndex.clamp(0, _itemCount - 1));
    }
  }

  void jump(int index) {
    if (_scrollController != null &&
        _itemCount > 0 &&
        index >= 0 &&
        index < _itemCount) {
      final targetPosition = index * _itemHeight;
      final viewportHeight = _scrollController!.position.viewportDimension;
      final centerOffset = math.max(0, targetPosition - (viewportHeight / 2));
      _scrollController!.jumpTo(
          centerOffset.toDouble().clamp(0.0, _totalHeight - viewportHeight));
    }
  }

  void dispose() {
    _scrollProgressController.close();
    _currentPageController.close();
  }
}

class FixedSizeCustomListView extends StatefulWidget {
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final double itemHeight;
  final FixedSizeListViewController? controller;

  FixedSizeCustomListView({
    required this.itemBuilder,
    required this.itemCount,
    required this.itemHeight,
    this.controller,
  }) : super(key: UniqueKey());

  @override
  FixedSizeCustomListViewState createState() => FixedSizeCustomListViewState();
}

class FixedSizeCustomListViewState extends State<FixedSizeCustomListView> {
  late ScrollController _scrollController;
  late double _totalHeight;
  final Map<int, Widget> _itemCache = {};
  late Set<int> _visibleItemIndices;
  static const int _cacheExtent = 10;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_updateVisibleItems);
    _totalHeight = widget.itemCount * widget.itemHeight;
    _visibleItemIndices = {};
    widget.controller?._init(
        _scrollController, widget.itemCount, widget.itemHeight, _totalHeight);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateVisibleItems();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _itemCache.clear();
    super.dispose();
  }

  void _updateVisibleItems() {
    if (widget.itemCount == 0) {
      setState(() {
        _visibleItemIndices.clear();
        _itemCache.clear();
      });
      return;
    }

    final startIndex = (_scrollController.offset / widget.itemHeight).floor();
    final endIndex = (((_scrollController.offset +
                    _scrollController.position.viewportDimension) /
                widget.itemHeight)
            .ceil())
        .clamp(0, widget.itemCount - 1);

    final newVisibleIndices = Set<int>.from(
        List<int>.generate(endIndex - startIndex + 1, (i) => i + startIndex));

    final cacheStartIndex = math.max(0, startIndex - _cacheExtent);
    final cacheEndIndex =
        math.min(widget.itemCount - 1, endIndex + _cacheExtent);

    setState(() {
      _visibleItemIndices = newVisibleIndices;
      _itemCache.removeWhere(
          (index, _) => index < cacheStartIndex || index > cacheEndIndex);
    });

    widget.controller?._updateProgress();
  }

  Widget _buildItem(int index) {
    return _itemCache.putIfAbsent(
        index, () => widget.itemBuilder(context, index));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.itemCount == 0) {
      return const SizedBox.shrink();
    }

    return SingleChildScrollView(
      controller: _scrollController,
      child: SizedBox(
        height: _totalHeight,
        child: Stack(
          children: _visibleItemIndices
              .map((index) => Positioned(
                    key: ValueKey(widget.key.toString() + index.toString()),
                    top: index * widget.itemHeight,
                    left: 0,
                    right: 0,
                    height: widget.itemHeight,
                    child: _buildItem(index),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class CustomListViewForReader extends StatefulWidget {
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final double Function(double width, double height, int index) itemHeight;
  final CustomListViewController? controller;

  CustomListViewForReader({
    required this.itemBuilder,
    required this.itemCount,
    required this.itemHeight,
    this.controller,
  }) : super(key: UniqueKey());

  @override
  CustomListViewStateFR createState() => CustomListViewStateFR();
}

class CustomListViewForReaderLock extends StatefulWidget {
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final double Function(double width, double height, int index) itemHeight;
  final CustomListViewController? controller;

  CustomListViewForReaderLock({
    required this.itemBuilder,
    required this.itemCount,
    required this.itemHeight,
    this.controller,
  }) : super(key: UniqueKey());

  @override
  CustomListViewStateFRLock createState() => CustomListViewStateFRLock();
}

class SingleChildScrollViewLock extends ConsumerWidget {
  final Widget child;
  final ScrollController controller;

  const SingleChildScrollViewLock(
      {super.key, required this.child, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lock = ref.watch(canEditProvider);
    return SingleChildScrollView(
      physics: lock
          ? const NeverScrollableScrollPhysics()
          : const BouncingScrollPhysics(),
      controller: controller,
      child: child,
    );
  }
}

class CustomListViewStateFRLock extends State<CustomListViewForReaderLock> {
  late ScrollController _scrollController;
  late List<double> _itemPositions;
  late double _viewportHeight;
  late double _viewportWidth;
  late double _totalHeight;

  final Map<int, Widget> _itemCache = {};
  final Set<int> _visibleItemIndices = {};

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_updateVisibleItems);
    _itemPositions = [];
    _viewportHeight = 0;
    _viewportWidth = 0;
    _totalHeight = 0;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _calculateItemPositions() {
    _itemPositions = List.filled(widget.itemCount, 0);
    double currentPosition = 0;
    for (int i = 0; i < widget.itemCount; i++) {
      _itemPositions[i] = currentPosition;
      currentPosition += widget.itemHeight(_viewportWidth, _viewportHeight, i);
    }
    _totalHeight = currentPosition;

    widget.controller?._init(
        _scrollController, widget.itemCount, _itemPositions, _totalHeight);
  }

  void _updateVisibleItems() {
    if (widget.itemCount == 0) {
      setState(() {
        _visibleItemIndices.clear();
        _itemCache.clear();
      });
      return;
    }

    final scrollOffset = _scrollController.offset;
    final viewportBottom = scrollOffset + _viewportHeight;

    int startIndex =
        widget.controller?._binarySearch(_itemPositions, scrollOffset) ?? 0;
    startIndex = math.max(0, startIndex - 1);

    int endIndex =
        widget.controller?._binarySearch(_itemPositions, viewportBottom) ??
            widget.itemCount - 1;
    endIndex = math.min(widget.itemCount - 1, endIndex + 1);

    final newVisibleIndices = Set<int>.from(List.generate(
        endIndex - startIndex + 1, (index) => startIndex + index));

    if (setEquals(newVisibleIndices, _visibleItemIndices)) return;

    setState(() {
      final itemsToRemove = _visibleItemIndices.difference(newVisibleIndices);
      for (final index in itemsToRemove) {
        _itemCache.remove(index);
      }
      _visibleItemIndices.clear();
      _visibleItemIndices.addAll(newVisibleIndices);
    });
  }

  Widget _buildItem(int index) {
    return _itemCache.putIfAbsent(index, () {
      return SizedBox(
        height: widget.itemHeight(_viewportWidth, _viewportHeight, index),
        width: _viewportWidth,
        child: widget.itemBuilder(context, index),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _viewportWidth = constraints.maxWidth;
        _viewportHeight = constraints.maxHeight;
        _calculateItemPositions();

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_visibleItemIndices.isEmpty && widget.itemCount > 0) {
            _updateVisibleItems();
          }
        });

        if (widget.itemCount == 0) {
          return SizedBox(
            width: _viewportWidth,
            height: _viewportHeight,
          );
        }

        return SingleChildScrollViewLock(
          controller: _scrollController,
          child: SizedBox(
            width: _viewportWidth,
            height: _totalHeight,
            child: Stack(
              children: _visibleItemIndices.map((index) {
                return Positioned(
                  key: ValueKey(widget.key.toString() + index.toString()),
                  top: _itemPositions[index],
                  left: 0,
                  right: 0,
                  height:
                      widget.itemHeight(_viewportWidth, _viewportHeight, index),
                  child: _buildItem(index),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

class CustomListViewStateFR extends State<CustomListViewForReader> {
  late ScrollController _scrollController;
  late List<double> _itemPositions;
  late double _viewportHeight;
  late double _viewportWidth;
  late double _totalHeight;

  final Map<int, Widget> _itemCache = {};
  final Set<int> _visibleItemIndices = {};

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_updateVisibleItems);
    _itemPositions = [];
    _viewportHeight = 0;
    _viewportWidth = 0;
    _totalHeight = 0;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _calculateItemPositions() {
    _itemPositions = List.filled(widget.itemCount, 0);
    double currentPosition = 0;
    for (int i = 0; i < widget.itemCount; i++) {
      _itemPositions[i] = currentPosition;
      currentPosition += widget.itemHeight(_viewportWidth, _viewportHeight, i);
    }
    _totalHeight = currentPosition;

    widget.controller?._init(
        _scrollController, widget.itemCount, _itemPositions, _totalHeight);
  }

  void _updateVisibleItems() {
    if (widget.itemCount == 0) {
      setState(() {
        _visibleItemIndices.clear();
        _itemCache.clear();
      });
      return;
    }

    final scrollOffset = _scrollController.offset;
    final viewportBottom = scrollOffset + _viewportHeight;

    int startIndex =
        widget.controller?._binarySearch(_itemPositions, scrollOffset) ?? 0;
    startIndex = math.max(0, startIndex - 1);

    int endIndex =
        widget.controller?._binarySearch(_itemPositions, viewportBottom) ??
            widget.itemCount - 1;
    endIndex = math.min(widget.itemCount - 1, endIndex + 1);

    final newVisibleIndices = Set<int>.from(List.generate(
        endIndex - startIndex + 1, (index) => startIndex + index));

    if (setEquals(newVisibleIndices, _visibleItemIndices)) return;

    setState(() {
      final itemsToRemove = _visibleItemIndices.difference(newVisibleIndices);
      for (final index in itemsToRemove) {
        _itemCache.remove(index);
      }
      _visibleItemIndices.clear();
      _visibleItemIndices.addAll(newVisibleIndices);
    });
  }

  Widget _buildItem(int index) {
    return _itemCache.putIfAbsent(index, () {
      return SizedBox(
        height: widget.itemHeight(_viewportWidth, _viewportHeight, index),
        width: _viewportWidth,
        child: widget.itemBuilder(context, index),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _viewportWidth = constraints.maxWidth;
        _viewportHeight = constraints.maxHeight;
        _calculateItemPositions();

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_visibleItemIndices.isEmpty && widget.itemCount > 0) {
            _updateVisibleItems();
          }
        });

        if (widget.itemCount == 0) {
          return SizedBox(
            width: _viewportWidth,
            height: _viewportHeight,
          );
        }

        return SingleChildScrollView(
          controller: _scrollController,
          child: SizedBox(
            width: _viewportWidth,
            height: _totalHeight,
            child: Stack(
              children: _visibleItemIndices.map((index) {
                return Positioned(
                  key: ValueKey(widget.key.toString() + index.toString()),
                  top: _itemPositions[index],
                  left: 0,
                  right: 0,
                  height:
                      widget.itemHeight(_viewportWidth, _viewportHeight, index),
                  child: _buildItem(index),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
