import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/discover/presentation/bloc/matches_bloc/matches_cubit.dart';
import 'package:zheeta/discover/presentation/widgets/card_ui.dart';
import 'package:zheeta/widgets/empty_content.dart';
import 'package:zheeta/widgets/empty_matches.dart';
import 'package:zheeta/widgets/loading_screen.dart';

import '../../../app/common/enums/type_of_request.dart';
import '../../data/model/match_model.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  late final AppinioSwiperController controller;
  late final MatchesCubit matchesCubit;

  @override
  void initState() {
    super.initState();
    controller = AppinioSwiperController();
    matchesCubit = context.read<MatchesCubit>();
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
          return const LoadingScreen();
        } else if (state is MatchesFriendRequestSentState) {
          matchesCubit.getMatchCubit(
              userId: 'c4eb5953-6250-41c1-9e17-b46342ae1229');
          return const LoadingScreen();
          return const EmptyContent();
        } else if (state is MatchesGottenState) {
          final mutableMatches = matchesCubit.mutableMatches;
          return _buildSwiper(mutableMatches);
        } else {
          return const SizedBox.shrink();
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
            height: MediaQuery.of(context).size.height * 0.65,
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
                  matchesCubit.removeMatchAt(prevIndex, activity.direction);
                }
              },
              cardCount: mutableMatches.length + 99999,
              cardBuilder: (BuildContext context, int index) {
                if (index >= mutableMatches.length) {
                  return const OutOfLikesScreen();
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
