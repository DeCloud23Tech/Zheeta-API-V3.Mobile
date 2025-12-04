import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/features/profile/data/models/matched_profile_boost_model.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

@RoutePage()
class ProfileBoostViewScreen extends StatefulWidget {
  final ProfileBoostModel profile;
  final List<ProfileBoostModel> profiles;

  const ProfileBoostViewScreen({
    super.key,
    required this.profile,
    required this.profiles,
  });

  @override
  ProfileBoostViewScreenState createState() => ProfileBoostViewScreenState();
}

class ProfileBoostViewScreenState extends State<ProfileBoostViewScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.profiles.indexWhere((p) => p.id == widget.profile.id);
  }

  void _changeProfile(bool next) {
    setState(() {
      currentIndex = (next)
          ? (currentIndex < widget.profiles.length - 1 ? currentIndex + 1 : currentIndex)
          : (currentIndex > 0 ? currentIndex - 1 : currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    final profile = widget.profiles[currentIndex];

    return Scaffold(
      backgroundColor: AppColors.black,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTapDown: (TapDownDetails details) {
          final width = MediaQuery.of(context).size.width;
          final tapX = details.globalPosition.dx;

          if (tapX < width / 2) {
            _changeProfile(false); // Left half - previous
          } else {
            _changeProfile(true); // Right half - next
          }
        },
        child: Stack(
          children: [
            _buildBackground(profile.profileUrlForAds),
            _buildProfileInfo(profile),
            _buildCloseButton(context),
            _buildProgressIndicators(),
            _buildCaption(profile.caption),
            _buildViewProfileButton(profile),
          ],
        ),
      ),
    );
  }

  /// Background Image with Fade Placeholder
  Widget _buildBackground(String imageUrl) {
    return Positioned.fill(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Center(child: Icon(Icons.error, color: AppColors.red,)),
      ),
    );
  }

  /// Profile Picture and Name
  Widget _buildProfileInfo(ProfileBoostModel profile) {
    return Positioned(
      top: 50,
      left: 18,
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: profile.userProfileUrl == null
                  ? const Icon(Icons.person, size: 24, color: Colors.black)
                  : CachedNetworkImage(imageUrl: profile.userProfileUrl!, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            '@${profile.userName}',
            style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  /// Close Button
  Widget _buildCloseButton(BuildContext context) {
    return Positioned(
      top: 50,
      right: 18,
      child: IconButton(
        icon: const Icon(Icons.close, color: Colors.white, size: 30),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  /// Progress Indicators
  Widget _buildProgressIndicators() {
    return Positioned(
      top: 100,
      left: 10,
      right: 10,
      child: Row(
        children: List.generate(
          widget.profiles.length,
              (index) => Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              height: 3,
              decoration: BoxDecoration(
                color: index <= currentIndex ? AppColors.white : AppColors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Caption Section
  Widget _buildCaption(String? caption) {
    return Positioned(
      bottom: 85,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const Divider(color: Colors.white, thickness: 0.8),
            const SizedBox(height: 15),
            Text(
              caption ?? "",
              style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  /// View Profile Button
  Widget _buildViewProfileButton(ProfileBoostModel profile) {
    return Positioned(
      bottom: 30,
      left: 18,
      right: 18,
      child: PrimaryButton(
        title: 'View profile',
        action: () {
          context.router.push(ProfileViewRoute(profileId: profile.userId));
        },
      ),
    );
  }
}
