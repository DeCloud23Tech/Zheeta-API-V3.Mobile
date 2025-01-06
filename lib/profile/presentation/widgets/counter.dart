// Method to build counter widget
import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';

import '../../../app/common/utils/format_utils.dart';

Widget buildCounterWidget({int? count, String? label}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      children: [
        Text(
          formatCount(count),
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 3),
        Text(
          label!,
          style: TextStyle(
            color: AppColors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}

