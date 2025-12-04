// UserBioWidget
import 'package:flutter/material.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/features/profile/data/models/user_profile_model.dart';
import 'package:zheeta/shared/widgets/transparent_button.dart';

class UserBioWidget extends StatelessWidget {
  final UserProfileDataModel? user;
  final bool showFullBio;
  final VoidCallback toggleBio;

  const UserBioWidget({
    super.key,
    required this.user,
    required this.showFullBio,
    required this.toggleBio,
  });

  @override
  Widget build(BuildContext context) {
    final name =
        '${user?.profile?.firstName ?? ''} ${user?.profile?.lastName ?? ''}';
    final aboutMe = user?.profile?.aboutMe ?? '';
    final isLongBio = aboutMe.length > 150;
    final displayedBio =
        !showFullBio && isLongBio ? '${aboutMe.substring(0, 150)}...' : aboutMe;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name
        if (name.trim().isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              name,
              style: const TextStyle(
                color: AppColors.primaryDark,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),

        // Bio text
        if (aboutMe.isNotEmpty)
          Text(
            displayedBio,
            style: const TextStyle(
              color: AppColors.grayscale,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),

        // Show More / Show Less button
        if (isLongBio)
          Align(
            alignment: Alignment.centerRight,
            child: TransparentButton(
              title: showFullBio ? 'Show Less' : 'Show More',
              action: toggleBio,
              size: 12,
            ),
          ),

        const SizedBox(height: 40),
      ],
    );
  }
}
