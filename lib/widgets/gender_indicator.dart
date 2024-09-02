import 'package:flutter/material.dart';
import '../../../app/common/color.dart';

class GenderIndicator extends StatelessWidget {
  final String gender;

  const GenderIndicator({
    Key? key,
    required this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 25,
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
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
