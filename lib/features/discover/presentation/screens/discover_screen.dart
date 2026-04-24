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
  double _dragDx = 0;
  double _dragProgress = 0;
  int _activeCardIndex = 0;

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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: AppinioSwiper(
              duration: const Duration(milliseconds: 260),
              backgroundCardCount: 2,
              backgroundCardScale: 0.9,
              backgroundCardOffset: const Offset(0, 48),
              maxAngle: 20,
              threshold: 36,
              swipeOptions:
                  const SwipeOptions.only(up: true, left: true, right: true),
              allowUnlimitedUnSwipe: true,
              allowUnSwipe: true,
              controller: controller,
              isDisabled: mutableMatches.isEmpty,
              onCardPositionChanged: (position) {
                if (!mounted) return;
                final horizontalDominates =
                    position.offset.dx.abs() >= position.offset.dy.abs();

                setState(() {
                  _activeCardIndex = position.index;
                  _dragDx = horizontalDominates ? position.offset.dx : 0;
                  _dragProgress = horizontalDominates
                      ? position.progressRelativeToThreshold
                          .abs()
                          .clamp(0.0, 1.0)
                      : 0;
                });
              },
              onSwipeEnd: (prevIndex, nextIndex, activity) {
                final matchesCubit = context.read<MatchesCubit>();

                if (mounted) {
                  setState(() {
                    _activeCardIndex = nextIndex;
                    _dragDx = 0;
                    _dragProgress = 0;
                  });
                }

                if (prevIndex < mutableMatches.length) {
                  // ✅ Normal swipe handling
                  matchesCubit.removeMatchAt(prevIndex, activity.direction);
                  print(
                      "👉 Swipe detected at index=$prevIndex, direction=${activity.direction}");
                } else if (prevIndex == mutableMatches.length) {
                  // Prevent swiping EmptyMatches card
                  Future.delayed(const Duration(milliseconds: 100), () {
                    controller.unswipe();
                    print("↩️ Tried to swipe EmptyMatches card → unswiped.");
                  });
                }
              },
              onSwipeCancelled: (_) {
                if (!mounted) return;
                setState(() {
                  _dragDx = 0;
                  _dragProgress = 0;
                });
              },
              cardCount: mutableMatches.length + 1, // +1 for EmptyMatches card
              cardBuilder: (BuildContext context, int index) {
                if (index >= mutableMatches.length) {
                  return const EmptyMatches();
                } else {
                  final match = mutableMatches[index];
                  return ExampleCard(
                    key: ValueKey(
                        'discover-card-$index-${index == _activeCardIndex}'),
                    match: match,
                    controller: controller,
                    isActiveCard: index == _activeCardIndex,
                    swipeDx: index == _activeCardIndex ? _dragDx : 0,
                    swipeProgress:
                        index == _activeCardIndex ? _dragProgress : 0,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
