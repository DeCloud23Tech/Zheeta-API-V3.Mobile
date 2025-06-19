// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:zheeta/common/constants/color.dart';
// import 'package:zheeta/common/enums/others.dart';
// import 'package:zheeta/common/notify/notify_user.dart';
// import 'package:zheeta/common/storage/token_storage/i_token_storage.dart';
// import 'package:zheeta/core/injection/di.dart';
// import 'package:zheeta/core/router/app_router.dart';
// import 'package:zheeta/core/router/app_router.gr.dart';
// import 'package:zheeta/features/authentication/presentation/views/phone_verification_screen.dart';
// import 'package:zheeta/features/buddy_events/presentation/views/events_feed/event_feed_screen.dart';
// import 'package:zheeta/features/discover/presentation/views/discover_screen.dart';
// import 'package:zheeta/features/homepage/presentation/views/bloc/app_cubit/app_cubit.dart';
// import 'package:zheeta/features/homepage/presentation/views/widgets/bottom_nav_bar.dart';
// import 'package:zheeta/features/homepage/presentation/views/widgets/floating_action_button.dart';
// import 'package:zheeta/features/messages/presentation/views/chat_messages.dart';
// import 'package:zheeta/features/profile/presentation/views/profile/profile_screen.dart';
// import 'package:zheeta/features/splash_screen/presentation/views/welcome.dart';
// import 'package:zheeta/widgets/drawer.dart';
// import 'package:zheeta/widgets/error_page.dart';
// import 'package:zheeta/widgets/loading_screen.dart';
// import 'package:zheeta/widgets/top_nav.dart';
//
// import 'bloc/bottom_nav_cubit/bottom_nav_cubit.dart';
//
// @RoutePage()
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final AppCubit appCubit = locator<AppCubit>();
//   int index = 0;
//
//   @override
//   void initState() {
//     appCubit.initializeApp();
//     super.initState();
//   }
//
//   final appBars = [
//     AppBar(
//       backgroundColor: AppColors.primaryDark,
//       elevation: 0.0,
//       leadingWidth: double.infinity * 0.5,
//       leading: Padding(
//         padding: const EdgeInsets.only(left: 20, top: 10),
//         child: Text(
//           'Discover',
//           style: TextStyle(
//               color: AppColors.white,
//               fontSize: 32,
//               fontWeight: FontWeight.w600),
//         ),
//       ),
//       actions: [
//         Padding(
//           padding: const EdgeInsets.only(right: 20.0),
//           child: Row(
//             children: [
//               TopNavBtn(
//                   iconType: IconType.menu,
//                   color: AppColors.primaryLightBackground),
//               TopNavBtn(
//                   iconType: IconType.filter,
//                   color: AppColors.primaryLightBackground),
//               TopNavBtn(
//                   iconType: IconType.bell,
//                   color: AppColors.primaryLightBackground),
//             ],
//           ),
//         )
//       ],
//     ),
//     AppBar(
//       backgroundColor: AppColors.primaryDark,
//       elevation: 0.0,
//       leadingWidth: double.infinity * 0.5,
//       leading: Padding(
//         padding: const EdgeInsets.only(left: 20, top: 10),
//         child: Text(
//           'Feeds',
//           style: TextStyle(
//               color: AppColors.white,
//               fontSize: 32,
//               fontWeight: FontWeight.w600),
//         ),
//       ),
//       actions: [
//         Padding(
//           padding: const EdgeInsets.only(right: 20.0),
//           child: Row(
//             children: [
//               TopNavBtn(
//                   iconType: IconType.menu,
//                   color: AppColors.primaryLightBackground),
//               TopNavBtn(
//                   iconType: IconType.bell,
//                   color: AppColors.primaryLightBackground),
//             ],
//           ),
//         )
//       ],
//     ),
//     AppBar(
//       backgroundColor: AppColors.primaryDark,
//       elevation: 0.0,
//       leadingWidth: double.infinity * 0.5,
//       leading: Padding(
//         padding: const EdgeInsets.only(left: 20, top: 10),
//         child: Text(
//           'Messages',
//           style: TextStyle(
//               color: AppColors.white,
//               fontSize: 32,
//               fontWeight: FontWeight.w600),
//         ),
//       ),
//       actions: [
//         Padding(
//           padding: const EdgeInsets.only(right: 20.0),
//           child: Row(
//             children: [
//               TopNavBtn(
//                   iconType: IconType.menu,
//                   color: AppColors.primaryLightBackground),
//               TopNavBtn(
//                   iconType: IconType.bell,
//                   color: AppColors.primaryLightBackground),
//             ],
//           ),
//         )
//       ],
//     ),
//     null // For ProfileScreen, no AppBar
//   ];
//
//   final pages = [
//     DiscoverPage(),
//     EventFeedPage(),
//     ChatMessagesPage(),
//     ProfilePage(),
//   ];
//
//   final bgColors = [
//     AppColors.primaryDark,
//     AppColors.primaryDark,
//     AppColors.secondaryLight,
//     AppColors.secondaryLight,
//   ];
//
//   final icons = [
//     ["Discover", "assets/images/icons/card.svg"],
//     ["Feed", "assets/images/icons/feed.svg"],
//     ["Messages", "assets/images/icons/messages.svg"],
//     ["Profile", "assets/images/icons/user.svg"],
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AppCubit, AppState>(
//       builder: (context, state) {
//         if (state is AppLoading) {
//           return LoadingScreen();
//         } else if (state is AppError) {
//           return ErrorPage(
//             onTryAgain: () => appCubit.initializeApp(),
//           );
//         } else if (state is AppProfile) {
//           return WelcomeScreen(profile: state.profile);
//         } else if (state is AppLoaded) {
//           bool isVerified = state.profile?.data?.user?.isFullyVerified;
//           return BlocBuilder<BottomNavCubit, int>(
//             builder: (context, index) {
//               return Scaffold(
//                 drawer: SideDrawer(),
//                 backgroundColor: bgColors[index],
//                 appBar: isVerified ? appBars[index] : null,
//                 body: isVerified
//                     ? Column(
//                         children: [
//                           Expanded(child: pages[index]),
//                           buildBottomNavigationBar(
//                             icons,
//                             context,
//                             (newIndex) {
//                               final bottomNavCubit = locator<BottomNavCubit>();
//                               bottomNavCubit.changeTab(newIndex);
//
//                               // Refresh matches only when switching to tab 0
//                               if (newIndex == 0) {
//                                 appCubit.refreshMatches();
//                               }
//                             },
//                           ),
//                         ],
//                       )
//                     : PhoneVerificationScreen(
//                         phoneNumber:
//                             state.profile?.data?.user?.phoneNumber ?? '',
//                         countryCode:
//                             state.profile?.data?.user?.phoneCountryCode ?? '',
//                       ),
//                 floatingActionButton:
//                     isVerified ? buildFloatingActionButton(context) : null,
//                 floatingActionButtonLocation:
//                     FloatingActionButtonLocation.centerDocked,
//               );
//             },
//           );
//         }
//         // Default fallback
//         return Scaffold(
//           body: ErrorPage(
//             onTryAgain: () => appCubit.initializeApp(),
//           ),
//         );
//       },
//     );
//   }
// }
