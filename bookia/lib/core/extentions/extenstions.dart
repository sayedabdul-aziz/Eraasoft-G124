import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  pushTo(Widget widget) {
    Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  pushReplacement(Widget widget) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}

bool isEmailValid(String value) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);
}
