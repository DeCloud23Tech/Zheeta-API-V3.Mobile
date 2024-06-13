// UserBioWidget
import 'package:flutter/material.dart';

import '../../../app/common/color.dart';
import '../../../widgets/transparent_button.dart';
import '../../data/model/user_profile_model.dart';

class UserBioWidget extends StatelessWidget {
  final UserProfileDataModel? user;
  final bool showFullBio;
  final VoidCallback toggleBio;

  UserBioWidget({
    required this.user,
    required this.showFullBio,
    required this.toggleBio,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (user?.profile?.aboutMe.isNotEmpty) SizedBox(height: 20),
        if (user?.profile?.aboutMe.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              '${user?.profile?.firstName} ${user?.profile?.lastName}',
              style: const TextStyle(
                color: AppColors.primaryDark,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
        Text(
          (user?.profile?.aboutMe.length ?? 0) > 150 && showFullBio
              ? '${user?.profile?.aboutMe.substring(0, 150)}...'
              : user?.profile?.aboutMe,
          style: const TextStyle(
            color: AppColors.grayscale,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        if (user?.profile?.aboutMe.isNotEmpty) SizedBox(height: 5),
        Align(
          alignment: Alignment.centerRight,
          child: TransparentButtonNew(
            title: showFullBio ? 'Show More' : 'Show Less',
            action: toggleBio,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
