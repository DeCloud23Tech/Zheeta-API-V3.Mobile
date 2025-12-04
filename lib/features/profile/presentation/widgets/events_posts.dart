// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:zheeta/core/constants/color.dart';
// import 'package:zheeta/core/utils/pagination_controller.dart';
// import 'package:zheeta/features/buddy_events/data/models/created_buddy_event.dart';
// import 'package:zheeta/shared/widgets/loader.dart';
//
// class EventsWidget<C extends Cubit<S>, S> extends StatelessWidget {
//   final PaginatedListController<CreatedBuddyEvent, C, S>
//       recentEventsPaginatedController;
//   final ScrollController recentEventsScrollController;
//   final bool Function(S state) isLoading;
//   final bool Function(S state) hasNoEvents;
//   final bool Function(S state) isError;
//   final String Function(S state) errorMessage;
//
//   const EventsWidget({
//     super.key,
//     required this.recentEventsPaginatedController,
//     required this.recentEventsScrollController,
//     required this.isLoading,
//     required this.hasNoEvents,
//     required this.isError,
//     required this.errorMessage,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       physics: const AlwaysScrollableScrollPhysics(),
//       controller: recentEventsScrollController,
//       child: BlocBuilder<C, S>(
//         builder: (context, state) {
//           if (isLoading(state) &&
//               recentEventsPaginatedController.items.isEmpty) {
//             return SizedBox(
//               height: MediaQuery.of(context).size.height * 0.5,
//               child: loadingIndicator(),
//             );
//           } else if (hasNoEvents(state) &&
//               recentEventsPaginatedController.items.isEmpty) {
//             return SizedBox(
//               height: MediaQuery.of(context).size.height * 0.5,
//               child: Center(
//                 child: Text(
//                   'No buddy events.',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: AppColors.primaryDark,
//                   ),
//                 ),
//               ),
//             );
//           } else if (isError(state)) {
//             return Center(
//               child: Text('Error: ${errorMessage(state)}'),
//             );
//           }
//
//           return SizedBox(
//             height: MediaQuery.of(context).size.height * 0.65,
//             child: ListView.builder(
//               padding: EdgeInsets.only(top: 15),
//               itemCount: recentEventsPaginatedController.items.length,
//               itemBuilder: (context, index) {
//                 // Access each CreatedBuddyEvent in the list
//                 CreatedBuddyEvent event =
//                     recentEventsPaginatedController.items[index];
//
//                 return SizedBox.shrink();
//                 //   EventCard(
//                 //   eventMainPhotoUrl: event.eventMainPhotoUrl,
//                 //   startDate: event.startDate,
//                 //   title: event.title,
//                 //   description: event.description,
//                 //   eventLocationAddress: event.eventLocationAddress,
//                 //   noOfBuddiesJoined: event.noOfBuddiesJoined,
//                 //   noOfBuddiesWanted: event.noOfBuddiesWanted,
//                 //   eventParticipationCost: event.eventParticipationCost,
//                 //   category: event.category,
//                 // );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
