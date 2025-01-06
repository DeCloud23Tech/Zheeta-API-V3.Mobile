import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/widgets/loader.dart';

Widget buildImageContainer(String imagePath, String? profilePhotoURL) {
  return Stack(
    children: [
      ClipOval(
        child: profilePhotoURL == null
            ? Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              )
            : CachedNetworkImage(
                imageUrl: profilePhotoURL,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: LoadingIndicator(), // Loading indicator
                ),
                errorWidget: (context, url, error) => Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.grey, // Optional: fallback color
                  ),
                  child: Icon(Icons.error,
                      color: AppColors.white), // Fallback icon
                ),
              ),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.camera_alt,
            size: 18,
            color: AppColors.grayscale,
          ),
        ),
      )
    ],
  );
}
