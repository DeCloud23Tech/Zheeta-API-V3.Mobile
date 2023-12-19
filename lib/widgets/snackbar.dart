import 'package:flutter/material.dart';
import 'package:zheeta/app/color.dart';

notify(context, type, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: type == 'success' ? green : red, content: Text(message)));
}
