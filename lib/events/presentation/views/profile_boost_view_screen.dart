import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/profile/data/model/matched_profile_boost_model.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class ProfileBoostViewScreen extends StatefulWidget {
  final ProfileBoostModel profile;
  final List<ProfileBoostModel> profiles;

  const ProfileBoostViewScreen({
    required this.profile,
    required this.profiles,
  });

  @override
  _ProfileBoostViewScreenState createState() => _ProfileBoostViewScreenState();
}

class _ProfileBoostViewScreenState extends State<ProfileBoostViewScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Find the index of the initial profile
    currentIndex = widget.profiles.indexWhere(
            (profile) => profile.id == widget.profile.id);
  }

  void _showNextProfile() {
    if (currentIndex < widget.profiles.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void _showPreviousProfile() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentProfile = widget.profiles[currentIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapUp: (details) {
          final width = MediaQuery.of(context).size.width;
          if (details.localPosition.dx < width / 2) {
            _showPreviousProfile(); // Left side tap
          } else {
            _showNextProfile(); // Right side tap
          }
        },
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: currentProfile.profileUrlForAds,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
              ),
            ),
            // Overlay for darkening the background image
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.18),
              ),
            ),
            // Profile info at the top-left
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
                        imageUrl: currentProfile.userProfileUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    currentProfile.fullName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            // Close button at the top-right
            Positioned(
              top: 50,
              right: 18,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(Icons.close, color: Colors.white, size: 30),
                ),
              ),
            ),
            // Horizontal dividers for indicating progress
            Positioned(
              top: 100,
              left: 10,
              right: 10,
              child: Row(
                children: List.generate(
                  widget.profiles.length,
                      (index) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Divider(
                        color: index <= currentIndex
                            ? AppColors.white
                            : AppColors.white.withOpacity(0.3),
                        thickness: 0.8,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // User details and button
            Positioned(
              bottom: 85,
              left: 0,
              right: 0,
              child: Container(
                height: 80,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
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
                        currentProfile.caption ?? "",
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
                        .push(ProfileViewRoute(profileId: currentProfile.userId));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
