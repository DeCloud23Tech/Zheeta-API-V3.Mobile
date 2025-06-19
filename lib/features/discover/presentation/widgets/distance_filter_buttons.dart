import 'package:flutter/material.dart';
import 'package:zheeta/common/constants/color.dart';

class DistanceFilterButton extends StatelessWidget {
  final String distance;
  final bool isSelected;
  final VoidCallback onPressed;

  const DistanceFilterButton({
    super.key,
    required this.distance,
    this.isSelected = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? AppColors.white : AppColors.grayscale,
        backgroundColor: isSelected ? AppColors.grayscale : AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      child: Text(
        distance,
        style: TextStyle(
          fontSize: 12,
          color: isSelected ? AppColors.white : AppColors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class DistanceFilterRow extends StatelessWidget {
  final List<String> distances;
  final String selectedDistance;
  final Function(String) onDistanceSelected;

  const DistanceFilterRow({
    super.key,
    required this.distances,
    required this.selectedDistance,
    required this.onDistanceSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      runSpacing: 7,
      children: distances.map((distance) {
        return DistanceFilterButton(
          distance: distance,
          isSelected: distance == selectedDistance,
          onPressed: () => onDistanceSelected(distance),
        );
      }).toList(),
    );
  }
}
