import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/features/profile/presentation/widgets/profile_image_container.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

class ProfileImageSection extends StatelessWidget {
  final String? profilePhotoUrl;
  final File? profilePicture;
  final VoidCallback onChooseImage;
  final VoidCallback onUpdate;
  final bool isUpdating;

  const ProfileImageSection({
    super.key,
    required this.profilePhotoUrl,
    required this.profilePicture,
    required this.onChooseImage,
    required this.onUpdate,
    this.isUpdating = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: GestureDetector(
              onTap: onChooseImage,
              child: profilePhotoUrl == null
                  ? buildProfileImageContainer(
                      'assets/images/photo-container.png', null)
                  : profilePicture != null
                      ? ClipOval(
                          child: Image.file(
                            profilePicture!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        )
                      : buildProfileImageContainer(
                          profilePhotoUrl!, profilePhotoUrl),
            ),
          ),
          const SizedBox(height: 10),
          if (profilePicture != null)
            Container(
              height: 25,
              margin: EdgeInsets.symmetric(horizontal: 60),
              child: PrimaryButton(
                color: AppColors.secondaryLight,
                invert: true,
                title: 'Save New Image',
                fontSize: 12,
                action: profilePicture != null ? onUpdate : null,
              ),
            ),
        ],
      ),
    );
  }
}
