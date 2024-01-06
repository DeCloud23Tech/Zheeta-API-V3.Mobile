import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';

class TransparentButton extends StatelessWidget {
  final title;
  final action;
  final invert;
  const TransparentButton({
    Key? key,
    required this.title,
    required this.action,
    this.invert = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 56,
        child: ElevatedButton(
          onPressed: (action),
          child: Text(
            title,
            style: TextStyle(color: invert ? AppColors.white : AppColors.primaryDark, fontSize: 14, fontWeight: FontWeight.w400),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
            shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
            overlayColor: MaterialStateProperty.resolveWith(
              (states) {
                return states.contains(MaterialState.pressed) ? AppColors.primaryDark.withOpacity(0.2) : null;
              },
            ),
          ),
        ));
  }
}
