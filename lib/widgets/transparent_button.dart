import 'package:flutter/material.dart';
import 'package:zheeta/common/constants/color.dart';

class TransparentButton extends StatelessWidget {
  final String title;
  final VoidCallback action;
  final bool invert;

  const TransparentButton({
    super.key,
    required this.title,
    required this.action,
    this.invert = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 56,
        child: ElevatedButton(
          onPressed: (action),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
            shadowColor: WidgetStateProperty.all<Color>(Colors.transparent),
            overlayColor: WidgetStateProperty.resolveWith(
              (states) {
                return states.contains(MaterialState.pressed)
                    ? AppColors.primaryDark.withOpacity(0.2)
                    : null;
              },
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
                color: invert ? AppColors.white : AppColors.primaryDark,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ));
  }
}

class TransparentButtonNew extends StatelessWidget {
  final String title;
  final VoidCallback action;
  final bool invert;
  final bool isBold;
  final double size;

  const TransparentButtonNew({
    super.key,
    required this.title,
    required this.action,
    this.invert = false,
    this.isBold = false,
    this.size = 14,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (action),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          title,
          style: TextStyle(
              color: invert ? AppColors.white : AppColors.primaryDark,
              fontSize: size,
              fontWeight: isBold ? FontWeight.w500 : FontWeight.w300),
        ),
      ),
    );
  }
}
