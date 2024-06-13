import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:zheeta/feeds/presentation/viewmodel/feeds_viewmodel.dart';
import 'package:zheeta/feeds/presentation/views/profile_boost_screen.dart';

import '../../../app/common/color.dart';
import '../../../profile/data/model/matched_profile_boost_model.dart';
import '../../../profile/presentation/bloc/profile_cubit.dart';
import '../../../profile/presentation/viewmodel/user_profile_viewmodel.dart';
import '../../../widgets/primary_button.dart';
import '../bloc/feeds_cubit.dart';

class SponsoredProfilesSection extends StatelessWidget {
  final FeedsViewModel feedsViewModel;

  const SponsoredProfilesSection({required this.feedsViewModel, Key? key})
      : super(key: key);

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
          StreamBuilder<FeedsState>(
            stream: feedsViewModel.stateStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData) {
                return const Center(child: Text('No data available'));
              }

              final state = snapshot.data;
              if (state is MatchedProfilesLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is MatchedProfilesErrorState) {
                return Center(child: Text('Error: ${state.errorMessage}'));
              } else if (state is MatchedProfileBoostState) {
                return ProfilesList(profiles: state.data);
              } else {
                return const Center(child: Text('Error loading data'));
              }
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
                  Text(
                    profile.fullName,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
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

