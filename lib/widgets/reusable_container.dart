import 'package:flutter/material.dart';

class ReusableCustomContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final double padding;
  final double borderRadius;

  ReusableCustomContainer({
    required this.child,
    this.color = Colors.white,
    this.padding = 15.0,
    this.borderRadius = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: child,
      ),
    );
  }
}
