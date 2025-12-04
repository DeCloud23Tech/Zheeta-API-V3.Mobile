import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:auto_route/auto_route.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/features/buddy_events/presentation/cubits/sponsored_boost_cubit/sponsored_boost_cubit.dart';
import 'package:zheeta/features/profile/data/models/matched_profile_boost_model.dart';

class SponsoredProfilesSection extends StatelessWidget {
  const SponsoredProfilesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: BlocBuilder<SponsoredBoostCubit, SponsoredBoostState>(
        builder: (context, state) {
          // Show profiles if loaded and not empty
          if (state.status == SponsoredBoostStatus.loaded &&
              state.boosts != null &&
              state.boosts!.data.isNotEmpty) {
            return _ProfilesList(profiles: state.boosts!);
          }

          // Show shimmer loading if loading
          if (state.status == SponsoredBoostStatus.loading) {
            return const _ShimmerPlaceholder();
          }

          // Fallback (empty / error)
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _ShimmerPlaceholder extends StatelessWidget {
  const _ShimmerPlaceholder();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle("Sponsored Profiles"),
        const SizedBox(height: 5),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              5,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: screenWidth * 0.3,
                    height: screenWidth * 0.42,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const Divider(thickness: 0.3),
      ],
    );
  }
}

class _ProfilesList extends StatelessWidget {
  final ProfileBoostListModel profiles;

  const _ProfilesList({required this.profiles});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle("Sponsored Profiles"),
        const SizedBox(height: 5),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: profiles.data
                .map((profile) =>
                    _ProfileCard(profile: profile, profiles: profiles))
                .toList(),
          ),
        ),
        const Divider(thickness: 0.3),
      ],
    );
  }
}

class _ProfileCard extends StatelessWidget {
  final ProfileBoostModel profile;
  final ProfileBoostListModel profiles;

  const _ProfileCard({
    required this.profile,
    required this.profiles,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => context.router.push(
        ProfileBoostViewRoute(profile: profile, profiles: profiles.data),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            _profileImage(profile.profileUrlForAds, screenWidth),
            _gradientOverlay(screenWidth),
            _profileInfo(context, profile),
          ],
        ),
      ),
    );
  }

  Widget _profileImage(String imageUrl, double screenWidth) {
    return Container(
      height: screenWidth * 0.42,
      width: screenWidth * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: CachedNetworkImageProvider(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _gradientOverlay(double screenWidth) {
    return Container(
      height: screenWidth * 0.42,
      width: screenWidth * 0.3,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, AppColors.black.withOpacity(0.9)],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _profileInfo(BuildContext context, ProfileBoostModel profile) {
    return Positioned(
      bottom: 6,
      left: 6,
      right: 6,
      child: Row(
        children: [
          _profileAvatar(profile.userProfileUrl),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              '@${profile.userName}',
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileAvatar(String? avatarUrl) {
    return Container(
      height: 16,
      width: 16,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: avatarUrl == null
            ? const Icon(Icons.person, size: 50)
            : CachedNetworkImage(
                imageUrl: avatarUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
      ),
    );
  }
}

/// Common reusable section title widget
Widget _sectionTitle(String title) {
  return Text(
    title,
    style: const TextStyle(
      color: AppColors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  );
}
