import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/feeds/presentation/viewmodel/feeds_viewmodel.dart';

import '../../../app/injection/di.dart';
import '../../../profile/data/model/matched_profile_boost_model.dart';
import '../../../profile/presentation/bloc/profile_cubit.dart';
import '../../../profile/presentation/viewmodel/user_profile_viewmodel.dart';
import '../../../widgets/input_field.dart';
import '../../../widgets/primary_button.dart';
import '../widgets/feed_post_card.dart';
import '../widgets/feeds_search_bar.dart';
import '../widgets/sponsored_profiles.dart';
import 'feed_post_screen.dart';

class FeedsSection extends StatefulWidget {
  const FeedsSection({super.key});

  @override
  State<FeedsSection> createState() => _FeedsSectionState();
}

class _FeedsSectionState extends State<FeedsSection> {
  late FeedsViewModel feedsViewModel;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    feedsViewModel = locator<FeedsViewModel>();
    feedsViewModel.getMatchedProfileBoost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            FeedSearchBar(searchController: _searchController),
            SponsoredProfilesSection(
                feedsViewModel: feedsViewModel),
            ColoredBox(
              color: AppColors.secondaryLight,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (var i = 0; i < 6; i++)
                      FeedPostCard(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FeedPost(),
                            ),
                          );
                        },
                      ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 100), // Consolidated padding
          ],
        ),
      ),
    );
  }
}
