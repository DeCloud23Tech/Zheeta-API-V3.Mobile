import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/core/constants/color.dart';

import 'event_date.dart';

class EventCard extends StatelessWidget {
  final String eventMainPhotoUrl;
  final DateTime startDate;
  final String title;
  final String description;
  final String eventLocationAddress;
  final int noOfBuddiesJoined;
  final int noOfBuddiesWanted;
  final double? eventParticipationCost;
  final String category;
  final VoidCallback? onTap;
  final File? eventMainPhoto;

  const EventCard({
    super.key,
    required this.eventMainPhotoUrl,
    required this.startDate,
    required this.title,
    required this.description,
    required this.eventLocationAddress,
    required this.noOfBuddiesJoined,
    required this.noOfBuddiesWanted,
    this.eventParticipationCost,
    required this.category,
    this.onTap,
    this.eventMainPhoto,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 18.0),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: double.infinity,
                  height: 180, // Fixed height for consistency
                  child: () {
                    if (eventMainPhoto != null) {
                      return Image.file(
                        eventMainPhoto!,
                        fit: BoxFit.cover,
                      );
                    } else if (eventMainPhotoUrl.isNotEmpty) {
                      return Image.network(
                        eventMainPhotoUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            _buildPlaceholder(),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          );
                        },
                      );
                    } else {
                      return _buildPlaceholder();
                    }
                  }(),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.grayscale,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.grayscaleBody,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: AppColors.grayscaleBody,
                    size: 18,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      eventLocationAddress,
                      style: const TextStyle(
                        color: AppColors.grayscaleBody,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.groups_outlined,
                        color: AppColors.grayscaleBody,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '$noOfBuddiesJoined/$noOfBuddiesWanted needed',
                        style: const TextStyle(
                          color: AppColors.grayscaleBody,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  if (eventParticipationCost == null) ...[
                    Text(
                      'Free',
                      style: const TextStyle(
                        color: AppColors.primaryDark,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ] else ...[
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/icons/zheeta-coin-bold.svg",
                          height: 12,
                          colorFilter: const ColorFilter.mode(
                            AppColors.primaryDark,
                            BlendMode.srcIn,
                          ),
                        ),
                        // const SizedBox(width: 5),
                        Text(
                          (eventParticipationCost ?? 20).toString(),
                          style: const TextStyle(
                            color: AppColors.primaryDark,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildPlaceholder() {
  return Container(
    color: Colors.grey.shade200,
    child: const Icon(
      Icons.image_not_supported,
      size: 60,
      color: Colors.grey,
    ),
  );
}
