// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:zheeta/app/common/color.dart';
// import 'package:zheeta/buddy_events/data/model/feed_model.dart';
// import 'package:zheeta/widgets/close_button.dart';
//
// @RoutePage()
// class FeedPostImageScreen extends StatelessWidget {
//   final FeedModel feedItem;
//
//   const FeedPostImageScreen({super.key, required this.feedItem});
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: AppColors.secondaryLight,
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             // Top Bar
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   AppCloseButton(
//                     iconColor: AppColors.black.withOpacity(0.4),
//                     onTap: () {
//                       Navigator.pop(context); // Close the current screen
//                     },
//                   ),
//                   Icon(
//                     Icons.more_horiz,
//                     color: AppColors.black.withOpacity(0.4),
//                   ),
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 80),
//
//             // Post Image
//             ClipRRect(
//               borderRadius: BorderRadius.circular(5),
//               child: Image.network(
//                 feedItem.mediaCollectionURL[0],
//                 fit: BoxFit.cover,
//                 width: screenWidth,
//               ),
//             ),
//
//             const SizedBox(height: 80),
//
//             // Like, Unlike, and Comment Buttons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _buildIconWithText(
//                   iconPath: "assets/images/icons/like.svg",
//                   text: '${feedItem.likeCount}',
//                   color: AppColors.black,
//                 ),
//                 const SizedBox(width: 20),
//                 _buildIconWithText(
//                   iconPath: "assets/images/icons/unlike.svg",
//                   text: '${feedItem.unlikeCount}',
//                   color: AppColors.black,
//                 ),
//                 const SizedBox(width: 20),
//                 _buildIconWithText(
//                   iconPath: "assets/images/icons/comment.svg",
//                   text: '${feedItem.commentCount}',
//                   color: AppColors.black,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildIconWithText({
//     required String iconPath,
//     required String text,
//     required Color color,
//   }) {
//     return Row(
//       children: [
//         SvgPicture.asset(
//           iconPath,
//           height: 25,
//         ),
//         const SizedBox(width: 5),
//         Text(
//           text,
//           style: TextStyle(
//             color: color,
//             fontSize: 12,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//       ],
//     );
//   }
// }
