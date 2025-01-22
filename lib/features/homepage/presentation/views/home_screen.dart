import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/enums/others.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/features/homepage/presentation/views/bloc/app_cubit.dart';
import 'package:zheeta/features/homepage/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:zheeta/features/homepage/presentation/views/widgets/floating_action_button.dart';
import 'package:zheeta/widgets/error_page.dart';
import 'package:zheeta/widgets/loading_screen.dart';
import 'package:zheeta/widgets/top_nav.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppCubit appCubit = locator<AppCubit>();
  int index = 0;

  @override
  void initState() {
    appCubit.initializeApp();
    super.initState();
  }

  final appBars = [
    AppBar(
      backgroundColor: AppColors.primaryDark,
      elevation: 0.0,
      leadingWidth: double.infinity * 0.5,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child: Text(
          'Discover',
          style: TextStyle(
              color: AppColors.white,
              fontSize: 32,
              fontWeight: FontWeight.w600),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Row(
            children: [
              TopNavBtn(
                  iconType: IconType.menu,
                  color: AppColors.primaryLightBackground),
              TopNavBtn(
                  iconType: IconType.bell,
                  color: AppColors.primaryLightBackground),
            ],
          ),
        )
      ],
    ),
    AppBar(
      backgroundColor: AppColors.primaryDark,
      elevation: 0.0,
      leadingWidth: double.infinity * 0.5,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child: Text(
          'Feeds',
          style: TextStyle(
              color: AppColors.white,
              fontSize: 32,
              fontWeight: FontWeight.w600),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Row(
            children: [
              TopNavBtn(
                  iconType: IconType.menu,
                  color: AppColors.primaryLightBackground),
              TopNavBtn(
                  iconType: IconType.bell,
                  color: AppColors.primaryLightBackground),
            ],
          ),
        )
      ],
    ),
    AppBar(
      backgroundColor: AppColors.primaryDark,
      elevation: 0.0,
      leadingWidth: double.infinity * 0.5,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child: Text(
          'Messages',
          style: TextStyle(
              color: AppColors.white,
              fontSize: 32,
              fontWeight: FontWeight.w600),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Row(
            children: [
              TopNavBtn(
                  iconType: IconType.bell,
                  color: AppColors.primaryLightBackground),
              TopNavBtn(
                  iconType: IconType.menu,
                  color: AppColors.primaryLightBackground),
            ],
          ),
        )
      ],
    ),
    null // For ProfileScreen, no AppBar
  ];

  final pages = [
    Placeholder(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
  ];

  final bgColors = [
    AppColors.primaryDark,
    AppColors.primaryDark,
    AppColors.secondaryLight,
    AppColors.secondaryLight,
  ];

  final icons = [
    ["Discover", "assets/images/icons/card.svg"],
    ["Feed", "assets/images/icons/feed.svg"],
    ["Messages", "assets/images/icons/messages.svg"],
    ["Profile", "assets/images/icons/user.svg"],
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is AppLoading) {
          return LoadingScreen();
        } else if (state is AppError) {
          return ErrorPage();
        } else if (state is AppLoaded) {
          final userProfile = state.profile?.data?.profile;
          final userCarousels = state.profile?.data?.userCarousels;
          final user = userProfile?.user;

          bool isVerified = userProfile != null &&
              userProfile.profilePhotoURL != null &&
              (userCarousels?.isNotEmpty ?? false) &&
              user?.isFullyVerified == true;
          return Scaffold(
            backgroundColor:
                isVerified ? bgColors[index] : AppColors.primaryDark,
            appBar: isVerified ? appBars[index] : null,
            body: isVerified
                ? Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      pages[index],
                      buildBottomNavigationBar(
                        index,
                        icons,
                        (newIndex) {
                          setState(() => index = newIndex);
                        },
                      ),
                    ],
                  )
                : const Placeholder(),
            floatingActionButton:
                isVerified ? buildFloatingActionButton(context) : null,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
        }
        // Default fallback
        return Scaffold(
          body: ErrorPage(
            onTryAgain: () => appCubit.initializeApp(),
          ),
        );
      },
    );
  }
}
