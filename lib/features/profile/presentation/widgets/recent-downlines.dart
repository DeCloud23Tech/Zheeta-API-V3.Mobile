import 'package:flutter/material.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/features/profile/data/models/user_profile_model.dart';
import 'package:zheeta/shared/widgets/transparent_button.dart';

class RecentDownlinesWidget extends StatelessWidget {
  final List<UserDownlines> userDownlines;
  final VoidCallback onViewAll;

  const RecentDownlinesWidget({
    super.key,
    required this.userDownlines,
    required this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Recent Downlines",
              style: TextStyle(
                color: AppColors.grayscale,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            // "View All" button aligned to the end
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: TransparentButton(
                  title: 'View all',
                  size: 12,
                  isBold: true,
                  action: onViewAll,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Horizontal scroll of downline images
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: userDownlines.take(7).map((e) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    e.profilePhotoURL!,
                    height: 42,
                    width: 42,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
