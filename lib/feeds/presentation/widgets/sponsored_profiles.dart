import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/feeds/presentation/bloc/feeds_cubit.dart';
import 'package:zheeta/feeds/presentation/views/profile_boost_screen.dart';

import '../../../app/common/color.dart';
import '../../../profile/data/model/matched_profile_boost_model.dart';

class SponsoredProfilesSection extends StatelessWidget {
  const SponsoredProfilesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Sponsored Profiles",
            style: TextStyle(
              color: AppColors.grayscale,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          const Divider(thickness: 2),
          BlocBuilder<FeedsCubit, FeedsState>(
            builder: (context, state) {
              if (state is MatchedProfileBoostState) {
                return ProfilesList(profiles: state.data);
              } else if (state is MatchedProfilesLoadingState) {
                return const SizedBox.shrink();
              } else if (state is MatchedProfilesErrorState) {
                return Center(child: Text(state.errorMessage));
              }
              return const SizedBox.shrink();
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class ProfilesList extends StatelessWidget {
  final MatchedProfileBoostListModel profiles;

  const ProfilesList({required this.profiles, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: profiles.data
            .map((profile) => ProfileCard(profile: profile))
            .toList(),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final MatchedProfileBoostModel profile;

  const ProfileCard({required this.profile, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BoostViewScreen(profile: profile),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              height: 158,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(profile.profileUrlForAds),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 158,
              width: 120,
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
                  FittedBox(
                    child: Text(
                      profile.fullName,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
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
