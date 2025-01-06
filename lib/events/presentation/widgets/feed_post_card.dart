// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:zheeta/app/common/color.dart';
// import 'package:zheeta/events-ref-ref/data/model/feed_model.dart';
// import 'package:zheeta/events-ref-ref/presentation/widgets/post_card.dart';
//
// class FeedPostCard extends StatelessWidget {
//   final VoidCallback onTap;
//   final FeedModel feedItem;
//
//   const FeedPostCard({Key? key, required this.onTap, required this.feedItem})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           children: [
//             PostCard(
//               userName: feedItem.posterName,
//               timeAgo: '${feedItem.date.minute.toString()} Min Ago',
//               location: feedItem.location,
//               postText: feedItem.content,
//               postImages: feedItem.mediaCollectionURL,
//               likesCount: feedItem.likeCount,
//               commentsCount: feedItem.commentCount,
//               coinsCount: feedItem.totalPostCoin,
//               userImage: "assets/images/User.png",
//               redirectUrl: feedItem.redirectUrl,
//             ),
//             SizedBox(height: 20),
//             const Divider(thickness: 0.3),
//           ],
//         ),
//       ),
//     );
//   }
// }
