import 'package:flutter/material.dart';
import 'package:zheeta/core/constants/color.dart';

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
  final FontWeight textFontWeight;

  const AppRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.showTitle = true,
    this.title,
    this.textColor = AppColors.grayscale,
    this.textFontWeight = FontWeight.w400,
    this.size = 18,
    this.activeColor = AppColors.primaryDark,
    this.borderColor = AppColors.primaryDark,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      behavior: HitTestBehavior.opaque,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 44,
          minWidth: 72,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildRadio(),
            if (showTitle && title != null) SizedBox(width: 10),
            if (showTitle && title != null)
              GestureDetector(
                onTap: () => onChanged(value),
                behavior: HitTestBehavior.opaque,
                child: Text(
                  title!,
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor,
                    fontWeight: textFontWeight,
                  ),
                ),
              ),
          ],
        ),
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
  final bool useCheckbox;
  final Color activeColor;
  final Color borderColor;
  final Color textColor;
  final FontWeight textFontWeight;

  const AppMultipleSelectRadioButton({
    super.key,
    required this.value,
    required this.isActive,
    required this.onChanged,
    this.showTitle = true,
    this.title,
    this.textColor = AppColors.grayscale,
    this.textFontWeight = FontWeight.w400,
    this.size = 18,
    this.useCheckbox = false,
    this.activeColor = AppColors.primaryDark,
    this.borderColor = AppColors.primaryDark,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      behavior: HitTestBehavior.opaque,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 44,
          minWidth: 72,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSelectionIndicator(),
            if (showTitle && title != null) SizedBox(width: 10),
            if (showTitle && title != null)
              GestureDetector(
                onTap: () => onChanged(value),
                behavior: HitTestBehavior.opaque,
                child: Text(
                  title!,
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor,
                    fontWeight: textFontWeight,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionIndicator() {
    if (useCheckbox) {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: isActive ? activeColor : Colors.transparent,
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: isActive
            ? Icon(
                Icons.check,
                size: size * 0.7,
                color: Colors.white,
              )
            : null,
      );
    }

    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: 1),
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
