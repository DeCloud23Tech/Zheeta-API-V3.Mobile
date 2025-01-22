import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/common/constants/color.dart';

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
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 53,
      child: ElevatedButton(
        onPressed: disabled
            ? null
            : state
                ? null
                : action,
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0.0),
          backgroundColor: WidgetStateProperty.all<Color>(
            (invert
                ? color != null
                    ? color!
                    : AppColors.white
                : color != null
                    ? color!
                    : disabled
                        ? AppColors.primaryDark.withOpacity(0.3)
                        : AppColors.primaryDark),
          ),
          overlayColor: WidgetStateProperty.resolveWith(
            (states) {
              return states.contains(WidgetState.pressed)
                  ? AppColors.primaryLight.withOpacity(0.5)
                  : null;
            },
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: showBorder
                  ? BorderSide(color: AppColors.primaryDark)
                  : BorderSide.none,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? Row(
                    children: [
                      SvgPicture.asset(
                        icon!,
                        colorFilter: ColorFilter.mode(
                            invert ? AppColors.primaryDark : AppColors.white,
                            BlendMode.srcIn),
                      ),
                      SizedBox(width: 10)
                    ],
                  )
                : SizedBox(),
            state
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: invert ? AppColors.primaryDark : Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    title,
                    style: TextStyle(
                        color: invert ? AppColors.primaryDark : AppColors.white,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w400),
                  ),
            icon2 != null
                ? Row(children: [
                    SizedBox(width: 5),
                    SvgPicture.asset(icon2!,
                        colorFilter: ColorFilter.mode(
                            invert ? AppColors.primaryDark : AppColors.white,
                            BlendMode.srcIn)),
                  ])
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
