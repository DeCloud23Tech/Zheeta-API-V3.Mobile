import 'package:flutter/material.dart';
import 'package:zheeta/common/constants/color.dart';

class PillContainer extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double padding;
  final double borderRadius;
  final IconData? icon;
  final Color iconColor;
  final bool hasGradient;

  const PillContainer({super.key,
    required this.text,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.pinkAccent,
    this.padding = 6.0,
    this.borderRadius = 20.0,
    this.icon,
    this.iconColor = AppColors.primaryDark,
    this.hasGradient = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: padding, vertical: padding / 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        gradient: hasGradient
            ? const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.primaryLight, AppColors.primaryDark],
              )
            : null,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        children: [
          if (icon != null)
            Icon(
              icon,
              color: iconColor,
              size: 14,
            ),
          SizedBox(width: 2),
          Text(
            text,
            style: TextStyle(
                color: textColor, fontSize: 10.0, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
