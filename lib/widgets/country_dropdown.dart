import 'package:flutter/material.dart';

import 'input_field.dart';

Widget buildDropdownField(String label, String selectedValue,
    List<String> items, Function(String?) onChanged) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      DropdownInputField(
        value: selectedValue,
        items: items,
        hintText: label,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please select a $label';
          }
          return null;
        },
        onChanged: onChanged,
      ),
    ],
  );
}
