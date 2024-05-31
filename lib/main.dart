import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/app.dart';

void main() async {
  await initializeApp();
  runApp(ProviderScope(child: MyApp()));
}
