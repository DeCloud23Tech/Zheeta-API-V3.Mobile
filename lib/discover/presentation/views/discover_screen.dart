import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/enums/type_of_request.dart';
import 'package:zheeta/discover/presentation/bloc/matches_cubit.dart';
import 'package:zheeta/discover/presentation/viewmodel/friend_request_viewmodel.dart';
import 'package:zheeta/discover/presentation/viewmodel/match_criteria_viewmodel.dart';
import 'package:zheeta/discover/presentation/widgets/card_ui.dart';
import 'package:zheeta/widgets/empty_content.dart';
import 'package:zheeta/widgets/loading_screen.dart';

class DiscoverPage extends ConsumerStatefulWidget {
  const DiscoverPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DiscoverPageConsumerState();
}

class _DiscoverPageConsumerState extends ConsumerState<DiscoverPage> {
  late final AppinioSwiperController controller;
  late MatchCriteriaViewModel matchCriteriaViewModel;
  late FriendRequestViewModel friendRequestViewModel;

  @override
  void initState() {
    controller = AppinioSwiperController();
    matchCriteriaViewModel = MatchCriteriaViewModel();
    friendRequestViewModel = FriendRequestViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchesCubit, MatchesState>(
      builder: (context, state) {
        if (state is MatchesLoadingState) {
          return LoadingScreen();
        } else if (state is MatchesEmptyState) {
          return EmptyContent();
        } else {
          return Scaffold(
            backgroundColor: AppColors.primaryDark,
            body: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: MediaQuery.of(context).size.width * 0.74,
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.65,
                          child: AppinioSwiper(
                            backgroundCardCount: 1,
                            backgroundCardScale: 0.9,
                            swipeOptions: SwipeOptions.only(
                                up: true, left: true, right: true),
                            allowUnlimitedUnSwipe: true,
                            allowUnSwipe: true,
                            controller: controller,
                            onSwipeEnd: (prevIndex, nextIndex, activity) {
                              final match = matchCriteriaViewModel
                                  .matchListModel?.data![prevIndex];
                              if (activity.direction == AxisDirection.right) {
                                friendRequestViewModel.sendFriendRequest(
                                  context,
                                  receiverId: match?.id,
                                  typeOfRequest: TypeOfRequest.friendRequest,
                                );
                              } else if (activity.direction ==
                                  AxisDirection.up) {
                                friendRequestViewModel.sendFriendRequest(
                                  context,
                                  receiverId: match?.id,
                                  typeOfRequest: TypeOfRequest.superLike,
                                );
                              }
                            },
                            cardCount: matchCriteriaViewModel
                                    .matchListModel?.data?.length ??
                                0,
                            cardBuilder: (BuildContext context, int index) {
                              final match = matchCriteriaViewModel
                                  .matchListModel?.data?[index];
                              return ExampleCard(
                                  match: match!, controller: controller);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
