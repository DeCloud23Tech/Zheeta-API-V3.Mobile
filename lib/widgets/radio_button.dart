import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';

import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';

class AppRadioButton extends StatelessWidget {
  final String value;
  final String? groupValue;
  final ValueChanged<String> onChanged;
  final bool showTitle;
  final String? title;
  final double size;
  final Color activeColor;
  final Color borderColor;
  final Color textColor;

  const AppRadioButton({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.showTitle = true,
    this.title,
    this.textColor = AppColors.grayscale,
    this.size = 18,
    this.activeColor = AppColors.primaryDark,
    this.borderColor = AppColors.primaryDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildRadio(),
          if (showTitle && title != null) SizedBox(width: 8),
          if (showTitle && title != null)
            GestureDetector(
              onTap: () => onChanged(value),
              child: Text(
                title!,
                style: TextStyle(fontSize: 14, color: textColor),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRadio() {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: 1),
      ),
      child: value == groupValue
          ? Container(
              decoration: BoxDecoration(
                color: activeColor,
                shape: BoxShape.circle,
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}

class AppMultipleSelectRadioButton extends StatelessWidget {
  final String value;
  final bool isActive;
  final ValueChanged<String> onChanged;
  final bool showTitle;
  final String? title;
  final double size;
  final Color activeColor;
  final Color borderColor;
  final Color textColor;

  const AppMultipleSelectRadioButton({
    Key? key,
    required this.value,
    required this.isActive,
    required this.onChanged,
    this.showTitle = true,
    this.title,
    this.textColor = AppColors.grayscale,
    this.size = 18,
    this.activeColor = AppColors.primaryDark,
    this.borderColor = AppColors.primaryDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildRadio(),
          if (showTitle && title != null) SizedBox(width: 8),
          if (showTitle && title != null)
            GestureDetector(
              onTap: () => onChanged(value),
              child: Text(
                title!,
                style: TextStyle(fontSize: 14, color: textColor),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRadio() {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: 2),
      ),
      child: isActive
          ? Container(
              decoration: BoxDecoration(
                color: activeColor,
                shape: BoxShape.circle,
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
