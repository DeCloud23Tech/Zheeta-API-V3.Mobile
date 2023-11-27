import 'package:flutter/material.dart';
import 'package:zheeta/config/router.dart';
import 'package:zheeta/core/constants/color.dart';

notify(type, message) {
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(SnackBar(
      backgroundColor: type == 'success' ? green : red,
      content: Text(message)));
}
