import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';

class LoadingScreen extends StatelessWidget {
  final Color? backgroundColor;
  final Color? indicatorColor;
  const LoadingScreen({super.key, this.backgroundColor, this.indicatorColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ModalBarrier(
          dismissible: false,
          color: backgroundColor ?? AppColors.primaryDark.withOpacity(0.7),
          semanticsLabel: 'Loading',
          barrierSemanticsDismissible: false,
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              color: indicatorColor ?? Colors.white,
              strokeWidth: 2,
            ),
          ),
        ),
      ],
    );
  }
}
