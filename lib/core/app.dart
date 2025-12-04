import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:zheeta/core/bloc_providers.dart';
import 'package:zheeta/core/theme/app_theme.dart';
import 'package:zheeta/router/app_router.dart';
import 'package:zheeta/shared/widgets/maintenance_page.dart';
import 'common/cubit/maintenance_mode_cubit/maintenance_mode_cubit.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ...AppBlocsProvider.allBlocProviders,
      ],
      child: BlocBuilder<MaintenanceModeCubit, MaintenanceModeState>(
        builder: (context, state) {
          return MaterialApp.router(
            // useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: (context, child) {
              return Stack(
                children: [
                  child ?? const SizedBox.shrink(),
                  if (state.isMaintenanceMode)
                    MaintenanceView(
                      title: state.title,
                      message: state.message,
                    ),
                ],
              );
            },
            routerConfig: router.config(),
            title: 'Zheeta',
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: AppThemes.buildAppTheme(context),
          );
        },
      ),
    );
  }
}
