import 'package:flutter/material.dart';

extension ContextSuger on BuildContext {
  void push(Widget page) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => page));
  }

  void pushReplacement(Widget page) {
    Navigator.of(this)
        .pushReplacement(MaterialPageRoute(builder: (context) => page));
  }

  void pop() {
    Navigator.of(this).pop();
  }

  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
}
