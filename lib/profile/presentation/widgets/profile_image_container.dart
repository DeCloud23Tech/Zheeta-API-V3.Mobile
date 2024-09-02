import 'package:flutter/material.dart';

import '../../../app/common/color.dart';

Widget buildImageContainer(String imagePath, String? profilePhotoURL) {
  return Stack(
    children: [
      ClipOval(
        child: profilePhotoURL == null
            ? Image.asset(
                imagePath,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              )
            : Image.network(
                imagePath,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
      ),
      Positioned(
        bottom: 10,
        right: 12,
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.camera_alt,
            color: AppColors.grayscale,
          ),
        ),
      )
    ],
  );
}
