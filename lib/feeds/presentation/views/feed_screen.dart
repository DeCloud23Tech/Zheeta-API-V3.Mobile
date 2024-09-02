import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/feeds/presentation/bloc/feeds_cubit.dart';

import '../widgets/feed_post_card.dart';
import '../widgets/feeds_search_bar.dart';
import '../widgets/sponsored_profiles.dart';

class FeedsSection extends StatefulWidget {
  const FeedsSection({super.key});

  @override
  State<FeedsSection> createState() => _FeedsSectionState();
}

class _FeedsSectionState extends State<FeedsSection> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final feedsCubit = context.read<FeedsCubit>();
    feedsCubit.getMatchedProfileBoostCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: RefreshIndicator(
        onRefresh: () async {
          final feedsCubit = context.read<FeedsCubit>();
          feedsCubit.refreshMatchedProfileBoostCubit();
        },
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            FeedSearchBar(searchController: _searchController),
            const SponsoredProfilesSection(),
            Container(
              color: AppColors.secondaryLight,
              child: Column(
                children: List.generate(
                  6,
                  (index) => FeedPostCard(
                    onTap: () {
                      context.router.push(FeedPostRoute());
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
