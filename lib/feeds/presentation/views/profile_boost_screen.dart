import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
import 'package:zheeta/profile/data/model/matched_profile_boost_model.dart';

import '../../../widgets/primary_button.dart';

class BoostViewScreen extends StatefulWidget {
  final MatchedProfileBoostModel profile;

  const BoostViewScreen({required this.profile, Key? key}) : super(key: key);

  @override
  _BoostViewScreenState createState() => _BoostViewScreenState();
}

class _BoostViewScreenState extends State<BoostViewScreen> {
  final StoryController _storyController = StoryController();

  @override
  void initState() {
    super.initState();
    _storyController.play();
  }

  @override
  void dispose() {
    _storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          StoryView(
            storyItems: _buildStoryItems(),
            controller: _storyController,
            onComplete: () {
              Navigator.of(context)
                  .pop(); // Close the screen when stories are completed
            },
            onVerticalSwipeComplete: (direction) {
              if (direction == Direction.down) {
                Navigator.of(context).pop();
              }
            },
          ),
          Positioned(
            top: 100,
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
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            right: 18,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(Icons.close, color: Colors.white, size: 30),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 18,
            right: 18,
            child: SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                title: 'View profile',
                action: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<StoryItem?> _buildStoryItems() {
    List<String> urls = [
      widget.profile.profileUrlForAds,
    ];

    return urls.map((url) {
      return StoryItem.pageImage(
        url: url,
        controller: _storyController,
        caption: Text(""),
        duration: Duration(seconds: 8),
        // Change speed, e.g., 5 seconds
        imageFit: BoxFit
            .contain, // Adjust how the image fits within the available space
      );

      // bool isImage = url.endsWith('.jpg') || url.endsWith('.png');
      // return isImage
      //     ? StoryItem.pageImage(
      //   url: url,
      //   controller: _storyController,
      //   caption: Text("hhh"),
      // )
      //     : StoryItem.pageVideo(
      //   url,
      //   controller: _storyController,
      //   caption: Text("hhh"),
      // );
    }).toList();
  }
}
