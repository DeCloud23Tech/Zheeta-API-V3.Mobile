import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zheeta/app/common/color.dart';

Widget formatEventDateWidget(DateTime date) {
  final day = DateFormat('d').format(date);
  final month = DateFormat('MMM').format(date).toUpperCase();
  final year = DateFormat('y').format(date);

  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: '$day\n',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.black,
            fontSize: 12,
          ),
        ),
        TextSpan(
          text: '$month, $year',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: AppColors.black,
            fontSize: 9,
          ),
        ),
      ],
    ),
    textAlign: TextAlign.center,
  );
}
