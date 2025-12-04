import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/discover/data/models/match_model.dart';
import 'package:zheeta/features/discover/presentation/cubits/matches_cubit/matches_cubit.dart';
import 'package:zheeta/features/discover/presentation/widgets/card_ui.dart';
import 'package:zheeta/features/discover/presentation/widgets/empty_matches.dart';
import 'package:zheeta/shared/widgets/error_page.dart';
import 'package:zheeta/shared/widgets/loader.dart';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/discover/data/models/match_model.dart';
import 'package:zheeta/features/discover/presentation/cubits/matches_cubit/matches_cubit.dart';
import 'package:zheeta/features/discover/presentation/widgets/card_ui.dart';
import 'package:zheeta/features/discover/presentation/widgets/empty_matches.dart';
import 'package:zheeta/shared/widgets/error_page.dart';
import 'package:zheeta/shared/widgets/loader.dart';

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

  /// Called when user leaves the page
  void onLeavePage() {
    matchesCubit.onNavigate(); // ✅ Cubit decides if API calls needed
    print("🚪 User has left the DiscoverPage");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchesCubit, MatchesState>(
      builder: (context, state) {
        // Handle loading state
        if (state.isLoading) {
          return loadingMatches("Updating matches...");
        }

        // Handle error state
        if (state.errorMessage != null) {
          print("❌ Error in state: ${state.errorMessage}");
          return const ErrorPage(
            mainAxisAlignment: MainAxisAlignment.start,
          );
        }

        // Handle normal data state
        if (state is MatchesDataState) {
          return _buildSwiper(state.matches);
        }

        // Fallback
        return const SizedBox.shrink();
      },
    );
  }

  /// Builds the swipeable card stack
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
                  // ✅ Normal swipe handling
                  matchesCubit.removeMatchAt(prevIndex, activity.direction);
                  print("👉 Swipe detected at index=$prevIndex, direction=${activity.direction}");
                } else if (prevIndex == mutableMatches.length) {
                  // Prevent swiping EmptyMatches card
                  Future.delayed(const Duration(milliseconds: 100), () {
                    controller.unswipe();
                    print("↩️ Tried to swipe EmptyMatches card → unswiped.");
                  });
                }
              },
              cardCount: mutableMatches.length + 1, // +1 for EmptyMatches card
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
