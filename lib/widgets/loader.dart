import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';

class Loader {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }
}

Widget LoadingIndicator() => Padding(
  padding: const EdgeInsets.all(100.0),
  child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            color: AppColors.primaryLight,
            strokeWidth: 2,
          ),
        ),
      ),
);
