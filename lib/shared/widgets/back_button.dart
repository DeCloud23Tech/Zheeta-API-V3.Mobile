import 'package:flutter/material.dart';
import 'package:zheeta/core/constants/color.dart';

class CustomBackButton extends StatelessWidget {
  final bool isOpaque;
  final bool greyBackground;

  const CustomBackButton(
      {super.key, this.isOpaque = true, this.greyBackground = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: isOpaque
              ? greyBackground
                  ? Colors.transparent.withValues(alpha: 0.3)
                  : AppColors.white
              : AppColors.green.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Icon(Icons.arrow_back_ios,
                size: 18,
                color: isOpaque
                    ? greyBackground
                        ? AppColors.white
                        : AppColors.grey.withValues(alpha: 0.4)
                    : AppColors.white),
          ),
        ),
      ),
    );
  }
}

class AppBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? buttonColor;
  final Color? iconColor;
  final IconData? icon;

  const AppBackButton({
    super.key,
    this.onTap,
    this.buttonColor = AppColors.white,
    this.iconColor = AppColors.grey,
    this.icon = Icons.arrow_back_ios,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            // Ensure the context is valid for popping the router
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
      child: Container(
        width: 35,
        height: 35,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(100)),
        child: Center(
            child: Padding(
          padding:
              EdgeInsets.only(left: icon == Icons.arrow_back_ios ? 6.0 : 0.0),
          child: Icon(icon, size: 18, color: iconColor?.withValues(alpha: 0.8)),
        )),
      ),
    );
  }
}
