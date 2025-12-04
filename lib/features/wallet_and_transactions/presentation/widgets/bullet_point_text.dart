import 'package:flutter/material.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/extensions/int_extension.dart';
import 'package:zheeta/core/utils/extensions/string_extension.dart';

class BulletPointRow extends StatelessWidget {
  final String text;
  final String value;
  final Color iconColor;

  const BulletPointRow({
    super.key,
    required this.text,
    required this.value,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Icon(
            Icons.brightness_1,
            size: 10,
            color: iconColor,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: iconColor,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 4),
            Text(
              (value.roundToInt).toAbbreviatedCount(),
              style: TextStyle(
                color: iconColor == AppColors.white
                    ? AppColors.white
                    : Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
