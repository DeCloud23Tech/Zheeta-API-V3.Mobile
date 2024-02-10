import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';

class PrimaryButton extends StatelessWidget {
  final bool state;
  final title;
  final VoidCallback? action;
  final bool invert;
  final Color? color;
  final String? icon;
  final String? icon2;
  final bool showBorder;
  const PrimaryButton({Key? key, this.state = false, required this.title, required this.action, this.invert = false, this.color, this.showBorder = false, this.icon, this.icon2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: ElevatedButton(
        onPressed: state ? null : action,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? Row(
                    children: [
                      SvgPicture.asset(
                        icon!,
                        colorFilter: ColorFilter.mode(invert ? AppColors.primaryDark : AppColors.white, BlendMode.srcIn),
                      ),
                      SizedBox(width: 5)
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
                    style: TextStyle(color: invert ? AppColors.primaryDark : AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
                  ),
            icon2 != null
                ? Row(children: [
                    SizedBox(width: 5),
                    SvgPicture.asset(icon2!, colorFilter: ColorFilter.mode(invert ? AppColors.primaryDark : AppColors.white, BlendMode.srcIn)),
                  ])
                : SizedBox(),
          ],
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          backgroundColor: MaterialStateProperty.all<Color>(
            (invert
                ? color != null
                    ? color!
                    : AppColors.white
                : color != null
                    ? color!
                    : AppColors.primaryDark),
          ),
          // shadowColor: MaterialStateProperty.all<Color>(invert
          //     ? white
          //     : color != null
          //         ? color
          //         : primaryDark)),
          overlayColor: MaterialStateProperty.resolveWith(
            (states) {
              return states.contains(MaterialState.pressed) ? AppColors.primaryLight.withOpacity(0.5) : null;
            },
          ),

          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: showBorder ? BorderSide(color: AppColors.primaryDark) : BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
