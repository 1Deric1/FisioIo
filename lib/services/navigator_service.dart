import 'package:flutter/material.dart';

import '../main.dart';

class KNavigator {
  late final NavigatorState _nav;

  final Object? arguments;

  KNavigator({this.arguments}) {
    if (kGlobalKeyNavigator.currentState != null) {
      _nav = kGlobalKeyNavigator.currentState!;
    } else {
      throw Exception('Navigator needs state!');
    }
  }

  void pop() {
    _nav.pop();
  }

  Future pushNamed(String page) {
    return _nav.pushNamed(page, arguments: arguments);
  }

  Future pushReplacementNamed(String page) {
    return _nav.pushReplacementNamed(page, arguments: arguments);
  }

  Future popAndPushNamed(String page) {
    return _nav.popAndPushNamed(page, arguments: arguments);
  }

  Future removeAllAndPush(String page) {
    return _nav.pushNamedAndRemoveUntil(page, (Route<dynamic> route) => false,
        arguments: arguments);
  }
}
