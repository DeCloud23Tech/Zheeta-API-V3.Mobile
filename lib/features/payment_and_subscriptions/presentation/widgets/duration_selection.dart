import 'package:flutter/material.dart';
import 'package:zheeta/core/constants/color.dart';

class DurationSelection extends StatefulWidget {
  final String? selectedDuration; // Change to a non-late variable
  final List<String> durations;
  final ValueChanged<String> onDurationSelected;

  const DurationSelection(
      this.selectedDuration, this.durations, this.onDurationSelected,
      {super.key});

  @override
  State<DurationSelection> createState() => _DurationSelectionState();
}

class _DurationSelectionState extends State<DurationSelection> {
  late String? _currentSelectedDuration;

  @override
  void initState() {
    super.initState();
    _currentSelectedDuration =
        widget.selectedDuration; // Initialize the local variable
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceAround, // Center items and give equal spacing
      children: widget.durations.map((duration) {
        final isSelected =
            _currentSelectedDuration == duration; // Use the local variable
        return GestureDetector(
          onTap: () {
            setState(() {
              _currentSelectedDuration = duration; // Update the local variable
              widget.onDurationSelected(duration);
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isSelected // Change icon based on selection
                    ? Icons.check_circle_outline
                    : Icons.circle_outlined,
                color: AppColors.white,
                size: 25, // Ensure the icon size is appropriate
              ),
              SizedBox(width: 5), // Adjust spacing
              FittedBox(
                fit: BoxFit.scaleDown, // Use FittedBox to prevent overflow
                child: Text(
                  duration,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
