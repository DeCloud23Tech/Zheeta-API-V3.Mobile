import 'package:flutter/material.dart';
import 'package:zheeta/core/constants/color.dart';

class AgeRangeSelector extends StatefulWidget {
  final Function(int, int) onAgeRangeChanged;

  const AgeRangeSelector({super.key, required this.onAgeRangeChanged});

  @override
  State<AgeRangeSelector> createState() => _AgeRangeSelectorState();
}

class _AgeRangeSelectorState extends State<AgeRangeSelector> {
  RangeValues _currentRange = const RangeValues(18, 35); // Default age range

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Age Range: ${_currentRange.start.round()} - ${_currentRange.end.round()}',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          RangeSlider(
            values: _currentRange,
            min: 18,
            // Minimum age restriction
            max: 100,
            // You can adjust this max limit
            divisions: 82,
            // Creates ticks for every year from 18 to 100
            activeColor: AppColors.primaryDark,
            inactiveColor: AppColors.grey,
            labels: RangeLabels(
              _currentRange.start.round().toString(),
              _currentRange.end.round().toString(),
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _currentRange = values;
                widget.onAgeRangeChanged(
                    values.start.round(), values.end.round());
              });
            },
          ),
        ],
      ),
    );
  }
}
