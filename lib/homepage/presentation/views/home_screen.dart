import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/enums/others.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/discover/presentation/views/discover_screen.dart';
import 'package:zheeta/events/presentation/views/events_feed/event_feed_screen.dart';
import 'package:zheeta/events/presentation/views/user_buddy_events/my_buddy_events_screen.dart';
import 'package:zheeta/homepage/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:zheeta/homepage/presentation/views/widgets/floating_action_button.dart';
import 'package:zheeta/messages/presentation/views/messages.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/profile/presentation/views/profile/profile_screen.dart';
import 'package:zheeta/widgets/drawer.dart';
import 'package:zheeta/widgets/loading_screen.dart';
import 'package:zheeta/widgets/top_nav.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProfileCubit profileCubit = locator<ProfileCubit>();

  int index = 0;

  @override
  void initState() {
    super.initState();
    _initializeProfile();
  }

  _initializeProfile() async {
    try {
      // Fetch the user profile result
      final result = await profileCubit.getSingleUserProfileCubit();

      print(result?.data?.profile);
      // If result is null or user profile data is missing, handle it appropriately
      // if (result?.data == null) {
      //   // Handle a network error or other issues that might return null without redirecting
      //   print('Network error or invalid response');
      //   return; // Exit early if there’s an issue fetching the profile
      // }

      final userProfile = result?.data?.profile;
      final userCarousels = result?.data?.userCarousels;
      final user = result?.data?.profile?.user;
      //
      // // Redirect to BioDataRoute only if the user profile data is genuinely missing
      // if (userProfile == null) {
      //   // return context.router.replace(BioDataRoute());
      // }
      //
      // // Check for profile photo URL, redirect if missing
      // if (userProfile.profilePhotoURL == null) {
      //   // return context.router.replace(ProfilePhotoRoute());
      // }

      // Check if user carousels exist, if not, redirect to ProfileCarouselRoute
      // if (userCarousels!.isEmpty) {
      //   return context.router.replace(ProfileCarouselRoute());
      // }

      // Further checks if user data is available
      if (user != null) {
        // Check if user is fully verified, prompt if not
        if (!user.isFullyVerified) {
          print('User needs to get verified');
        }

        // Fetch matches and store user ID in session
        // await context.read<MatchesCubit>().getMatchCubit(userId: user.userId);
        // sessionManager.set(SessionManagerKeys.authUserIdString, user.userId);
      }
    } catch (e) {
      // Handle exceptions gracefully and show an error message (optional)
      print('Error occurred while fetching profile: $e');
      // Optionally, show an error message or snackbar instead of redirecting
    }
  }

  // Future<void> _loadMatches(BuildContext context, String? userId) async {
  //   if (userId == null) return;
  //   // await context.read<MatchesCubit>().populateMatchesCubit();
  //   await context.read<MatchesCubit>().getMatchCubit(userId: userId);
  // }

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
              // TopNavBtn(
              //     iconType: IconType.filter,
              //     color: AppColors.primaryLightBackground),
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
    DiscoverPage(),
    EventFeedPage(),
    MessagesPage(),
    ProfilePage()
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
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              backgroundColor: bgColors[index],
              appBar: appBars[index],
              drawer: SideDrawer(),
              floatingActionButton: buildFloatingActionButton(context),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              body: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  pages[index], // Main content of each page
                  buildBottomNavigationBar(
                    index,
                    icons,
                    (newIndex) {
                      setState(
                        () {
                          index = newIndex;
                        },
                      );
                    },
                  ), // Bottom Navigation Bar
                ],
              ),
            ),
            if (state is ProfileLoadingState)
              Positioned.fill(
                child: LoadingScreen(), // Full-screen loading overlay
              ),
          ],
        );
      },
    );
  }
}
