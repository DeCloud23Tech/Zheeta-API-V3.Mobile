import 'package:flutter/material.dart';
import 'package:zheeta/common/constants/color.dart';


class LinearProgressTracking extends StatelessWidget {
  final List<double> values;
  final List<Color> colors;

  const LinearProgressTracking({
    super.key,
    required this.values,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        values.length,
            (index) => Expanded(
          child: LinearProgressIndicator(
            value: values[index],
            backgroundColor: AppColors.grayscale.withOpacity(0.3),
            valueColor: AlwaysStoppedAnimation<Color>(
              colors[index],
            ),
          ),
        ),
      ),
    );
  }
}
