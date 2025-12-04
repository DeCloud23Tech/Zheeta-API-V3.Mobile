import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences
import 'package:url_launcher/url_launcher.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/services/agreement_service.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/app/presentation/cubits/app_cubit/app_cubit.dart';
import 'package:zheeta/features/app/presentation/cubits/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:zheeta/features/app/presentation/widgets/bottom_nav_bar.dart';
import 'package:zheeta/features/app/presentation/widgets/floating_action_button.dart';
import 'package:zheeta/features/authentication/presentation/screens/phone_verification_screen.dart';
import 'package:zheeta/features/buddy_events/presentation/screens/events_feed/event_feed_screen.dart';
import 'package:zheeta/features/discover/presentation/screens/discover_screen.dart';
import 'package:zheeta/features/messages/presentation/screens/chat_conversation_screen.dart';
import 'package:zheeta/features/messages/presentation/screens/chat_messages.dart';
import 'package:zheeta/features/profile/presentation/screens/profile/profile_screen.dart';
import 'package:zheeta/features/splash_screen/presentation/views/welcome.dart';
import 'package:zheeta/main.dart';
import 'package:zheeta/shared/enums/icon_type_enum.dart';
import 'package:zheeta/shared/widgets/drawer.dart';
import 'package:zheeta/shared/widgets/error_page.dart';
import 'package:zheeta/shared/widgets/loading_screen.dart';
import 'package:zheeta/shared/widgets/top_nav.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AppCubit appCubit = locator<AppCubit>();
  final AgreementService _agreementService = locator<AgreementService>();

  int index = 0; // This `index` is now managed by BottomNavCubit

  @override
  void initState() {
    super.initState();
    appCubit.initializeApp();
    // Call the service method to check and show the dialog
    _agreementService.checkAndShowAgreementDialog(context);
  }

  final appBars = [
    AppBar(
      backgroundColor: AppColors.primaryDark,
      elevation: 0.0,
      leadingWidth: double.infinity * 0.5,
      leading: const Padding(
        padding: EdgeInsets.only(left: 20, top: 10),
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
                  iconType: IconType.filter,
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
      leading: const Padding(
        padding: EdgeInsets.only(left: 20, top: 10),
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
      leading: const Padding(
        padding: EdgeInsets.only(left: 20, top: 10),
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
    null // For ProfileScreen, no AppBar
  ];

  final pages = [
    const DiscoverPage(),
    const EventFeedPage(),
    const ChatConversationScreen(),
    const ProfilePage(),
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
          return const LoadingScreen();
        } else if (state is AppError) {
          return ErrorPage(
            onTryAgain: () => appCubit.initializeApp(),
          );
        } else if (state is AppProfile) {
          // This state usually means profile setup is incomplete, leading to WelcomeScreen
          return WelcomeScreen(profile: state.profile);
        } else if (state is AppLoaded) {
          bool isVerified = state.profile?.data?.user?.isFullyVerified ?? false;
          return BlocBuilder<BottomNavCubit, int>(
            builder: (context, index) {
              return Scaffold(
                drawer: const SideDrawer(),
                backgroundColor: bgColors[index],
                appBar: isVerified ? appBars[index] : null,
                body: isVerified
                    ? Column(
                        children: [
                          Expanded(child: pages[index]),
                          buildBottomNavigationBar(
                            icons,
                            context,
                            (newIndex) {
                              final bottomNavCubit = locator<BottomNavCubit>();
                              bottomNavCubit.changeTab(newIndex);

                              // Refresh matches only when switching to tab 0
                              if (newIndex == 0) {
                                appCubit.refreshMatches();
                              }
                            },
                          ),
                        ],
                      )
                    : PhoneVerificationScreen(
                        phoneNumber:
                            state.profile?.data?.user?.phoneNumber ?? '',
                        countryCode:
                            state.profile?.data?.user?.phoneCountryCode ?? '',
                      ),
                floatingActionButton:
                    isVerified ? buildFloatingActionButton(context) : null,
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
              );
            },
          );
        }
        // Default fallback
        return ErrorPage(
          onTryAgain: () => appCubit.initializeApp(),
        );
      },
    );
  }
}

class UnderConstructionScreen extends StatelessWidget {
  final String featureName;

  const UnderConstructionScreen({
    super.key,
    this.featureName = 'This feature', // Default message
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coming Soon!'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // You can use a specific icon or an asset here
              const Icon(
                Icons.construction, // Or Icons.build, Icons.developer_mode
                size: 80.0,
                color:
                    Colors.orange, // A common color for warnings/construction
              ),
              const SizedBox(height: 30.0),
              Text(
                '$featureName is currently under construction.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 15.0),
              const Text(
                'We\'re working hard to bring you exciting new updates. Please check back soon!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 40.0),
              // Optional: A button to navigate back or to another part of the app
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.of(context).pop(); // Go back to the previous screen
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.blueAccent, // Example color
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //   ),
              //   child: const Text(
              //     'Go Back',
              //     style: TextStyle(fontSize: 18.0, color: Colors.white),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
