import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';

class AppRadioButton extends StatelessWidget {
  final String value;
  final String? groupValue;
  final Function(dynamic) onChanged;
  final bool showTitle;
  const AppRadioButton({
    super.key,
    required this.value,
    this.showTitle = true,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              onChanged(value);
            },
            child: Container(
              width: 24,
              height: 24,
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryDark, width: 1),
                borderRadius: BorderRadius.circular(100),
              ),
              child: value == groupValue
                  ? Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryDark,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    )
                  : SizedBox.shrink(),
            ),
          ),
          if (showTitle) SizedBox(width: 8),
          if (showTitle)
            GestureDetector(
              onTap: () {
                onChanged(value);
              },
              child: Text(
                value,
                style: TextStyle(fontSize: 12),
              ),
            ),
          if (showTitle) SizedBox(width: 14),
        ],
      ),
    );
  }
}

class AppMultipleSelectRadioButton extends StatelessWidget {
  final String value;
  final bool isActive;
  final Function(dynamic) onChanged;
  final bool showTitle;
  const AppMultipleSelectRadioButton({super.key, required this.value, this.showTitle = true, required this.isActive, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              onChanged(value);
            },
            child: Container(
              width: 24,
              height: 24,
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryDark, width: 1),
                borderRadius: BorderRadius.circular(100),
              ),
              child: isActive
                  ? Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryDark,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    )
                  : SizedBox.shrink(),
            ),
          ),
          if (showTitle) SizedBox(width: 8),
          if (showTitle)
            GestureDetector(
              onTap: () {
                onChanged(value);
              },
              child: Text(
                value,
                style: TextStyle(fontSize: 12),
              ),
            ),
          if (showTitle) SizedBox(width: 14),
        ],
      ),
    );
  }
}
