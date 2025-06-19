import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/common/constants/color.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? textColor;
  final VoidCallback? onPressed;

  const CustomIconButton({super.key,
    required this.icon,
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
              child: Icon(
                icon,
                color: AppColors.primaryDark,
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        Text(
          text,
          style: TextStyle(
            color: textColor ?? Colors.white, // Default color
            fontSize: 12,
            fontWeight: FontWeight.w400
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}


Widget buildButton(
    {required String text, required IconData icon, bool isActive = false, onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 18, right: 24),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryDark : AppColors.secondaryLight,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
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
