import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';

class EmptyContent extends StatelessWidget {
  final Color? backgroundColor;
  final Color? indicatorColor;
  const EmptyContent({super.key, this.backgroundColor, this.indicatorColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ModalBarrier(
          dismissible: false,
          color: Colors.transparent,
          semanticsLabel: 'Loading',
          barrierSemanticsDismissible: false,
        ),
        Align(
          alignment: Alignment.center,
          child: Text('No Content'),
        ),
      ],
    );
  }
}

class LoadingContent extends StatelessWidget {
  final Color? backgroundColor;
  final Color? indicatorColor;
  const LoadingContent({super.key, this.backgroundColor, this.indicatorColor});

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

class BlockedUserContent extends StatelessWidget {
  final Color? backgroundColor;
  final Color? indicatorColor;
  const BlockedUserContent(
      {super.key, this.backgroundColor, this.indicatorColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ModalBarrier(
          dismissible: false,
          color: Colors.transparent,
          semanticsLabel: 'Loading',
          barrierSemanticsDismissible: false,
        ),
        Align(
          alignment: Alignment.center,
          child: Text('Cannot view this user'),
        ),
      ],
    );
  }
}
