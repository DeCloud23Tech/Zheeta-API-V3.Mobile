import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/connections/data/requests/friend_request_model.dart';
import 'package:zheeta/features/connections/data/models/get_pending_friends_model.dart';
import 'package:zheeta/features/connections/presentation/cubits/friends_cubit/friends_cubit.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/gender_indicator.dart';
import 'package:zheeta/shared/widgets/loader.dart';
import 'package:zheeta/shared/widgets/pill_container.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

// @RoutePage()
// class FriendRequestsScreen extends StatelessWidget {
//   const FriendRequestsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// class FriendRequestsScreen extends StatefulWidget {
//   const FriendRequestsScreen({super.key});
//
//   @override
//   State<FriendRequestsScreen> createState() => _FriendRequestsScreenState();
// }
//
// // ... (imports and class structure)
//
// class _FriendRequestsScreenState extends State<FriendRequestsScreen> {
//   late PaginatedListController<FriendRequestModel, FriendsCubit, FriendsState>
//       _friendsPaginatedController;
//
//   final ScrollController _scrollController = ScrollController();
//   FriendsCubit friendCubit = locator<FriendsCubit>();
//
//   @override
//   void initState() {
//     super.initState();
//
//     _friendsPaginatedController =
//         PaginatedListController<FriendRequestModel, FriendsCubit, FriendsState>(
//       fetchItems: (param) => friendCubit.fetchFriendRequestsCubit(param),
//       cubit: friendCubit,
//     );
//
//     _scrollController.addListener(_scrollListener);
//     _loadFriendRequestsPage();
//   }
//
//   void _loadFriendRequestsPage() {
//     _friendsPaginatedController.loadNextPage(
//       successCondition: (state) => state is FriendRequestsFetchedState,
//       extractItems: (state) =>
//           (state as FriendRequestsFetchedState).currentPendingRequests,
//       // Refined error condition: An error occurs if FriendsDataState has an errorMessage
//       isError: (state) =>
//           state is FriendsDataState && state.errorMessage != null,
//     );
//   }
//
//   void _scrollListener() {
//     // Only load next page if not already loading and there are more items
//     if (_isBottom &&
//         !_friendsPaginatedController.isLoading &&
//         _friendsPaginatedController.hasMoreItems) {
//       _loadFriendRequestsPage();
//     }
//   }
//
//   bool get _isBottom {
//     if (!_scrollController.hasClients) return false;
//     final maxScroll = _scrollController.position.maxScrollExtent;
//     final currentScroll = _scrollController.position.pixels;
//     return currentScroll >= (maxScroll * 0.9);
//   }
//
//   void processFriendRequest(FriendRequestModel friendRequest, bool accept) {
//     final request = FriendRequest(
//       requestId: friendRequest.id,
//       state: accept,
//     );
//     friendCubit.processFriendRequestsCubit(request);
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     // It's good practice to dispose the cubits if you're managing their lifecycle here
//     // If they are provided via BlocProvider at a higher level, they will be disposed there.
//     // If you created them with locator here, you might want to call .close()
//     friendCubit.close();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<FriendsCubit, FriendsState>(
//       listener: (context, state) {
//         if (state is FriendRequestProcessedSuccessState) {
//           NotifyUser.showSnackBar("Friend request processed successfully!");
//           // Refresh the friend requests list after processing
//           _friendsPaginatedController.reset(); // Clears existing items
//           _loadFriendRequestsPage(); // Fetches the first page again
//         } else if (state is FriendsDataState && state.errorMessage != null) {
//           // Listen for errors from initial fetch or subsequent pagination calls
//           NotifyUser.showSnackBar(state.errorMessage!);
//         }
//       },
//       child: Scaffold(
//         backgroundColor: AppColors.secondaryLight,
//         appBar: AppBar(
//           backgroundColor: AppColors.secondaryLight,
//           elevation: 0.0,
//           leading: AppBackButton(),
//           title: Column(
//             children: [
//               Text(
//                 'Pending request',
//                 style: TextStyle(
//                     color: AppColors.grayscale,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600),
//               ),
//               Text(
//                 'Users waiting to be friend',
//                 style: TextStyle(
//                     color: AppColors.grey,
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400),
//               ),
//             ],
//           ),
//           centerTitle: true,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: BlocBuilder<FriendsCubit, FriendsState>(
//             builder: (context, state) {
//               // Initial Loading State:
//               // Show loading if the cubit is in a loading state AND the list is empty
//               if ((state is FriendsDataState && state.isLoading) &&
//                   _friendsPaginatedController.items.isEmpty) {
//                 return Center(child: loadingIndicator());
//               }
//
//               // Error State (if no items are loaded yet):
//               // Show error if there's an error message AND the list is empty
//               else if (state is FriendsDataState &&
//                   state.errorMessage != null &&
//                   _friendsPaginatedController.items.isEmpty) {
//                 return Center(
//                   child: Text(
//                     state.errorMessage ?? 'Failed to load friend requests.',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: AppColors.red, // Assuming you have an error color
//                     ),
//                   ),
//                 );
//               }
//
//               // "No Data" State:
//               // Show "No friend request found" if the data has been *fetched*
//               // (either FriendRequestsFetchedState or a non-loading FriendsDataState without error)
//               // AND the items list is empty.
//               else if ((state is FriendRequestsFetchedState ||
//                       (state is FriendsDataState && !state.isLoading)) &&
//                   _friendsPaginatedController.items.isEmpty) {
//                 return Center(
//                   child: Text(
//                     'No friend requests found.',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: AppColors.primaryDark,
//                     ),
//                   ),
//                 );
//               }
//
//               // Main List View (when there are items to display or loading more)
//               return ListView.builder(
//                 shrinkWrap: true,
//                 physics: AlwaysScrollableScrollPhysics(),
//                 controller: _scrollController,
//                 // Add +1 for the potential loading indicator at the bottom
//                 itemCount: _friendsPaginatedController.items.length +
//                     (_friendsPaginatedController.hasMoreItems ? 1 : 0),
//                 itemBuilder: (context, index) {
//                   if (index == _friendsPaginatedController.items.length) {
//                     // Show loading indicator at the bottom if more items are available
//                     return _friendsPaginatedController.hasMoreItems
//                         ? loadingIndicator()
//                         : const SizedBox.shrink(); // Hide if no more items
//                   }
//
//                   final friendRequest =
//                       _friendsPaginatedController.items[index];
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 10.0),
//                     child: Container(
//                       padding: EdgeInsets.all(15),
//                       decoration: BoxDecoration(
//                         color: AppColors.white,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             height: 40,
//                             width: 40,
//                             padding: EdgeInsets.all(1),
//                             decoration: BoxDecoration(
//                               color: AppColors.white,
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(8),
//                               child: Image.network(
//                                 friendRequest.requesterProfilePicture,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 10),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "@${friendRequest.requesterUserName}",
//                                   style: TextStyle(
//                                       color: AppColors.grey,
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                                 Row(
//                                   children: [
//                                     Text(
//                                       friendRequest.requesterName,
//                                       style: TextStyle(
//                                           color: AppColors.grayscale,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                     SizedBox(width: 10),
//                                     PillContainer(
//                                       text: '${friendRequest.requesterAge}',
//                                       backgroundColor: AppColors.primaryDark,
//                                       textColor: AppColors.white,
//                                       iconColor: AppColors.white,
//                                       hasGradient: true,
//                                       icon: friendRequest.requesterGender ==
//                                               'Male'
//                                           ? Icons.male
//                                           : Icons.female,
//                                     ),
//                                     SizedBox(width: 6),
//                                     GenderIndicator(
//                                         gender: friendRequest.requesterGender ==
//                                                 'Male'
//                                             ? 'M'
//                                             : 'F'),
//                                   ],
//                                 ),
//                                 SizedBox(height: 10),
//                                 BlocBuilder<FriendsCubit, FriendsState>(
//                                   // This inner BlocBuilder is good for button state,
//                                   // but ensure it's observing relevant states for the action.
//                                   builder: (context, state) {
//                                     // You might want to tie the button's state to a specific
//                                     // processing state for this friend request ID if you have one.
//                                     // For now, I'll remove the state check that was likely incorrect.
//                                     // 'state is BulkFriendRequestsSentSuccessState' is probably not what you want here.
//                                     final bool isProcessing =
//                                         false; // Add specific logic if you have a processing state per request
//                                     return SizedBox(
//                                       width: double.infinity,
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.end,
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: [
//                                           SizedBox(
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width *
//                                                 0.3,
//                                             height: 28,
//                                             child: PrimaryButton(
//                                               invert: true,
//                                               color: AppColors.secondaryLight,
//                                               state:
//                                                   isProcessing, // Use specific processing state
//                                               title: "Reject",
//                                               fontSize: 14,
//                                               action: isProcessing
//                                                   ? null
//                                                   : () {
//                                                       processFriendRequest(
//                                                           friendRequest, false);
//                                                     },
//                                             ),
//                                           ),
//                                           SizedBox(width: 10),
//                                           SizedBox(
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width *
//                                                 0.3,
//                                             height: 28,
//                                             child: PrimaryButton(
//                                               title: "Accept",
//                                               fontSize: 14,
//                                               state:
//                                                   isProcessing, // Use specific processing state
//                                               action: isProcessing
//                                                   ? null
//                                                   : () {
//                                                       processFriendRequest(
//                                                           friendRequest, true);
//                                                     },
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     );
//                                   },
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
