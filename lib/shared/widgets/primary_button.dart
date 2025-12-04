import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/core/constants/color.dart';

class PrimaryButton extends StatelessWidget {
  final bool state;
  final String title;
  final VoidCallback? action;
  final bool invert;
  final Color? color;
  final String? icon;
  final String? icon2;
  final bool showBorder;
  final bool disabled;
  final double fontSize;
  final double height;
  final double borderRadius;

  const PrimaryButton({
    super.key,
    this.state = false,
    required this.title,
    required this.action,
    this.invert = false,
    this.color,
    this.showBorder = false,
    this.icon,
    this.icon2,
    this.disabled = false,
    this.fontSize = 17,
    this.height = 48,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: disabled || state ? null : action,
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0.0),
          backgroundColor: WidgetStateProperty.all<Color>(
            invert
                ? (color ?? AppColors.white)
                : (disabled
                    ? AppColors.primaryDark.withOpacity(0.3)
                    : (color ?? AppColors.primaryDark)),
          ),
          overlayColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.pressed)) {
                return AppColors.primaryLight.withOpacity(0.5);
              }
              return null;
            },
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: showBorder
                  ? BorderSide(color: AppColors.primaryDark)
                  : BorderSide.none,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              SvgPicture.asset(
                icon!,
                colorFilter: ColorFilter.mode(
                  invert ? AppColors.primaryDark : AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 8),
            ],
            if (state)
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: invert ? AppColors.primaryDark : Colors.white,
                  strokeWidth: 2,
                ),
              )
            else
              Text(
                title,
                style: TextStyle(
                  color: invert ? AppColors.primaryDark : AppColors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            if (icon2 != null) ...[
              const SizedBox(width: 6),
              SvgPicture.asset(
                icon2!,
                colorFilter: ColorFilter.mode(
                  invert ? AppColors.primaryDark : AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
