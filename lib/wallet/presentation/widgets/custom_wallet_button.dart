import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/common/color.dart';



class CustomIconButton extends StatelessWidget {
  final String iconPath;
  final String text;
  final Color? textColor;
  final VoidCallback? onPressed;

  const CustomIconButton({
    required this.iconPath,
    required this.text,
    this.textColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: AppColors.secondaryLight,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                iconPath,
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        Text(
          text,
          style: TextStyle(
            color: textColor ?? Colors.white, // Default color
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}


Widget buildButton(
    {required String text, required IconData icon, bool isActive = false}) {
  return Container(
    padding: EdgeInsets.only(top: 10, bottom: 10, left: 18, right: 24),
    decoration: BoxDecoration(
      color: isActive ? AppColors.primaryDark : AppColors.secondaryLight,
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
    ),
    child: Expanded(
      child: Row(
        children: [
          Icon(
            icon,
            color: isActive ? AppColors.white : AppColors.primaryDark,
            size: 20,
          ),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ),
  );
}
