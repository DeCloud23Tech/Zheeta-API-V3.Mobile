import 'package:flutter/material.dart';
import 'package:zheeta/config/router.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      onGenerateRoute: _appRouter.onGenerateRoute,
      title: 'Zheeta',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        highlightColor: Colors.white,
        textSelectionTheme: TextSelectionThemeData(
            selectionColor: Colors.white.withOpacity(0.3)),
        fontFamily: 'Outfit',
        unselectedWidgetColor: Colors.white,
      ),
      initialRoute: '/',
      // home: const Scaffold(body: Intro()),
    );
  }
}
