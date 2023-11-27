import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/core/constants/color.dart';

class PrimaryButton extends StatelessWidget {
  final state;
  final title;
  final action;
  final invert;
  final color;
  final icon;
  final icon2;
  const PrimaryButton(
      {Key? key,
      this.state = false,
      required this.title,
      required this.action,
      this.invert = false,
      this.color,
      this.icon,
      this.icon2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 56,
        child: ElevatedButton(
            onPressed: (action),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon != null
                    ? Row(children: [
                        SvgPicture.asset(icon,
                            colorFilter: ColorFilter.mode(
                                invert ? primaryDark : white, BlendMode.srcIn)),
                        SizedBox(width: 5)
                      ])
                    : SizedBox(),
                state
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ))
                    : Text(
                        title,
                        style: TextStyle(
                            color: invert ? primaryDark : white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                icon2 != null
                    ? Row(children: [
                        SizedBox(width: 5),
                        SvgPicture.asset(icon2,
                            colorFilter: ColorFilter.mode(
                                invert ? primaryDark : white, BlendMode.srcIn)),
                      ])
                    : SizedBox(),
              ],
            ),
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0.0),
                backgroundColor: MaterialStateProperty.all<Color>(invert
                    ? color != null
                        ? color
                        : white
                    : color != null
                        ? color
                        : primaryDark),
                // shadowColor: MaterialStateProperty.all<Color>(invert
                //     ? white
                //     : color != null
                //         ? color
                //         : primaryDark)),
                overlayColor: MaterialStateProperty.resolveWith(
                  (states) {
                    return states.contains(MaterialState.pressed)
                        ? primaryLight.withOpacity(0.5)
                        : null;
                  },
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  // side: BorderSide(color: Colors.red)
                )))));
  }
}
