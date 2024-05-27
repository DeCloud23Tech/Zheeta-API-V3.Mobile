import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';

class PillContainer extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double padding;
  final double borderRadius;
  final IconData? icon;

  PillContainer({
    required this.text,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.pinkAccent,
    this.padding = 6.0,
    this.borderRadius = 20.0,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: padding * 1.5, vertical: padding / 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        children: [
          if(icon != null)
          Icon(
            icon,
            color: AppColors.primaryDark,
            size: 18,
          ),
          SizedBox(width: 2),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w400
            ),
          ),
        ],
      ),
    );
  }
}
