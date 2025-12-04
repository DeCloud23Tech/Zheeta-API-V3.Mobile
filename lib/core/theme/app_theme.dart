import 'package:flutter/material.dart';
import 'package:zheeta/core/constants/color.dart';

class AppThemes {
  static ThemeData buildAppTheme(BuildContext context) {
    final baseTextTheme = ThemeData.dark().textTheme.apply(
          displayColor: const Color(0xff4E4B66),
          fontFamily: 'Outfit',
          bodyColor: const Color(0xff4E4B66),
        );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      datePickerTheme: DatePickerThemeData(
        backgroundColor: Colors.white,
        headerBackgroundColor: AppColors.primaryDark,
        headerForegroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        todayBackgroundColor: WidgetStateProperty.all(AppColors.primaryDark),
        todayBorder: const BorderSide(color: AppColors.primaryDark),
        dayForegroundColor: WidgetStateProperty.all(Colors.black),
        yearForegroundColor: WidgetStateProperty.all(Colors.black),
        weekdayStyle: const TextStyle(color: AppColors.primaryDark),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        },
      ),

      sliderTheme: SliderThemeData(
        trackHeight: 7,
        activeTrackColor: AppColors.primaryDark,
        trackShape: const RoundedRectSliderTrackShape(),
        thumbColor: const Color(0xeeA0A3BD),
        inactiveTrackColor: const Color(0xffD9DBE9),
        overlayShape: SliderComponentShape.noOverlay,
        showValueIndicator: ShowValueIndicator.always,
        valueIndicatorColor: AppColors.primaryDark,
      ),

      // Only use your custom color
      primaryColor: AppColors.primaryDark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryDark,
        primary: AppColors.primaryDark,
        secondary: AppColors.primaryDark,
        brightness: Brightness.light,
      ),

      highlightColor: Colors.white,
      primaryTextTheme: baseTextTheme,
      textTheme: baseTextTheme,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: AppColors.primaryDark.withValues(alpha: 0.3),
      ),
      fontFamily: 'Outfit',
      unselectedWidgetColor: Colors.white,
    );
  }
}
