import 'package:flutter/material.dart';
import 'package:zheeta/constants/color.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:zheeta/screens/discover/widgets/card_model.dart';
import 'package:zheeta/screens/discover/widgets/card_ui.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final AppinioSwiperController controller = AppinioSwiperController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryDark,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.72,
            child: AppinioSwiper(
              swipeOptions: AppinioSwipeOptions.horizontal,
              unlimitedUnswipe: true,
              controller: controller,
              unswipe: _unswipe,
              onSwipe: _swipe,
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: 40,
              ),
              onEnd: _onEnd,
              cardsCount: candidates.length,
              cardsBuilder: (BuildContext context, int index) {
                return ExampleCard(
                    candidate: candidates[index], controller: controller);
              },
            ),
          )
        ]),
      ),
    );
  }

  void _swipe(int index, AppinioSwiperDirection direction) {
    print("the card was swiped to the: " + direction.name);
  }

  void _unswipe(bool unswiped) {
    if (unswiped) {
      print("SUCCESS: card was unswiped");
    } else {
      print("FAIL: no card left to unswipe");
    }
  }

  void _onEnd() {
    print("end reached!");
  }
}
