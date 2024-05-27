import 'package:flutter/material.dart';

import '../../../app/common/color.dart';

class InterestWidget extends StatelessWidget {
  const InterestWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        title,
        style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 12,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
