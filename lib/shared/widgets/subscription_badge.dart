import 'package:flutter/material.dart';
import 'package:zheeta/core/constants/color.dart';

class SubscriptionBadge extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final BorderRadius borderRadius;
  final double blurRadius;
  final Offset shadowOffset;
  final Color shadowColor;

  const SubscriptionBadge({
    super.key,
    required this.text,
    this.backgroundColor = AppColors.goldSubscription,
    this.textColor = AppColors.white,
    this.fontSize = 10,
    this.fontWeight = FontWeight.w600,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    this.margin = const EdgeInsets.symmetric(horizontal: 8),
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
    this.blurRadius = 2.0,
    this.shadowOffset = const Offset(0, 1),
    this.shadowColor = const Color(0x80000000), // Semi-transparent black
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: blurRadius,
            offset: shadowOffset,
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        ),
      ),
    );
  }
}
