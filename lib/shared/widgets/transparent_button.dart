import 'package:flutter/material.dart';
import 'package:zheeta/core/constants/color.dart';

class TransparentButton extends StatelessWidget {
  final String title;
  final VoidCallback action;
  final bool invert;
  final bool isBold;
  final double size;
  final EdgeInsetsGeometry padding;

  const TransparentButton({
    super.key,
    required this.title,
    required this.action,
    this.invert = false,
    this.isBold = false,
    this.size = 14,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: padding,
        child: Text(
          title,
          style: TextStyle(
            color: invert ? AppColors.white : AppColors.primaryDark,
            fontSize: size,
            fontWeight: isBold ? FontWeight.w500 : FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
