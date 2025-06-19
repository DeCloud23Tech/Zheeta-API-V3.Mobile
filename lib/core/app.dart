import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/bloc_providers.dart';
import 'package:zheeta/core/router/app_router.dart';
import 'package:zheeta/widgets/maintenance_page.dart';
import '../common/constants/color.dart';
import '../common/services/deep_link_service.dart';
import '../common/services/push_notification_service.dart';
import '../common/storage/token_storage/i_token_storage.dart';
import '../common/storage/user_storage/i_user_storage.dart';
import '../features/splash_screen/presentation/cubit/maintenance_mode_cubit.dart';
import 'firebase_options.dart';
import 'injection/di.dart';

/// Initialize the application and its dependencies
Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Setup dependency injection
  await injectDependency(Environment.prod);

  // Lock device orientation to portrait
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final DeepLinkService _deepLinkService;
  late final PushNotificationService _pushNotificationService;

  @override
  void initState() {
    super.initState();
    _initializeServices();
  }

  Future<void> _initializeServices() async {
    try {
      // Initialize DeepLinkService
      _deepLinkService = locator<DeepLinkService>();
      _deepLinkService.initialize();

      // Initialize PushNotificationService
      _pushNotificationService = locator<PushNotificationService>();
      _pushNotificationService.initialize();
    } catch (e, stackTrace) {
      debugPrint('Error initializing services: $e\n$stackTrace');
    }
  }

  @override
  void dispose() {
    _deepLinkService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                locator<MaintenanceModeCubit>()..checkMaintenanceMode()),
        ...AppBlocsProvider.allBlocProviders,
      ],
      child: BlocBuilder<MaintenanceModeCubit, MaintenanceModeState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: router.config(),
            title: 'Zheeta',
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.dark,
            theme: _buildThemeData(context),
            builder: (context, child) {
              return Stack(
                children: [
                  child ?? SizedBox.shrink(),
                  if (state.isMaintenanceMode)
                    MaintenanceView(
                      title: state.title,
                      message: state.message,
                    )
                ],
              );
            },
          );
        },
      ),
    );
  }

  ThemeData _buildThemeData(BuildContext context) {
    return ThemeData(
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
      primarySwatch: Colors.pink,
      primaryColor: AppColors.primaryDark,
      highlightColor: Colors.white,
      primaryTextTheme: Theme.of(context).textTheme.apply(
            displayColor: const Color(0xff4E4B66),
            fontFamily: 'Outfit',
            bodyColor: const Color(0xff4E4B66),
          ),
      textTheme: Theme.of(context).textTheme.apply(
            displayColor: const Color(0xff4E4B66),
            fontFamily: 'Outfit',
            bodyColor: const Color(0xff4E4B66),
          ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: AppColors.primaryDark.withOpacity(0.3),
      ),
      fontFamily: 'Outfit',
      unselectedWidgetColor: Colors.white,
      useMaterial3: true,
    );
  }
}
