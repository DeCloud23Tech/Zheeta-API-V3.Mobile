// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:zheeta/app/common/color.dart';
// import 'package:zheeta/app/router/app_router.gr.dart';
// import 'package:zheeta/buddy_events/data/model/feed_model.dart';
//
// @RoutePage()
// class FeedPostScreen extends StatelessWidget {
//   final FeedModel feedItem;
//
//   const FeedPostScreen({super.key, required this.feedItem});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primaryDark,
//       appBar: AppBar(
//         backgroundColor: AppColors.primaryDark,
//         leading: GestureDetector(
//           onTap: () => Navigator.pop(context),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               padding: EdgeInsets.all(5),
//               height: 30,
//               width: 30,
//               decoration: BoxDecoration(
//                 color: AppColors.primaryLightBackground,
//                 borderRadius: BorderRadius.circular(100),
//               ),
//               child: Icon(Icons.arrow_back_ios_new, color: AppColors.white),
//             ),
//           ),
//         ),
//         title: Text(
//           'Post',
//           style: TextStyle(
//               color: AppColors.white,
//               fontSize: 24,
//               fontWeight: FontWeight.w600),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           GestureDetector(
//             onTap: () {
//               context.router.push(FeedPostImageRoute(feedItem: feedItem));
//             },
//             child: buildSinglePostSection(
//               userName: feedItem.posterName,
//               timeAgo: '${feedItem.date.minute.toString()} Min Ago',
//               //"20 Min Ago",
//               location: feedItem.location,
//               postContent: feedItem.content,
//               postImage: feedItem.mediaCollectionURL[0],
//               likes: feedItem.likeCount,
//               dislikes: feedItem.unlikeCount,
//               comments: feedItem.commentCount,
//               coinCount: feedItem.totalPostCoin,
//               userImage: "assets/images/User.png",
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 15.0, left: 25),
//             child: Text(
//               'Comments',
//               style: TextStyle(
//                   color: AppColors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600),
//             ),
//           ),
//           const Divider(thickness: 0.5),
//         ],
//       ),
//     );
//   }
//
//   // Helper method for building icons with text
//   Widget _buildIconWithText(String iconPath, String text, bool setColor) {
//     return Row(
//       children: [
//         SvgPicture.asset(
//           iconPath,
//           colorFilter: setColor
//               ? ColorFilter.mode(AppColors.white, BlendMode.srcIn)
//               : null,
//         ),
//         const SizedBox(width: 5),
//         Text(
//           text,
//           style: const TextStyle(
//             color: AppColors.white,
//             fontSize: 12,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buildSinglePostSection({
//     required String userName,
//     required String timeAgo,
//     required String location,
//     required String postContent,
//     required String userImage,
//     required String postImage,
//     required int likes,
//     required int dislikes,
//     required int comments,
//     required double coinCount,
//   }) {
//     return Builder(builder: (context) {
//       return Container(
//         width: MediaQuery.of(context).size.width,
//         padding: const EdgeInsets.all(15),
//         decoration: BoxDecoration(
//           color: AppColors.primaryDark,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // User info and options
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       height: 38,
//                       width: 38,
//                       padding: const EdgeInsets.all(1),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(100),
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(100),
//                         child: Image.asset(
//                           userImage,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           userName,
//                           style: const TextStyle(
//                             color: AppColors.white,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           timeAgo,
//                           style: const TextStyle(
//                             color: AppColors.white,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     const Icon(
//                       Icons.more_horiz,
//                       color: AppColors.white,
//                       size: 14,
//                     ),
//                     const SizedBox(height: 4),
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.location_on_outlined,
//                           color: AppColors.white,
//                           size: 12,
//                         ),
//                         const SizedBox(width: 5),
//                         Text(
//                           location,
//                           style: const TextStyle(
//                             color: AppColors.white,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//
//             // Post content
//             Text(
//               postContent,
//               style: const TextStyle(
//                 color: AppColors.white,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             const SizedBox(height: 10),
//
//             // Post image
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Image.network(
//                 postImage,
//                 fit: BoxFit.cover,
//                 width: MediaQuery.of(context).size.width,
//               ),
//             ),
//             const SizedBox(height: 15),
//
//             // Likes, comments, and coin actions
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           height: 16,
//                           width: 16,
//                           decoration: BoxDecoration(
//                             color: AppColors.white,
//                             borderRadius: BorderRadius.circular(100),
//                           ),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(100),
//                             child: Image.asset(
//                               userImage,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 5),
//                         Text(
//                           "$userName and ${likes + dislikes} others",
//                           style: const TextStyle(
//                             color: AppColors.white,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     Row(
//                       children: [
//                         _buildIconWithText(
//                           "assets/images/icons/like.svg",
//                           "$likes",
//                           false,
//                         ),
//                         const SizedBox(width: 10),
//                         _buildIconWithText(
//                           "assets/images/icons/unlike.svg",
//                           "$dislikes",
//                           true,
//                         ),
//                         const SizedBox(width: 10),
//                         _buildIconWithText(
//                           "assets/images/icons/comment.svg",
//                           "$comments",
//                           false,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {},
//                           child: SvgPicture.asset(
//                             "assets/images/icons/link.svg",
//                             colorFilter: const ColorFilter.mode(
//                                 AppColors.white, BlendMode.srcIn),
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         GestureDetector(
//                           onTap: () {},
//                           child: SvgPicture.asset(
//                             "assets/images/icons/share.svg",
//                             colorFilter: const ColorFilter.mode(
//                                 AppColors.white, BlendMode.srcIn),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     GestureDetector(
//                       child: Row(
//                         children: [
//                           SvgPicture.asset("assets/images/icons/coin-euro.svg"),
//                           const SizedBox(width: 3),
//                           Row(
//                             children: [
//                               Text(
//                                 "$coinCount",
//                                 style: const TextStyle(
//                                   color: AppColors.white,
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                               const SizedBox(width: 3),
//                               SvgPicture.asset(
//                                 "assets/images/icons/zheeta-coin.svg",
//                                 height: 10,
//                                 colorFilter: const ColorFilter.mode(
//                                     AppColors.white, BlendMode.srcIn),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
