import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';

notify(context, type, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: type == 'success' ? AppColors.green : AppColors.red, content: Text(message)));
}
