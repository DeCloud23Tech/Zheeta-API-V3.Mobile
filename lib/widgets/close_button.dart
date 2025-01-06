import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';

class AppCloseButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? iconColor;

  const AppCloseButton({
    super.key,
    this.icon = Icons.close,
    this.backgroundColor = AppColors.white,
    this.iconColor = AppColors.grey,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => context.router.back(),
      // Fallback to router.back if no onTap provided
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 5),
        decoration: BoxDecoration(
          color: backgroundColor?.withOpacity(0.5),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Icon(icon, size: 25, color: iconColor),
        ),
      ),
    );
  }
}
