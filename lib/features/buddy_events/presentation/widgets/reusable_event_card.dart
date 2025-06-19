import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/common/constants/color.dart';

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
                child: Stack(
                  children: [
                    eventMainPhoto != null
                        ? Image.file(
                            eventMainPhoto!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.18,
                          )
                        : Image.network(
                            eventMainPhotoUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.18,
                            errorBuilder: (context, error, stackTrace) => Icon(Icons
                                .image_not_supported), // Handle errors gracefully
                          ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: formatEventDateWidget(startDate),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            color: AppColors.primaryDark,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
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
