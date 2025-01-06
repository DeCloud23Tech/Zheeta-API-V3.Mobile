// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:zheeta/app/common/extensions/string_extension.dart';
// import 'package:zheeta/profile/presentation/bloc/profile_view_cubit/profile_view_cubit.dart';
//
// import '../../../app/common/color.dart';
// import '../../../app/common/enums/others.dart';
// import '../../../widgets/back_button.dart';
// import '../../../widgets/drawer.dart';
// import '../../../widgets/empty_content.dart';
// import '../../../widgets/gender_age.dart';
// import '../../../widgets/gender_indicator.dart';
// import '../../../widgets/loading_screen.dart';
// import '../../../widgets/primary_button.dart';
// import '../../../widgets/top_nav.dart';
// import '../widgets/basic_profile_prop.dart';
// import '../widgets/carousel_slider.dart';
// import '../widgets/counter.dart';
// import '../widgets/intrests_tile.dart';
// import '../widgets/profile_add_or_like.dart';
// import '../widgets/events_posts.dart';
// import '../widgets/tab_button.dart';
// import '../widgets/user_bio.dart';
//
// // @RoutePage()
// class ProfileViewScreen extends StatefulWidget {
//   final String profileId;
//
//   ProfileViewScreen({Key? key, required this.profileId}) : super(key: key);
//
//   @override
//   State<ProfileViewScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileViewScreen> {
//   late ProfileViewCubit profileViewCubit;
//   final controller = ScrollController();
//   final ScrollController _scrollController = ScrollController();
//   int _current = 0;
//   int _activeTab = 1;
//
//   bool showFullBio = true;
//   bool invertAppBarIcons = true;
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
//       final currentState = profileViewCubit.state;
//       // if (currentState is ProfileViewCompositeState && !currentState.isFetching) {
//         // profileViewCubit.getVisitedUserRecentActivityCubit(
//         //   userId: widget.profileId,
//         //   currentPage: currentState.currentPage + 1,
//         // );
//       // }
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_onScroll);
//     _loadProfileData();
//   }
//
//   void _loadProfileData() {
//     context.read<ProfileViewCubit>().visitUserProfileCubit(widget.profileId);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: SideDrawer(),
//       body: BlocBuilder<ProfileViewCubit, ProfileViewState>(
//         builder: (context, state) {
//           if (state is ProfileViewLoading) {
//             return LoadingScreen(
//               backgroundColor: AppColors.secondaryLight,
//               indicatorColor: AppColors.primaryDark,
//             );
//           } else if (state is ProfileViewCompositeState) {
//             final theUser = state.profileData!.profile;
//             return CustomScrollView(
//               controller: controller,
//               slivers: <Widget>[
//                 SliverAppBar(
//                   elevation: 0,
//                   centerTitle: true,
//                   backgroundColor: AppColors.secondaryLight,
//                   surfaceTintColor: AppColors.secondaryLight,
//                   scrolledUnderElevation: 0.5,
//                   shadowColor: Colors.grey,
//                   leadingWidth: MediaQuery.of(context).size.width * 0.4,
//                   leading: Row(
//                     children: [
//                       SizedBox(width: 16),
//                       CustomBackButton(
//                         greyBackground: true,
//                         isOpaque: invertAppBarIcons,
//                       ),
//                     ],
//                   ),
//                   actions: [
//                     // Row(
//                     //   mainAxisAlignment: MainAxisAlignment.end,
//                     //   children: [
//                     //     invertAppBarIcons
//                     //         ? TopNavBtn(iconType: IconType.menu)
//                     //         : TopNavBtn2(iconType: IconType.menu),
//                     //     invertAppBarIcons
//                     //         ? TopNavBtn(iconType: IconType.bell)
//                     //         : TopNavBtn2(iconType: IconType.bell),
//                     //   ],
//                     // ),
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
//                           bottom: 70,
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
//                         ProfileAddOrLike(
//                           visitProfile: state.profileData,
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
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       image: DecorationImage(
//                                           image: NetworkImage(theUser
//                                               .profile!.profilePhotoURL))),
//                                   width: 75,
//                                   height: 75,
//                                 ),
//                                 SizedBox(width: 5.0),
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
//                                           const SizedBox(width: 10),
//                                         ],
//                                       ),
//                                       Text(
//                                         '${theUser.residentialAddress?.city}, ${theUser.residentialAddress?.country}',
//                                         style: const TextStyle(
//                                           color: AppColors.grey,
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 16,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 20),
//                             Visibility(
//                               visible: !state.profileData!.isFriend,
//                               child: SizedBox(
//                                 height: 40,
//                                 child: PrimaryButton(
//                                   icon: 'assets/images/icons/chat_user.svg',
//                                   invert: false,
//                                   title: 'Chat User',
//                                   action: () {
//                                     // router.push(ProfileBoostRoute(
//                                     //   subscriptionPlan: theUser.subscription?.name,
//                                     // ));
//                                   },
//                                 ),
//                               ),
//                             ),
//                             Visibility(
//                               visible: state.profileData!.isFriend,
//                               child: SizedBox(
//                                 height: 40,
//                                 child: PrimaryButton(
//                                   // icon: 'assets/images/icons/chat_user.svg',
//                                   invert: false,
//                                   title: 'Block User',
//                                   action: () {
//                                     // router.push(ProfileBoostRoute(
//                                     //   subscriptionPlan: theUser.subscription?.name,
//                                     // ));
//                                   },
//                                 ),
//                               ),
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
//                                       Text(
//                                         "Basic Profile",
//                                         style: TextStyle(
//                                           color: AppColors.grayscale,
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                       SizedBox(height: 10),
//                                       BasicProfileProp(
//                                         leftTitle: 'Height',
//                                         leftValue:
//                                             '${theUser.profile?.height.round()}cm',
//                                         rightTitle: 'Weight',
//                                         rightValue:
//                                             '${theUser.profile?.weight.round()}kg',
//                                       ),
//                                       BasicProfileProp(
//                                         leftTitle: 'Body Type',
//                                         leftValue:
//                                             '${theUser.profile?.bodyType}',
//                                         rightTitle: 'Occupation',
//                                         rightValue:
//                                             '${theUser.profile?.occupation}',
//                                       ),
//                                       BasicProfileProp(
//                                         leftTitle: 'Complexion',
//                                         leftValue:
//                                             '${theUser.profile?.complexion}',
//                                         rightTitle: 'Language',
//                                         rightValue:
//                                             '${theUser.profile?.languageCSV}',
//                                       ),
//                                       BasicProfileProp(
//                                         leftTitle: 'Religion',
//                                         leftValue:
//                                             '${theUser.profile?.religion}',
//                                       ),
//                                       SizedBox(height: 20),
//                                       if (state.profileData!.isFriend) ...[
//                                         Text(
//                                           "Interest",
//                                           style: TextStyle(
//                                             color: AppColors.grayscale,
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.w600,
//                                           ),
//                                         ),
//                                         SizedBox(height: 10),
//                                         Wrap(
//                                           runSpacing: 10,
//                                           spacing: 10,
//                                           children: theUser.interests
//                                                   ?.map(
//                                                     (e) => InterestWidget(
//                                                         title: e.title),
//                                                   )
//                                                   .toList() ??
//                                               [],
//                                         ),
//                                       ],
//                                     ],
//                                   )
//                                 : Placeholder(),
//                             //ViewUserPostsWidget(),
//                             SizedBox(height: 100),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           } else if (state is ProfileViewError) {
//             return Center(child: Text('Error: ${state.error}'));
//           } else {
//             return EmptyContent();
//           }
//         },
//       ),
//     );
//   }
// }
