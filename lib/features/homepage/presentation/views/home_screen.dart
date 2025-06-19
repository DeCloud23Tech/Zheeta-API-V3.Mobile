import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences
import 'package:url_launcher/url_launcher.dart' show launchUrl;
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/enums/others.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/common/storage/token_storage/i_token_storage.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/core/router/app_router.dart';
import 'package:zheeta/core/router/app_router.gr.dart';
import 'package:zheeta/features/authentication/presentation/views/phone_verification_screen.dart';
import 'package:zheeta/features/buddy_events/presentation/views/events_feed/event_feed_screen.dart';
import 'package:zheeta/features/discover/presentation/views/discover_screen.dart';
import 'package:zheeta/features/homepage/presentation/views/bloc/app_cubit/app_cubit.dart';
import 'package:zheeta/features/homepage/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:zheeta/features/homepage/presentation/views/widgets/floating_action_button.dart';
import 'package:zheeta/features/messages/presentation/views/chat_messages.dart';
import 'package:zheeta/features/profile/presentation/views/profile/profile_screen.dart';
import 'package:zheeta/features/splash_screen/presentation/views/welcome.dart';
import 'package:zheeta/widgets/drawer.dart';
import 'package:zheeta/widgets/error_page.dart';
import 'package:zheeta/widgets/loading_screen.dart';
import 'package:zheeta/widgets/top_nav.dart';

import 'bloc/bottom_nav_cubit/bottom_nav_cubit.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AppCubit appCubit = locator<AppCubit>();
  int index = 0;

  static const String _agreementShownKey =
      'agreement_shown_for_current_session';
  static const String _lastLoginTimeKey =
      'last_login_time'; // To reset the flag after a new login/signup

  @override
  void initState() {
    super.initState();
    appCubit.initializeApp();
    _checkAndShowAgreementDialog();
  }

  Future<void> _checkAndShowAgreementDialog() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Get the current login time (you'll need to set this after a successful login/signup)
    // For demonstration, let's assume you have a way to get the last successful login/signup time.
    // If you don't track explicit login/signup times, you might just show it once per app install
    // or when the user profile is completely set up.
    final int? lastLoginTimestamp = prefs.getInt(_lastLoginTimeKey);
    final int currentAppLaunchTime = DateTime.now().millisecondsSinceEpoch;

    // A simple logic: if the user hasn't agreed for this session, or if it's a new login/signup (based on time)
    // This part requires you to update _lastLoginTimeKey upon successful login/signup.
    final bool agreementShownForSession =
        prefs.getBool(_agreementShownKey) ?? false;

    // You might want to reset the _agreementShownKey if it's a new login/signup.
    // For example, if you store the user ID with the agreement, you can check if the current user ID is different.
    // Or, you could simply clear _agreementShownKey on logout or before a new login.
    // For simplicity, let's just show it if it hasn't been shown for this session.
    // For "after every login or signup", you need a mechanism to set _agreementShownKey to false
    // and update _lastLoginTimeKey at the point of successful login/signup.

    // This needs to be called after a successful login or signup
    // await prefs.setBool(_agreementShownKey, false); // Reset for new session
    // await prefs.setInt(_lastLoginTimeKey, DateTime.now().millisecondsSinceEpoch); // Set new login time

    // For the purpose of this example, we'll make it show once per app launch if not already agreed.
    // To make it show "after every login or signup", you need to integrate setting _agreementShownKey to false
    // in your authentication success flow.

    if (agreementShownForSession) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showAgreementDialog(context);
      });
    }
  }

  Future<void> _showAgreementDialog(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool _eulaAgreed = false;
    bool _privacyPolicyAgreed = false;
    bool _disclaimerAgreed = false;

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              contentPadding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              title: const Text('Welcome to Zheeta',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Please review and accept our terms to continue using Zheeta.',
                      style: TextStyle(color: Colors.black87),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        launchUrl(
                            Uri.parse('https://www.zheeta.com/policy/eula'));
                      },
                      child: const Text('Read the Zheeta EULA',
                          style: TextStyle(color: AppColors.primaryDark)),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Important Summary:',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '• By using this app, you agree to abide by our terms.\n'
                      '• Zheeta strictly prohibits objectionable content, including hate speech, nudity, harassment, illegal activities, and spam.\n'
                      '• We enforce a zero-tolerance policy: violating these terms can result in content removal, account suspension, or permanent bans.',
                      style: TextStyle(color: Colors.black87, fontSize: 13),
                    ),
                    const SizedBox(height: 20),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: AppColors.primaryLight,
                      title: const Text('I have read and agree to the EULA.',
                          style: TextStyle(color: Colors.black)),
                      value: _eulaAgreed,
                      onChanged: (bool? value) {
                        setState(() {
                          _eulaAgreed = value ?? false;
                        });
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: AppColors.primaryLight,
                      title: const Text('I agree to the Privacy Policy.',
                          style: TextStyle(color: Colors.black)),
                      value: _privacyPolicyAgreed,
                      onChanged: (bool? value) {
                        setState(() {
                          _privacyPolicyAgreed = value ?? false;
                        });
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: AppColors.primaryLight,
                      title: const Text(
                          'I acknowledge the content guidelines and zero-tolerance policy.',
                          style: TextStyle(color: Colors.black)),
                      value: _disclaimerAgreed,
                      onChanged: (bool? value) {
                        setState(() {
                          _disclaimerAgreed = value ?? false;
                        });
                      },
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                // TextButton(
                //   onPressed: () {
                //     Navigator.of(dialogContext).pop();
                //     // You could also force logout or close app here.
                //   },
                //   child: const Text('DECLINE',
                //       style: TextStyle(color: Colors.grey)),
                // ),
                TextButton(
                  onPressed:
                      (_eulaAgreed && _privacyPolicyAgreed && _disclaimerAgreed)
                          ? () async {
                              await prefs.setBool(_agreementShownKey, true);
                              if (context.mounted) {
                                Navigator.of(dialogContext).pop();
                              }
                            }
                          : null,
                  child: const Text('AGREE',
                      style: TextStyle(color: AppColors.primaryDark)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  final appBars = [
    // ... your existing appBars
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
    DiscoverPage(),
    EventFeedPage(),
    ChatMessagesPage(),
    ProfilePage(),
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
          return ErrorPage(
            onTryAgain: () => appCubit.initializeApp(),
          );
        } else if (state is AppProfile) {
          return WelcomeScreen(profile: state.profile);
        } else if (state is AppLoaded) {
          bool isVerified = state.profile?.data?.user?.isFullyVerified;
          return BlocBuilder<BottomNavCubit, int>(
            builder: (context, index) {
              return Scaffold(
                drawer: SideDrawer(),
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
        return Scaffold(
          body: ErrorPage(
            onTryAgain: () => appCubit.initializeApp(),
          ),
        );
      },
    );
  }
}
