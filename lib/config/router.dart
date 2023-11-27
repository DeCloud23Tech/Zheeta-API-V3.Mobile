import 'package:flutter/material.dart';
import 'package:zheeta/presentation/splashscreen/pages/intro.dart';



GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Intro());
      default:
        return MaterialPageRoute(builder: (_) => Intro());
    }
  }
}
