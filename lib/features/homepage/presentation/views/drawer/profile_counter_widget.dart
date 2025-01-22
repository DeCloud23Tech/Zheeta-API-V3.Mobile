// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:zheeta/app/common/extensions/string_extension.dart';
// import 'package:zheeta/app/router/app_router.dart';
// import 'package:zheeta/app/router/app_router.gr.dart';
// import 'package:zheeta/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
//
// import '../../../../app/common/utils/format_utils.dart';
//
// Widget buildProfileCounters(BuildContext context) {
//   return BlocBuilder<ProfileCubit, ProfileState>(
//     builder: (context, state) {
//       if (state is ProfileCompositeState) {
//         final data = state.userProfile!.data;
//         return Padding(
//           padding:
//           const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               _buildCounter(context, "Friends",
//                   "${data?.profileCounters?.friendsCount}", FriendRoute()),
//               _buildCounter(context, "Direct downlines",
//                   "${data?.profileCounters?.downlinesCount}",
//                   RefereeListRoute()),
//               _buildCounter(
//                   context, "Events",
//                   "${data?.profileCounters?.successfulEventCount}", null),
//             ],
//           ),
//         );
//       } else {
//         return SizedBox.shrink();
//       }
//     },
//   );
// }
//
// GestureDetector _buildCounter(
//     BuildContext context, String title, String count, PageRouteInfo? route) {
//   return GestureDetector(
//     onTap: route != null
//         ? () {
//             Scaffold.of(context).closeDrawer();
//             router.push(route);
//           }
//         : null,
//     child: Column(
//       children: [
//         Text(
//           // formatCount(count.roundToInt),
//           '88',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 18,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//         Text(
//           title,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 14,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//       ],
//     ),
//   );
// }
