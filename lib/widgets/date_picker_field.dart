import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zheeta/app/common/color.dart';

class DatePickerField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onDateSelected;

  const DatePickerField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
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
            color: Colors.grey.withOpacity(0.5),
            fontSize: 12,
          ),
          errorStyle: const TextStyle(color: Colors.red),
          suffixIcon: const Icon(Icons.calendar_today, size: 18,),
        ),
        readOnly: true,
        onTap: () async {
          final DateTime? selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2101),
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  primaryColor: AppColors.primaryLight,
                  colorScheme: ColorScheme.light(
                    primary: AppColors.primaryLight,
                    onSurface: Colors.black,
                  ),
                  dialogBackgroundColor: AppColors.white,
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(),
                  ),
                ),
                child: child!,
              );
            },
          );
          if (selectedDate != null) {
            // Format the selected date as 'dd/MM/yyyy'
            String formattedDate =
                DateFormat('dd/MM/yyyy').format(selectedDate);
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
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onDateTimeSelected;

  const DateTimePickerField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.onDateTimeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
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
            color: Colors.grey.withOpacity(0.5),
            fontSize: 12,
          ),
          errorStyle: const TextStyle(color: Colors.red),
          suffixIcon: const Icon(Icons.calendar_today, size: 18),
        ),
        readOnly: true,
        onTap: () async {
          // Show Date Picker
          final DateTime? selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2101),
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  primaryColor: AppColors.primaryLight,
                  colorScheme: ColorScheme.light(
                    primary: AppColors.primaryLight,
                    onSurface: Colors.black,
                  ),
                  dialogBackgroundColor: AppColors.white,
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(),
                  ),
                ),
                child: child!,
              );
            },
          );

          if (selectedDate != null) {
            // Show Time Picker
            final TimeOfDay? selectedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
              builder: (BuildContext context, Widget? child) {
                return Theme(
                  data: ThemeData.light().copyWith(
                    primaryColor: AppColors.primaryLight,
                    timePickerTheme: TimePickerThemeData(
                      backgroundColor: AppColors.white,
                      dialHandColor: AppColors.primaryDark,
                      dialBackgroundColor: AppColors.grey.withOpacity(0.1),
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(),
                    ),
                  ),
                  child: child!,
                );
              },
            );

            if (selectedTime != null) {
              // Combine selected date and time
              final DateTime dateTime = DateTime(
                selectedDate.year,
                selectedDate.month,
                selectedDate.day,
                selectedTime.hour,
                selectedTime.minute,
              );

              // Format DateTime as 'dd/MM/yyyy hh:mm a'
              final String formattedDateTime =
              DateFormat('dd/MM/yyyy hh:mm a').format(dateTime);

              // Update the controller and notify selection
              controller.text = formattedDateTime;
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

