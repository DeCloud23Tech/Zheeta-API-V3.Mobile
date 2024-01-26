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
