import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/core/router/app_router.dart';
import 'package:zheeta/core/router/app_router.gr.dart';
import 'package:zheeta/features/discover/data/model/match_model.dart';
import 'package:zheeta/features/discover/presentation/bloc/matches_bloc/matches_cubit.dart';
import 'package:zheeta/features/discover/presentation/widgets/card_ui.dart';
import 'package:zheeta/features/discover/presentation/widgets/empty_matches.dart';
import 'package:zheeta/utils/token_utils.dart';
import 'package:zheeta/widgets/error_page.dart';
import 'package:zheeta/widgets/loader.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  late final AppinioSwiperController controller;
  final MatchesCubit matchesCubit = locator<MatchesCubit>();

  @override
  void initState() {
    super.initState();
    controller = AppinioSwiperController();
  }

  @override
  void dispose() {
    onLeavePage();
    super.dispose();
  }

  void onLeavePage() {
    matchesCubit.onNavigate();
    print("User has left the DiscoverPage");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchesCubit, MatchesState>(
      builder: (context, state) {
        if (state is MatchesLoadingState) {
          return loadingMatches("Updating matches...");
        } else if (state is MatchesGottenState) {
          final mutableMatches = matchesCubit.mutableMatches;
          return _buildSwiper(mutableMatches);
        } else if (state is MatchesErrorState) {
          return ErrorPage(
            mainAxisAlignment: MainAxisAlignment.start,
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildSwiper(List<MatchModel> mutableMatches) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.68,
            child: AppinioSwiper(
              backgroundCardCount: 2,
              backgroundCardScale: 0.9,
              swipeOptions:
                  const SwipeOptions.only(up: true, left: true, right: true),
              allowUnlimitedUnSwipe: true,
              allowUnSwipe: true,
              controller: controller,
              isDisabled: mutableMatches.isEmpty,
              onSwipeEnd: (prevIndex, nextIndex, activity) {
                final matchesCubit = context.read<MatchesCubit>();

                if (prevIndex < mutableMatches.length) {
                  // Normal swipe handling
                  matchesCubit.removeMatchAt(prevIndex, activity.direction);
                } else if (prevIndex == mutableMatches.length) {
                  Future.delayed(Duration(milliseconds: 100), () {
                    controller.unswipe();
                  });
                }
              },
              cardCount: mutableMatches.length + 1,
              cardBuilder: (BuildContext context, int index) {
                if (index >= mutableMatches.length) {
                  return const EmptyMatches();
                } else {
                  final match = mutableMatches[index];
                  return ExampleCard(match: match, controller: controller);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
