import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/router/app_router.dart';

initializeApp() async {
  await injectDependency(Environment.prod);
  await Hive.initFlutter();
  await Hive.openBox('app-local-storage');
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.config(),
      title: 'Zheeta',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        datePickerTheme: DatePickerThemeData(
          backgroundColor: Colors.white,
          headerBackgroundColor: AppColors.primaryDark,
          headerForegroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          todayBackgroundColor: MaterialStateProperty.all(AppColors.primaryDark),
          todayBorder: const BorderSide(color: AppColors.primaryDark),
          dayForegroundColor: MaterialStateProperty.all(Colors.black),
          yearForegroundColor: MaterialStateProperty.all(Colors.black),
          weekdayStyle: const TextStyle(color: AppColors.primaryDark),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          },
        ),
        primarySwatch: Colors.pink,
        highlightColor: Colors.white,
        textSelectionTheme: TextSelectionThemeData(selectionColor: Colors.white.withOpacity(0.3)),
        fontFamily: 'Outfit',
        unselectedWidgetColor: Colors.white,
        useMaterial3: true,
      ),
    );
  }
}
