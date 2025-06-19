import 'package:flutter/material.dart';
import 'package:zheeta/common/constants/color.dart';

class GenderIndicator extends StatelessWidget {
  final String gender;

  const GenderIndicator({
    super.key,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 20,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: gender == 'F' ? AppColors.primaryDark : AppColors.green,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          gender == '1'
              ? 'M'
              : gender == '2'
                  ? 'F'
                  : gender,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
