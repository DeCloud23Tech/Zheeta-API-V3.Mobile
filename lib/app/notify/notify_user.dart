import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zheeta/app/color.dart';

class NotifyUser {
  static showToast(String? message, [bool error = false]) {
    if (message?.isNotEmpty ?? false) {
      return Fluttertoast.showToast(
        msg: message!,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: error ? AppColors.secondarySwirl : Colors.white,
        textColor: Colors.black,
        fontSize: 16.0,
      );
    }
  }
}
