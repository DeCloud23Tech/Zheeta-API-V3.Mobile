import 'package:flutter/material.dart';
import 'package:zheeta/app/router/app_router.dart';

class NotifyUser {
  static showSnackbar(String message) {
    if (router.navigatorKey.currentContext != null) {
      ScaffoldMessenger.of(router.navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text(message),
          action: SnackBarAction(label: 'OK', textColor: Colors.grey, onPressed: () {}),
          behavior: SnackBarBehavior.fixed,
        ),
      );
    }
  }
}
