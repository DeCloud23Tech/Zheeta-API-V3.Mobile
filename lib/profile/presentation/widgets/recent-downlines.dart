// RecentRefereesWidget
import 'package:flutter/material.dart';

import '../../../app/common/color.dart';
import '../../../widgets/transparent_button.dart';
import '../../data/model/user_profile_model.dart';

class RecentDownlinesWidget extends StatelessWidget {
  final List<UserDownlines>? userDownlines;
  final VoidCallback onViewAll;

  RecentDownlinesWidget({
    required this.userDownlines,
    required this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Recent Downlines",
              style: TextStyle(
                color: AppColors.grayscale,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            TransparentButtonNew(
              title: 'View all',
              size: 18,
              action: onViewAll,
            ),
          ],
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: userDownlines
                ?.map(
                  (e) => GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      e.profilePhotoURL,
                      height: 42,
                      width: 42,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            )
                .toList() ??
                [],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
