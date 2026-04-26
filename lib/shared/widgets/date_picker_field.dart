import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zheeta/core/constants/color.dart';

class DatePickerField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onDateSelected;
  final EdgeInsetsGeometry padding;

  const DatePickerField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.onDateSelected,
    this.padding = const EdgeInsets.only(top: 10, bottom: 10),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryDark, width: 1.0),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.withValues(alpha: 0.5),
            fontSize: 12,
          ),
          errorStyle: const TextStyle(color: Colors.red),
          suffixIcon: const Icon(Icons.calendar_today, size: 18),
        ),
        readOnly: true,
        onTap: () async {
          final DateTime? selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2101),
          );

          if (selectedDate != null) {
            // Convert selected date to UTC
            DateTime utcDate = DateTime.utc(
              selectedDate.year,
              selectedDate.month,
              selectedDate.day,
            );

            // Format and update text field
            String formattedDate = DateFormat('yyyy-MM-dd').format(utcDate);
            controller.text = formattedDate;

            if (onDateSelected != null) {
              onDateSelected!(formattedDate);
            }
          }
        },
      ),
    );
  }
}

class DateTimePickerField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onDateTimeSelected;

  const DateTimePickerField({
    super.key,
    this.controller,
    required this.hintText,
    this.validator,
    this.onDateTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: TextFormField(
        validator: validator,
        controller: controller,
        style: TextStyle(
          color: AppColors.black,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryDark, width: 1.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red, width: 0.5),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey, width: 0.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red, width: 1.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey, width: 0.5),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
              color: AppColors.grey.withValues(alpha: 0.5), fontSize: 14),
          errorStyle: const TextStyle(color: Colors.red),
          suffixIcon: const Icon(Icons.calendar_today, size: 16),
        ),
        readOnly: true,
        onTap: () async {
          // Show Date Picker
          final DateTime? selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2101),
          );

          if (selectedDate != null) {
            // Show Time Picker
            final TimeOfDay? selectedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );

            if (selectedTime != null) {
              // Convert to UTC
              final DateTime localDateTime = DateTime(
                selectedDate.year,
                selectedDate.month,
                selectedDate.day,
                selectedTime.hour,
                selectedTime.minute,
              );
              final DateTime utcDateTime = localDateTime.toUtc();

              // Format and update text field
              final String formattedDateTime =
                  DateFormat("yyyy-MM-dd HH:mm:ss'Z'").format(utcDateTime);

              controller?.text = formattedDateTime;

              if (onDateTimeSelected != null) {
                onDateTimeSelected!(formattedDateTime);
              }
            }
          }
        },
      ),
    );
  }
}
