import 'package:flutter/material.dart';
import '../../../app/common/color.dart';

class GenderAgeWidget extends StatelessWidget {
  final String gender;
  final int age;

  const GenderAgeWidget({
    Key? key,
    required this.gender,
    required this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryLight,
            AppColors.primaryDark,
          ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            gender == 'F' ? Icons.female : Icons.male,
            color: Colors.white,
            size: 10,
          ),
          SizedBox(width: 3),
          Text(
            '$age',
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
