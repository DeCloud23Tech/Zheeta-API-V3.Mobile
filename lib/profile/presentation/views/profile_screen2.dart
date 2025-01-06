// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:zheeta/app/common/extensions/string_extension.dart';
// import 'package:zheeta/widgets/primary_button.dart';
// import '../../../app/common/color.dart';
// import '../../../app/common/enums/others.dart';
// import '../../../app/injection/di.dart';
// import '../../../app/router/app_router.dart';
// import '../../../app/router/app_router.gr.dart';
// import '../../../widgets/drawer.dart';
// import '../../../widgets/gender_age.dart';
// import '../../../widgets/gender_indicator.dart';
// import '../../../widgets/loading_screen.dart';
// import '../../../widgets/top_nav.dart';
// import '../bloc/profile_cubit/profile_cubit.dart';
// import '../widgets/carousel_slider.dart';
// import '../widgets/counter.dart';
// import '../widgets/intrests_tile.dart';
// import '../widgets/events_posts.dart';
// import '../widgets/recent-downlines.dart';
// import '../widgets/tab_button.dart';
// import '../widgets/user_bio.dart';
//
// @RoutePage()
// class ProfileScreen extends StatefulWidget {
//   ProfileScreen({super.key});
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   late ProfileCubit profileCubit;
//   final controller = ScrollController();
//   final ScrollController _scrollController = ScrollController();
//   int _current = 0;
//   int _activeTab = 1;
//
//   bool showFullBio = true;
//
//   void updateCurrentIndex(int index) {
//     setState(() {
//       _current = index;
//     });
//   }
//
//   void updateActiveTab(int tabIndex) {
//     setState(() {
//       _activeTab = tabIndex;
//     });
//   }
//
//   void toggleBio() {
//     setState(() {
//       showFullBio = !showFullBio;
//     });
//   }
//
//   bool get _isBottom {
//     if (!_scrollController.hasClients) return false;
//     final maxScroll = _scrollController.position.maxScrollExtent;
//     final currentScroll = _scrollController.position.pixels;
//     return currentScroll >= (maxScroll * 0.9);
//   }
//
//   void _onScroll() {
//     if (_isBottom && _activeTab == 2) {
//       final currentState = profileCubit.state;
//       if (currentState is ProfileCompositeState && !currentState.isFetching) {
//         // profile_cubit.getUserRecentActivityCubit(
//         //   currentPage: currentState.currentPage + 1,
//         // );
//       }
//     }
//   }
//
//   @override
//   void initState() {
//     profileCubit = locator<ProfileCubit>();
//     _scrollController.addListener(_onScroll);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: SideDrawer(),
//       body: BlocConsumer<ProfileCubit, ProfileState>(
//         listener: (context, state) {},
//         // buildWhen: (previous, current) {
//         //   print('previous');
//         //   print(previous);
//         //   print('current');
//         //   print(current);
//         //   print(previous is ProfileCompositeState && current is ProfileCompositeState);
//         //   if (previous is ProfileCompositeState && current is ProfileCompositeState) {
//         //     return previous.userProfile != current.userProfile;
//         //   }
//         //   return false;
//         // },
//         builder: (context, state) {
//           if (state is ProfileLoadingState) {
//             return LoadingScreen(
//               backgroundColor: AppColors.secondaryLight,
//               indicatorColor: AppColors.primaryDark,
//             );
//           } else if (state is ProfileErrorState) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('An error occurred'),
//                   SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: () {
//                       profileCubit.getSingleUserProfileCubit();
//                     },
//                     child: Text('Refresh'),
//                   ),
//                 ],
//               ),
//             );
//           } else if (state is ProfileCompositeState) {
//             final theUser = state.userProfile!.data;
//             return CustomScrollView(
//               controller: _scrollController,
//               slivers: <Widget>[
//                 SliverAppBar(
//                   elevation: 0,
//                   centerTitle: true,
//                   backgroundColor: AppColors.secondaryLight,
//                   surfaceTintColor: AppColors.secondaryLight,
//                   scrolledUnderElevation: 0.5,
//                   shadowColor: Colors.grey,
//                   automaticallyImplyLeading: false,
//                   actions: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         TopNavBtn(iconType: IconType.menu),
//                         TopNavBtn(iconType: IconType.bell)
//                       ],
//                     ),
//                     SizedBox(width: 16),
//                   ],
//                   pinned: true,
//                   expandedHeight: MediaQuery.of(context).size.height * 0.55,
//                   flexibleSpace: FlexibleSpaceBar(
//                     centerTitle: true,
//                     background: Stack(
//                       alignment: AlignmentDirectional.center,
//                       children: [
//                         CarouselSliderWidget(
//                           theUser: theUser,
//                           updateCurrentIndex: updateCurrentIndex,
//                         ),
//                         Positioned(
//                           bottom: 75,
//                           left: 10,
//                           child: TopNavBtn(iconType: IconType.photo),
//                         ),
//                         Positioned(
//                           bottom: 30,
//                           child: Row(
//                             children: [
//                               for (var i = 0;
//                                   i < theUser.userCarousels!.length;
//                                   i++)
//                                 Padding(
//                                   padding: const EdgeInsets.all(3),
//                                   child: Container(
//                                     height: 10,
//                                     width: 10,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(100),
//                                       color: _current == i
//                                           ? AppColors.white
//                                           : AppColors.white.withOpacity(0.2),
//                                     ),
//                                   ),
//                                 )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SliverList(
//                   delegate: SliverChildListDelegate(
//                     <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.all(20.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           if (!theUser.user?.isFullyVerified)
//                                             Image.asset(
//                                                 'assets/images/badge.png',
//                                                 width: 19,
//                                                 height: 19),
//                                           SizedBox(width: 8),
//                                           Image.asset('assets/images/share.png',
//                                               width: 19, height: 19),
//                                           SizedBox(width: 8),
//                                           Container(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 10, vertical: 5),
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(5),
//                                               color: Color(0xffFEB237),
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   color: Colors.black
//                                                       .withOpacity(0.3),
//                                                   spreadRadius: 0,
//                                                   blurRadius: 2,
//                                                   offset: Offset(0, 1),
//                                                 ),
//                                               ],
//                                             ),
//                                             child: Text(
//                                               '${theUser.subscription?.name}',
//                                               style: TextStyle(
//                                                   fontSize: 10,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: AppColors.white),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Row(
//                                         children: [
//                                           Expanded(
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                       vertical: 5.0),
//                                               child: Text(
//                                                 '${theUser.profile?.firstName} ${theUser.profile?.lastName}',
//                                                 style: const TextStyle(
//                                                   color: AppColors.darkText,
//                                                   fontWeight: FontWeight.w600,
//                                                   fontSize: 24,
//                                                 ),
//                                                 overflow: TextOverflow
//                                                     .ellipsis, // Optional: Handle overflow with ellipsis
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(width: 15),
//                                           GenderAgeWidget(
//                                             gender: theUser.profile?.gender
//                                                     .toString()
//                                                     .getFirstLetter ??
//                                                 '',
//                                             age: theUser.profile?.age ?? 0,
//                                           ),
//                                           const SizedBox(width: 10),
//                                           GenderIndicator(
//                                             gender: theUser.profile?.gender
//                                                     .toString()
//                                                     .getFirstLetter ??
//                                                 '',
//                                           ),
//                                         ],
//                                       ),
//                                       Text(
//                                         '${theUser.residentialAddress?.city}, ${theUser.residentialAddress?.country}(2 miles away)',
//                                         style: const TextStyle(
//                                           color: AppColors.grey,
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 16,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {
//                                     // router.push(ProfileEditRoute());
//                                   },
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(5),
//                                     child: Container(
//                                       padding: EdgeInsets.all(10),
//                                       height: 40,
//                                       width: 40,
//                                       decoration: BoxDecoration(
//                                         color: AppColors.white,
//                                         borderRadius:
//                                             BorderRadius.circular(100),
//                                       ),
//                                       child: SvgPicture.asset(
//                                         'assets/images/icons/dots.svg',
//                                         width: 30,
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             SizedBox(height: 20),
//                             Container(
//                               padding: EdgeInsets.all(22),
//                               decoration: BoxDecoration(
//                                 color: AppColors.white,
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   buildCounterWidget(
//                                     count:
//                                         theUser.profileCounters?.friendsCount,
//                                     label: 'Friends',
//                                   ),
//                                   buildCounterWidget(
//                                     count:
//                                         theUser.profileCounters?.refereesCount,
//                                     label: 'Referees',
//                                   ),
//                                   buildCounterWidget(
//                                     count: theUser.profileCounters?.postCount,
//                                     label: 'Posts',
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(height: 20),
//                             PrimaryButton(
//                               icon: 'assets/images/icons/rocket.svg',
//                               invert: false,
//                               title: 'Boost Profile',
//                               action: () {
//                                 // router.push(ProfileBoostRoute(
//                                 //   subscriptionPlan: theUser.subscription?.name,
//                                 // ));
//                               },
//                             ),
//                             SizedBox(height: 20),
//                             Container(
//                               height: 40,
//                               width: MediaQuery.of(context).size.width,
//                               decoration: BoxDecoration(
//                                 color: AppColors.white,
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   TabButton(
//                                     title: 'Bio',
//                                     tabIndex: 1,
//                                     activeTab: _activeTab,
//                                     onTabSelected: updateActiveTab,
//                                   ),
//                                   TabButton(
//                                     title: 'Post',
//                                     tabIndex: 2,
//                                     activeTab: _activeTab,
//                                     onTabSelected: updateActiveTab,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             _activeTab == 1
//                                 ? Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       UserBioWidget(
//                                         user: theUser,
//                                         showFullBio: showFullBio,
//                                         toggleBio: toggleBio,
//                                       ),
//                                       RecentDownlinesWidget(
//                                         userDownlines: theUser.userDownlines,
//                                         onViewAll: () {
//                                           // router.push(DownLinesRoute());
//                                         },
//                                       ),
//                                       Text(
//                                         "Interest",
//                                         style: TextStyle(
//                                           color: AppColors.grayscale,
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                       SizedBox(height: 10),
//                                       Wrap(
//                                         runSpacing: 10,
//                                         spacing: 10,
//                                         children: theUser.interests
//                                                 ?.map(
//                                                   (e) => InterestWidget(
//                                                       title: e.title),
//                                                 )
//                                                 .toList() ??
//                                             [],
//                                       ),
//                                     ],
//                                   )
//                                 : PostsWidget(),
//                             SizedBox(height: 100),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           } else {
//             return SizedBox.shrink();
//           }
//         },
//       ),
//     );
//   }
// }
