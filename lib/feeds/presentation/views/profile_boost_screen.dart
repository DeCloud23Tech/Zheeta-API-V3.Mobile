import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';

// import 'package:story_view/story_view.dart';
import 'package:zheeta/profile/data/model/matched_profile_boost_model.dart';

import '../../../app/router/app_router.dart';
import '../../../app/router/app_router.gr.dart';
import '../../../widgets/primary_button.dart';

class BoostViewScreen extends StatefulWidget {
  final MatchedProfileBoostModel profile;

  const BoostViewScreen({required this.profile, Key? key}) : super(key: key);

  @override
  _BoostViewScreenState createState() => _BoostViewScreenState();
}

class _BoostViewScreenState extends State<BoostViewScreen> {
  // final StoryController _storyController = StoryController();

  @override
  void initState() {
    super.initState();
    // _storyController.play();
  }

  @override
  void dispose() {
    // _storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: widget.profile.profileUrlForAds,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.18), // Overlay color
            ),
          ),
          // StoryView(
          //   storyItems: _buildStoryItems(),
          //   controller: _storyController,
          //   onComplete: () {
          //     Navigator.of(context)
          //         .pop(); // Close the screen when stories are completed
          //   },
          //   onVerticalSwipeComplete: (direction) {
          //     if (direction == Direction.down) {
          //       Navigator.of(context).pop();
          //     }
          //   },
          // ),
          Positioned(
            top: 50,
            left: 18,
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: widget.profile.userProfileUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  widget.profile.fullName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 50,
            right: 18,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.3),
                borderRadius: BorderRadius.circular(100),
              ),
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(Icons.close, color: Colors.white, size: 30),
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: 10,
            left: 10,
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    color: AppColors.white,
                    thickness: 0.8,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Divider(
                    color: AppColors.white,
                    thickness: 0.8,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Divider(
                    color: AppColors.white,
                    thickness: 0.8,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Divider(
                    color: AppColors.white,
                    thickness: 0.8,
                  ),
                ),
              ],
            ),
          ),


          Positioned(
            bottom: 85,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                // color: Colors.black.withOpacity(0.4),
                // Dark background with opacity
                borderRadius:
                    BorderRadius.circular(8), // Rounded corners (optional)
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Divider(
                      color: AppColors.white,
                      thickness: 0.8,
                    ),
                    SizedBox(height: 15),
                    Text(
                      widget.profile.userName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 15),

                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 18,
            right: 18,
            child: SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                title: 'View profile',
                action: () {
                  context.router
                      .push(ProfileViewRoute(profileId: widget.profile.userId));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

// List<StoryItem?> _buildStoryItems() {
//   List<String> urls = [
//     widget.profile.profileUrlForAds,
//   ];
//
//   return urls.map((url) {
//     return StoryItem.pageImage(
//       url: url,
//       controller: _storyController,
//       caption: Text(""),
//       duration: Duration(seconds: 8),
//       // Change speed, e.g., 5 seconds
//       imageFit: BoxFit
//           .contain, // Adjust how the image fits within the available space
//     );
//
//     // bool isImage = url.endsWith('.jpg') || url.endsWith('.png');
//     // return isImage
//     //     ? StoryItem.pageImage(
//     //   url: url,
//     //   controller: _storyController,
//     //   caption: Text("hhh"),
//     // )
//     //     : StoryItem.pageVideo(
//     //   url,
//     //   controller: _storyController,
//     //   caption: Text("hhh"),
//     // );
//   }).toList();
// }
}
