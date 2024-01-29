import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/router/app_router.dart';

initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      themeMode: ThemeMode.dark,
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
        sliderTheme: SliderThemeData(
          trackHeight: 7,
          activeTrackColor: AppColors.primaryDark,
          trackShape: RoundedRectSliderTrackShape(),
          thumbColor: Color(0xeeA0A3BD),
          inactiveTrackColor: Color(0xffD9DBE9),
          // thumbShape: SliderComponentShape.noOverlay,
          overlayShape: SliderComponentShape.noOverlay,
          showValueIndicator: ShowValueIndicator.always,
          valueIndicatorColor: AppColors.primaryDark,
        ),
        primarySwatch: Colors.pink,
        primaryColor: AppColors.primaryDark,
        highlightColor: Colors.white,
        primaryTextTheme: Theme.of(context).textTheme.apply(displayColor: Color(0xff4E4B66), fontFamily: 'Outfit', bodyColor: Color(0xff4E4B66)),
        textTheme: Theme.of(context).textTheme.apply(displayColor: Color(0xff4E4B66), fontFamily: 'Outfit', bodyColor: Color(0xff4E4B66)),
        textSelectionTheme: TextSelectionThemeData(selectionColor: AppColors.primaryDark.withOpacity(0.3)),
        fontFamily: 'Outfit',
        unselectedWidgetColor: Colors.white,
        useMaterial3: true,
      ),
    );
  }
}
