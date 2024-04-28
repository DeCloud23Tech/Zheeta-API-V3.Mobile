import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:zheeta/app/common/color.dart';

import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/discover/presentation/bloc/matches_cubit.dart';
import 'package:zheeta/discover/presentation/viewmodel/friend_request_viewmodel.dart';
import 'package:zheeta/discover/presentation/viewmodel/match_criteria_viewmodel.dart';

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

  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<String> _names = [
    "Red",
    "Blue",
    "Green",
    "Yellow",
    "Orange",
    "Grey",
    "Purple",
    "Pink"
  ];
  List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.grey,
    Colors.purple,
    Colors.pink
  ];

  @override
  void initState() {
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(text: _names[i], color: _colors[i]),
          likeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Liked ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          nopeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Nope ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          superlikeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Superliked ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);

    controller = AppinioSwiperController();
    matchCriteriaViewModel = locator<MatchCriteriaViewModel>();
    friendRequestViewModel = locator<FriendRequestViewModel>();
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
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        if (matchCriteriaViewModel.matchListModel?.data != null)
                          if (matchCriteriaViewModel
                                  .matchListModel!.data!.length ==
                              0)
                            // SizedBox(
                            //   height: MediaQuery.of(context).size.height * 0.65,
                            //   child: AppinioSwiper(
                            //     backgroundCardCount: 1,
                            //     backgroundCardScale: 0.9,
                            //     swipeOptions: SwipeOptions.only(
                            //         up: true, left: true, right: true),
                            //     allowUnlimitedUnSwipe: true,
                            //     allowUnSwipe: true,
                            //     controller: controller,
                            //     onSwipeEnd: (prevIndex, nextIndex, activity) {
                            //       final match = matchCriteriaViewModel
                            //           .matchListModel?.data![prevIndex];
                            //       if (activity.direction ==
                            //           AxisDirection.right) {
                            //         friendRequestViewModel.sendFriendRequest(
                            //           context,
                            //           receiverId: match?.id,
                            //           typeOfRequest:
                            //               TypeOfRequest.friendRequest,
                            //         );
                            //       } else if (activity.direction ==
                            //           AxisDirection.up) {
                            //         friendRequestViewModel.sendFriendRequest(
                            //           context,
                            //           receiverId: match?.id,
                            //           typeOfRequest: TypeOfRequest.superLike,
                            //         );
                            //       }
                            //     },
                            //     cardCount: matchCriteriaViewModel
                            //             .matchListModel?.data?.length ??
                            //         0,
                            //     cardBuilder: (BuildContext context, int index) {
                            //       final match = matchCriteriaViewModel
                            //           .matchListModel?.data?[index];
                            //       return ExampleCard(
                            //           match: match!, controller: controller);
                            //     },
                            //   ),
                            // )
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.65,
                              child: SwipeCards(
                                matchEngine: _matchEngine!,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    alignment: Alignment.center,
                                    color: _swipeItems[index].content.color,
                                    child: Text(
                                      _swipeItems[index].content.text,
                                      style: TextStyle(fontSize: 100),
                                    ),
                                  );
                                },
                                onStackFinished: () {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Stack Finished"),
                                    duration: Duration(milliseconds: 500),
                                  ));
                                },
                                itemChanged: (SwipeItem item, int index) {
                                  // print(
                                  //     "item: ${item.content.text}, index: $index");
                                },
                                leftSwipeAllowed: true,
                                rightSwipeAllowed: true,
                                upSwipeAllowed: true,
                                fillSpace: true,
                                likeTag: Container(
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green)),
                                  child: Text('Like'),
                                ),
                                nopeTag: Container(
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.red)),
                                  child: Text('Nope'),
                                ),
                                superLikeTag: Container(
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.orange)),
                                  child: Text('Super Like'),
                                ),
                              ),
                            )
                          else
                            SizedBox(
                              child: Center(child: Text('Hello Empty')),
                            )
                        else
                          SizedBox(
                            child: Center(child: Text('Hello Empty')),
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

class Content {
  String text;
  Color color;
  Content({required this.text, required this.color});
}
