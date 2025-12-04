// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:zheeta/core/constants/color.dart';
// import 'package:zheeta/di/di.dart';
// import 'package:zheeta/features/buddy_events/data/models/buddy_search_response.dart';
// import 'package:zheeta/features/buddy_events/presentation/cubits/event_search_cubit/event_search_cubit.dart';
// import 'package:zheeta/features/profile/data/models/search_user_by_customer_model.dart';
// import 'package:zheeta/features/profile/domain/usecases/user_search_usecases.dart';
// import 'package:zheeta/features/profile/presentation/cubits/profile_search_cubit/profile_search_cubit.dart';
// import 'package:zheeta/features/profile/presentation/widgets/search_field.dart';
// import 'package:zheeta/shared/widgets/back_button.dart';
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// void showSearchBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     isScrollControlled: true,
//     context: context,
//     builder: (context) => _SearchBottomSheetContent(),
//   );
// }
//
// class _SearchBottomSheetContent extends StatefulWidget {
//   @override
//   _SearchBottomSheetContentState createState() => _SearchBottomSheetContentState();
// }
//
// class _SearchBottomSheetContentState extends State<_SearchBottomSheetContent>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   final TextEditingController _searchController = TextEditingController();
//   final ProfileSearchCubit _profileSearchCubit = locator<ProfileSearchCubit>();
//   final EventSearchCubit _eventSearchCubit = locator<EventSearchCubit>();
//   final _debouncer = Debouncer(milliseconds: 500);
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//     _searchController.addListener(_onSearchChanged);
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     _searchController.dispose();
//     _debouncer.dispose();
//     super.dispose();
//   }
//
//   void _onSearchChanged() {
//     _debouncer.run(() {
//       final query = _searchController.text.trim();
//       if (query.isEmpty) return;
//
//       if (_tabController.index == 0) {
//         _eventSearchCubit.searchEvents(
//           searchWord: query,
//           pageNo: 1,
//           pageSize: 20,
//         );
//       } else {
//         _profileSearchCubit.searchUserByCustomerCubit(
//           UserSearchByEmailParam(
//             userName: query,
//             pageNo: 1,
//             pageSize: 20,
//           ),
//         );
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.8,
//       decoration: BoxDecoration(
//         color: AppColors.secondaryLight,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20.0),
//           topRight: Radius.circular(20.0),
//         ),
//       ),
//       child: Column(
//         children: [
//           // Header Row
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.close),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//                 Text(
//                   'Search',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(width: 48), // Balance the header
//               ],
//             ),
//           ),
//
//           // Search Field
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: SearchField(
//               searchController: _searchController,
//               containerColor: AppColors.white,
//               iconColor: AppColors.black,
//               textColor: Colors.blueGrey,
//               hintText: 'Search...',
//             ),
//           ),
//
//           SizedBox(height: 16),
//
//           // Tab Bar
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 16),
//             decoration: BoxDecoration(
//               color: AppColors.white,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: TabBar(
//               controller: _tabController,
//               indicator: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: AppColors.primaryDark,
//               ),
//               labelColor: AppColors.white,
//               unselectedLabelColor: AppColors.black,
//               tabs: [
//                 Tab(text: 'Events'),
//                 Tab(text: 'Profiles'),
//               ],
//             ),
//           ),
//
//           SizedBox(height: 8),
//
//           // Tab Bar View
//           Expanded(
//             child: TabBarView(
//               controller: _tabController,
//               children: [
//                 // Events Tab
//                 BlocBuilder<EventSearchCubit, EventSearchState>(
//                   bloc: _eventSearchCubit,
//                   builder: (context, state) {
//                     if (state is EventSearchLoading) {
//                       return Center(child: CircularProgressIndicator());
//                     } else if (state is EventSearchSuccess) {
//                       if (state.response.data.isEmpty) {
//                         return _buildEmptyState('No events found');
//                       }
//                       return ListView.builder(
//                         padding: EdgeInsets.symmetric(horizontal: 16),
//                         itemCount: state.response.data.length,
//                         itemBuilder: (context, index) {
//                           final event = state.response.data[index];
//                           return EventListItem(event: event);
//                         },
//                       );
//                     }
//                     return _buildEmptyState('Search for events');
//                   },
//                 ),
//
//                 // Profiles Tab
//                 BlocBuilder<ProfileSearchCubit, ProfileSearchState>(
//                   bloc: _profileSearchCubit,
//                   builder: (context, state) {
//                     if (state is ProfileSearchLoading) {
//                       return Center(child: CircularProgressIndicator());
//                     } else if (state is ProfileSearchSuccess) {
//                       if (state.searchResults.data?.isEmpty ?? true) {
//                         return _buildEmptyState('No profiles found');
//                       }
//                       return ListView.builder(
//                         padding: EdgeInsets.symmetric(horizontal: 16),
//                         itemCount: state.searchResults.data?.length ?? 0,
//                         itemBuilder: (context, index) {
//                           final profile = state.searchResults.data?[index];
//                           return profile != null
//                               ? ProfileListItem(profile: profile)
//                               : SizedBox();
//                         },
//                       );
//                     }
//                     return _buildEmptyState('Search for profiles');
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildEmptyState(String message) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.search, size: 48, color: Colors.grey),
//           SizedBox(height: 16),
//           Text(
//             message,
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.grey,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // Debouncer class for search throttling
// class Debouncer {
//   final int milliseconds;
//   VoidCallback? _callback;
//   Timer? _timer;
//
//   Debouncer({required this.milliseconds});
//
//   void run(VoidCallback callback) {
//     _callback = callback;
//     _timer?.cancel();
//     _timer = Timer(Duration(milliseconds: milliseconds), _execute);
//   }
//
//   void _execute() {
//     if (_callback != null) {
//       _callback!();
//     }
//   }
//
//   void dispose() {
//     _timer?.cancel();
//   }
// }
//
// class EventListItem extends StatelessWidget {
//   final BuddyEventSearch event;
//
//   const EventListItem({super.key, required this.event});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: CircleAvatar(backgroundImage: NetworkImage(event.eventMainPhotoUrl)),
//       title: Text(event.title),
//       subtitle: Text(event.description),
//       // onTap: () => Navigator.push(context, EventDetailsRoute(event: event)),
//     );
//   }
// }
//
// class ProfileListItem extends StatelessWidget {
//   final SearchUserByCustomer profile;
//
//   const ProfileListItem({super.key, required this.profile});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: CircleAvatar(backgroundImage: NetworkImage(profile.profileDisplayURL?? '')),
//       title: Text(profile.username?? ''),
//       subtitle: Text(profile.username?? ''),
//       // onTap: () => Navigator.push(context, ProfileRoute(profile: profile)),
//     );
//   }
// }
