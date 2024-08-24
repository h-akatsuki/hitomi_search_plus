import 'package:flutter/material.dart';

extension ContextSuger on BuildContext {
  void push(Widget page) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => page));
  }

  ThemeData get theme => Theme.of(this);
}
