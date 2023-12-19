import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/splash_screen/presentation/views/intro.dart';

void main() {
  injectDependency(Environment.prod);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      title: 'Zheeta',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        highlightColor: Colors.white,
        textSelectionTheme: TextSelectionThemeData(selectionColor: Colors.white.withOpacity(0.3)),
        fontFamily: 'Outfit',
        unselectedWidgetColor: Colors.white,
      ),
      home: const Scaffold(body: Intro()),
    );
  }
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
