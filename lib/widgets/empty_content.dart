import 'package:flutter/material.dart';

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
 