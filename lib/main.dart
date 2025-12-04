import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/app.dart';
import 'package:zheeta/core/firebase_options.dart';

import 'core/common/cubit/maintenance_mode_cubit/maintenance_mode_cubit.dart';
import 'core/services/inapp_purchase_service.dart';
import 'di/di.dart';

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await configureDependencies(Environment.prod);

  /// Wait until all async singletons (like ITokenStorage) are ready
  await locator.allReady();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

Future<void> main() async {
  await initializeApp();

  final maintenanceCubit = locator<MaintenanceModeCubit>();
  await maintenanceCubit.checkMaintenanceMode();
  await locator<InAppPurchaseService>()
      .initialize(); // force early & complete init

  runApp(
    BlocProvider.value(
      value: maintenanceCubit,
      child: const App(),
    ),
  );
}
