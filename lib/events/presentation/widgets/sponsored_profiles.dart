
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/events/presentation/bloc/sponsored_boost_cubit/sponsored_boost_cubit.dart';
import 'package:zheeta/profile/data/model/matched_profile_boost_model.dart';
import 'package:auto_route/auto_route.dart';

class SponsoredProfilesSection extends StatelessWidget {
  const SponsoredProfilesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: BlocBuilder<SponsoredBoostCubit, SponsoredBoostState>(
        builder: (context, state) {
          if (state is SponsoredBoostLoadedState &&
              state.boosts.data.isNotEmpty) {
            return ProfilesList(profiles: state.boosts);
          } else if (state is SponsoredBoostLoadingState) {
            return _buildShimmerPlaceholder(); // Show shimmer while loading
          } else if (state is SponsoredBoostErrorState) {
            return const SizedBox.shrink();
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildShimmerPlaceholder() {
    return Column(
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
        const SizedBox(height: 5),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              5, // Number of shimmer cards to display
              (index) => Builder(builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.width * 0.42,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        const Divider(thickness: 0.3),
      ],
    );
  }
}

class ProfilesList extends StatelessWidget {
  final ProfileBoostListModel profiles;

  const ProfilesList({required this.profiles, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const SizedBox(height: 5),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: profiles.data
                .map(
                  (profile) => ProfileCard(
                    profile: profile,
                    profiles: profiles,
                  ),
                )
                .toList(),
          ),
        ),
        const Divider(thickness: 0.3),
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  final ProfileBoostModel profile;
  final ProfileBoostListModel profiles;

  const ProfileCard({
    required this.profile,
    required this.profiles,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(
            ProfileBoostViewRoute(profile: profile, profiles: profiles.data));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.42,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(profile.profileUrlForAds),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.width * 0.42,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.black.withOpacity(0.9),
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Positioned(
              bottom: 6,
              left: 6,
              right: 6,
              child: Row(
                children: [
                  Container(
                    height: 16,
                    width: 16,
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl: profile.userProfileUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      profile.fullName,
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
            ),
          ],
        ),
      ),
    );
  }
}

