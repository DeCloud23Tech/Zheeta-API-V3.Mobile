// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:zheeta/core/constants/color.dart';
// import 'package:zheeta/core/utils/pagination_controller.dart';
// import 'package:zheeta/core/utils/token_utils.dart';
// import 'package:zheeta/di/di.dart';
// import 'package:zheeta/features/connections/data/models/all_friends_model.dart';
// import 'package:zheeta/features/connections/presentation/cubits/friends_cubit/friends_cubit.dart';
// import 'package:zheeta/features/profile/data/models/blocked_user_model.dart';
// import 'package:zheeta/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
// import 'package:zheeta/router/app_router.gr.dart';
// import 'package:zheeta/shared/widgets/back_button.dart';
// import 'package:zheeta/shared/widgets/loader.dart';
// import 'package:zheeta/shared/widgets/primary_button.dart';
//
// @RoutePage()
// class FriendScreen extends StatefulWidget {
//   const FriendScreen({super.key});
//
//   @override
//   FriendScreenState createState() => FriendScreenState();
// }
//
// class FriendScreenState extends State<FriendScreen> {
//   late PaginatedListController<FriendModel, FriendsCubit, FriendsState>
//       _friendsPaginatedController;
//   late PaginatedListController<BlockedUser, ProfileCubit, ProfileState>
//       _blockedUsersPaginatedController;
//
//   final ScrollController _friendsScrollController = ScrollController();
//   final ScrollController _blockedUsersScrollController = ScrollController();
//
//   FriendsCubit friendsCubit = locator<FriendsCubit>();
//   ProfileCubit profileCubit = locator<ProfileCubit>();
//   int activeTab = 1;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Initialize paginated controllers for friends and blocked users
//     _initializeFriendsPagination();
//     _initializeBlockedUsersPagination();
//
//     // Add scroll listeners
//     _friendsScrollController.addListener(_scrollListener);
//     _blockedUsersScrollController.addListener(_scrollListener);
//
//     // Load the initial data based on the active tab
//     _loadInitialDataForActiveTab();
//   }
//
//   void _initializeFriendsPagination() {
//     _friendsPaginatedController =
//         PaginatedListController<FriendModel, FriendsCubit, FriendsState>(
//       fetchItems: (param) => friendsCubit.fetchFriendsCubit(param),
//       cubit: friendsCubit,
//     );
//   }
//
//   void _initializeBlockedUsersPagination() {
//     _blockedUsersPaginatedController =
//         PaginatedListController<BlockedUser, ProfileCubit, ProfileState>(
//       fetchItems: (param) => profileCubit.getBlockedUsersCubit(param),
//       cubit: profileCubit,
//     );
//   }
//
//   void _loadInitialDataForActiveTab() {
//     if (activeTab == 1) {
//       _loadFriendsPage();
//     } else if (activeTab == 2) {
//       _loadBlockedUsersPage();
//     }
//   }
//
//   void _resetPaginationForActiveTab() {
//     if (activeTab == 1) {
//       _friendsPaginatedController.reset();
//     } else if (activeTab == 2) {
//       _blockedUsersPaginatedController.reset();
//     }
//   }
//
//   void _loadFriendsPage() {
//     _friendsPaginatedController.loadNextPage(
//       // When fetchFriendsCubit succeeds, it emits FriendsFetchedState
//       successCondition: (state) => state is FriendsFetchedState,
//       // From FriendsFetchedState, you extract 'allFriends'
//       extractItems: (state) => (state as FriendsFetchedState).currentFriendList,
//       // When fetchFriendsCubit fails, it emits FriendsDataState with an errorMessage
//       isError: (state) =>
//           state is FriendsDataState && state.errorMessage != null,
//     );
//   }
//
//   void _loadBlockedUsersPage() {
//     _blockedUsersPaginatedController.loadNextPage(
//       // When getBlockedUsersCubit succeeds, it emits ProfileLoadedState
//       successCondition: (state) => state is ProfileLoadedState,
//       // From ProfileLoadedState, you extract 'blockedUsersList'
//       extractItems: (state) => (state as ProfileLoadedState).blockedUsersList,
//       // When getBlockedUsersCubit fails, it emits ProfileErrorState
//       isError: (state) => state is ProfileErrorState,
//     );
//   }
//
//   void _scrollListener() {
//     if (activeTab == 1 && _isFriendsBottom) {
//       _loadFriendsPage();
//     } else if (activeTab == 2 && _isBlockedUsersBottom) {
//       _loadBlockedUsersPage();
//     }
//   }
//
//   bool get _isFriendsBottom {
//     if (!_friendsScrollController.hasClients) return false;
//     final maxScroll = _friendsScrollController.position.maxScrollExtent;
//     final currentScroll = _friendsScrollController.position.pixels;
//     return currentScroll >= (maxScroll * 0.9);
//   }
//
//   bool get _isBlockedUsersBottom {
//     if (!_blockedUsersScrollController.hasClients) return false;
//     final maxScroll = _blockedUsersScrollController.position.maxScrollExtent;
//     final currentScroll = _blockedUsersScrollController.position.pixels;
//     return currentScroll >= (maxScroll * 0.9);
//   }
//
//   @override
//   void dispose() {
//     _friendsScrollController.dispose();
//     _blockedUsersScrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.secondaryLight,
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: true,
//         backgroundColor: AppColors.secondaryLight,
//         surfaceTintColor: AppColors.secondaryLight,
//         scrolledUnderElevation: 0.5,
//         shadowColor: Colors.grey,
//         leadingWidth: MediaQuery.of(context).size.width * 0.2,
//         leading: Row(
//           children: [
//             AppBackButton(),
//           ],
//         ),
//         title: Text(
//           'Friends',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//         // actions: [
//         //   SvgPicture.asset('assets/images/icons/search.svg'),
//         //   SizedBox(width: 16),
//         // ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             _buildTabBar(),
//             SizedBox(height: 10),
//             Expanded(child: _buildTabContent()),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTabBar() {
//     return Container(
//       height: 40,
//       width: MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           _buildTabButton(1, "My Friends"),
//           _buildTabButton(2, "Blocked Users"),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTabButton(int tabIndex, String text) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           activeTab = tabIndex;
//           _resetPaginationForActiveTab(); // Reset pagination instead of reinitializing
//         });
//         _loadInitialDataForActiveTab();
//       },
//       child: Container(
//         color: Colors.transparent,
//         child: Column(
//           children: [
//             Container(
//               height: 3,
//               width: MediaQuery.of(context).size.width * 0.44,
//               decoration: BoxDecoration(
//                 color: activeTab == tabIndex
//                     ? AppColors.primaryDark
//                     : Colors.transparent,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             SizedBox(height: 5),
//             Text(
//               text,
//               style: TextStyle(
//                 color: activeTab == tabIndex
//                     ? AppColors.grayscale
//                     : AppColors.grey,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTabContent() {
//     return activeTab == 1 ? _buildFriendsList() : _buildBlockedUsersList();
//   }
//
//   Widget _buildFriendsList() {
//     return BlocBuilder<FriendsCubit, FriendsState>(
//       builder: (context, state) {
//         final isLoadingInitial = (state is FriendsDataState &&
//             state.isLoading &&
//             _friendsPaginatedController.items.isEmpty);
//         final hasNoFriends = ((state is FriendsFetchedState ||
//                 (state is FriendsDataState &&
//                     !state.isLoading &&
//                     state.errorMessage == null)) &&
//             _friendsPaginatedController.items.isEmpty);
//         final hasError = (state is FriendsDataState &&
//             state.errorMessage != null &&
//             _friendsPaginatedController.items.isEmpty);
//
//         if (isLoadingInitial) {
//           return Center(child: loadingIndicator());
//         } else if (hasError) {
//           return Center(
//             child: Text(
//               state.errorMessage ?? 'Failed to load friends.',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 color: AppColors.red, // Use an error color
//               ),
//             ),
//           );
//         } else if (hasNoFriends) {
//           return Center(
//             child: Text(
//               'No friends found.',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 color: AppColors.primaryDark,
//               ),
//             ),
//           );
//         }
//
//         // This is for when there are items to display or loading more
//         return ListView.builder(
//           shrinkWrap: true,
//           physics: AlwaysScrollableScrollPhysics(),
//           controller: _friendsScrollController,
//           // Only add +1 if there are more items to load (for the loading indicator at the bottom)
//           itemCount: _friendsPaginatedController.items.length +
//               (_friendsPaginatedController.hasMoreItems ? 1 : 0),
//           itemBuilder: (context, index) {
//             if (index == _friendsPaginatedController.items.length) {
//               // Show loading indicator at the bottom if more items are available
//               return _friendsPaginatedController.hasMoreItems
//                   ? loadingIndicator()
//                   : SizedBox.shrink(); // Hide if no more items
//             }
//
//             final friend = _friendsPaginatedController.items[index];
//             // ... rest of your friend item widget
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 50,
//                             height: 50,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.rectangle,
//                               borderRadius: BorderRadius.circular(15.0),
//                               image: DecorationImage(
//                                 image:
//                                     NetworkImage(friend.friendProfilePicture),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 8),
//                           Expanded(
//                             child: Text(
//                               '@${friend.friendUsername}',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                                 color: AppColors.primaryDark,
//                               ),
//                               overflow: TextOverflow.ellipsis,
//                               maxLines: 1,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         BlocListener<ProfileCubit, ProfileState>(
//                           // Listen for ProfileLoadedState to refresh friends list after block/unblock
//                           listener: (context, state) {
//                             if (state is ProfileLoadedState) {
//                               _friendsPaginatedController.reset();
//                               _loadFriendsPage();
//                             }
//                           },
//                           child: Visibility(
//                             visible: !friend
//                                 .friendBlockStatus, // Show block button if not blocked
//                             child: SizedBox(
//                               height: 28,
//                               child: PrimaryButton(
//                                 invert: true,
//                                 showBorder: true,
//                                 fontSize: 11.5,
//                                 color: AppColors.secondaryLight,
//                                 title: 'Block',
//                                 action: () {
//                                   profileCubit.blockAccountCubit(
//                                     blockOrUnBlockId: friend.friendId,
//                                     userId: friend.userId,
//                                   );
//                                 },
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 8),
//                         SizedBox(
//                           height: 28,
//                           child: PrimaryButton(
//                             title: 'View Profile',
//                             fontSize: 11.5,
//                             action: () {
//                               context.router.push(
//                                 ProfileViewRoute(
//                                   profileId: friend.friendId,
//                                   blockOrUnBlockId: friend.friendId,
//                                   userId: friend.userId,
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }
//
//   Widget _buildBlockedUsersList() {
//     return BlocBuilder<ProfileCubit, ProfileState>(
//       builder: (context, state) {
//         final isLoadingInitial = (state is ProfileLoadingState &&
//             _blockedUsersPaginatedController.items.isEmpty);
//         final hasNoBlockedUsers = (state is ProfileLoadedState &&
//             _blockedUsersPaginatedController.items.isEmpty);
//         final hasError = (state is ProfileErrorState &&
//             _blockedUsersPaginatedController.items.isEmpty);
//
//         if (isLoadingInitial) {
//           return Center(child: loadingIndicator());
//         } else if (hasError) {
//           return Center(
//             child: Text(
//               'Failed to load blocked users.',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 color: AppColors.red,
//               ),
//             ),
//           );
//         } else if (hasNoBlockedUsers) {
//           return Center(
//             child: Text(
//               'No blocked users found.',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 color: AppColors.primaryDark,
//               ),
//             ),
//           );
//         }
//
//         return ListView.builder(
//           shrinkWrap: true,
//           physics: AlwaysScrollableScrollPhysics(),
//           controller: _blockedUsersScrollController,
//           itemCount: _blockedUsersPaginatedController.items.length +
//               (_blockedUsersPaginatedController.hasMoreItems ? 1 : 0),
//           itemBuilder: (context, index) {
//             if (index == _blockedUsersPaginatedController.items.length) {
//               return _blockedUsersPaginatedController.hasMoreItems
//                   ? loadingIndicator()
//                   : SizedBox.shrink();
//             }
//
//             final blockedUser = _blockedUsersPaginatedController.items[index];
//
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 50,
//                             height: 50,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.rectangle,
//                               borderRadius: BorderRadius.circular(15.0),
//                               image: DecorationImage(
//                                 image:
//                                     NetworkImage(blockedUser.profilePhotoURL),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 8),
//                           Text(
//                             blockedUser.fullName,
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                                 color: AppColors.primaryDark),
//                           ),
//                         ],
//                       ),
//                     ),
//                     BlocListener<ProfileCubit, ProfileState>(
//                       listener: (context, state) {
//                         if (state is ProfileLoadedState) {
//                           _blockedUsersPaginatedController.reset();
//                           _loadBlockedUsersPage();
//                         }
//                       },
//                       child: SizedBox(
//                         height: 30,
//                         child: PrimaryButton(
//                           title: 'Unblock',
//                           fontSize: 14,
//                           action: () async {
//                             final userId = await TokenUtil.getUserId();
//                             if (userId != null) {
//                               profileCubit.unBlockAccountCubit(
//                                   blockOrUnBlockId: blockedUser.blockedUserId,
//                                   userId: userId);
//                             }
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }
// }
