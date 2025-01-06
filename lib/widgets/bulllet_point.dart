import 'package:flutter/material.dart';

class BulletPoint extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color? bulletColor;
  final TextStyle? textStyle;

  const BulletPoint({
    required this.text,
    this.icon,
    this.bulletColor = Colors.white,
    this.textStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: icon == null
              ? Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: bulletColor,
              shape: BoxShape.circle,
            ),
          )
              : Icon(
            icon,
            size: 10,
            color: bulletColor,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
