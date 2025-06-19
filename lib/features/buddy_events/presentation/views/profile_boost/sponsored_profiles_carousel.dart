import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/core/router/app_router.gr.dart';
import 'package:zheeta/features/buddy_events/presentation/bloc/sponsored_boost_cubit/sponsored_boost_cubit.dart';
import 'package:zheeta/features/profile/data/model/matched_profile_boost_model.dart';

class SponsoredProfilesCarousel extends StatelessWidget {
  const SponsoredProfilesCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<SponsoredBoostCubit, SponsoredBoostState>(
      builder: (context, state) {
        if (state is SponsoredBoostLoadedState && state.boosts.data.isNotEmpty) {
          return Container(
            color: AppColors.primaryDark,
            width: screenWidth,
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sponsored Profiles",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: screenWidth,
                  height: screenWidth * 0.74,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.boosts.data.length,
                    itemBuilder: (context, index) {
                      final boostItem = state.boosts.data[index];
                      return _SponsoredProfileCard(
                        boostItem: boostItem,
                        screenWidth: screenWidth,
                        profiles: state.boosts.data,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _SponsoredProfileCard extends StatelessWidget {
  final ProfileBoostModel boostItem;
  final double screenWidth;
  final List<ProfileBoostModel> profiles;

  const _SponsoredProfileCard({
    required this.boostItem,
    required this.screenWidth,
    required this.profiles,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(
          ProfileBoostViewRoute(profile: boostItem, profiles: profiles),
        );
      },
      child: Container(
        width: screenWidth * 0.65,
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Info
            Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  padding: const EdgeInsets.all(1),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Container(
                      height: screenWidth * 0.42,
                      width: screenWidth * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(boostItem.userProfileUrl!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    '@${boostItem.userName}',
                    style: const TextStyle(
                      color: AppColors.grayscale,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Caption
            Text(
              boostItem.caption ?? '',
              style: const TextStyle(
                color: AppColors.grayscaleBody,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 10),

            // Profile Image
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: boostItem.profileUrlForAds,
                  fit: BoxFit.cover,
                  width: screenWidth * 0.65,
                  placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error, color: AppColors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
