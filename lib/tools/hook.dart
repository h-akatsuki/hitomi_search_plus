import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hitomi_search_plus/component/custom_list.dart';

class WrapObject<T> {
  T value;

  WrapObject(this.value);
}

CustomListViewController useCustomListViewController({
  int initialPage = 0,
  StreamController<double>? progressStreamController,
  StreamController<int>? pageStreamController,
}) {
  return use(_CustomListViewControllerHook(
    initialPage: initialPage,
    progressStreamController: progressStreamController,
    pageStreamController: pageStreamController,
  ));
}

class _CustomListViewControllerHook extends Hook<CustomListViewController> {
  final int initialPage;
  final StreamController<double>? progressStreamController;
  final StreamController<int>? pageStreamController;

  const _CustomListViewControllerHook({
    this.initialPage = 0,
    this.progressStreamController,
    this.pageStreamController,
  });

  @override
  _CustomListViewControllerHookState createState() =>
      _CustomListViewControllerHookState();
}

class _CustomListViewControllerHookState
    extends HookState<CustomListViewController, _CustomListViewControllerHook> {
  late CustomListViewController _controller;

  @override
  void initHook() {
    super.initHook();
    _controller = CustomListViewController(
      initialPage: hook.initialPage,
      progressStreamController: hook.progressStreamController,
      pageStreamController: hook.pageStreamController,
    );
  }

  @override
  CustomListViewController build(BuildContext context) {
    return _controller;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

FixedSizeListViewController useFixedSizeListViewController({
  int initialPage = 0,
  StreamController<double>? progressStreamController,
  StreamController<int>? pageStreamController,
}) {
  return use(_FixedSizeListViewControllerHook(
    initialPage: initialPage,
    progressStreamController: progressStreamController,
    pageStreamController: pageStreamController,
  ));
}

class _FixedSizeListViewControllerHook
    extends Hook<FixedSizeListViewController> {
  final int initialPage;
  final StreamController<double>? progressStreamController;
  final StreamController<int>? pageStreamController;

  const _FixedSizeListViewControllerHook({
    this.initialPage = 0,
    this.progressStreamController,
    this.pageStreamController,
  });

  @override
  _FixedSizeListViewControllerHookState createState() =>
      _FixedSizeListViewControllerHookState();
}

class _FixedSizeListViewControllerHookState extends HookState<
    FixedSizeListViewController, _FixedSizeListViewControllerHook> {
  late FixedSizeListViewController _controller;

  @override
  void initHook() {
    super.initHook();
    _controller = FixedSizeListViewController(
      initialPage: hook.initialPage,
      progressStreamController: hook.progressStreamController,
      pageStreamController: hook.pageStreamController,
    );
  }

  @override
  FixedSizeListViewController build(BuildContext context) {
    return _controller;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
