import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/core/app.dart';

import 'core/firebase_options.dart';

void main() async {
  await initializeApp();
  runApp(MyApp());
}
