import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/app/color.dart';
import 'package:zheeta/discover/presentation/widgets/card_model.dart';
import 'package:zheeta/discover/presentation/widgets/card_ui.dart';

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
      backgroundColor: AppColors.primaryDark,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.72,
            child: AppinioSwiper(
              swipeOptions: SwipeOptions.symmetric(horizontal: true),
              allowUnlimitedUnSwipe: true,
              controller: controller,
              cardCount: candidates.length,
              cardBuilder: (BuildContext context, int index) {
                return ExampleCard(candidate: candidates[index], controller: controller);
              },
            ),
          )
        ]),
      ),
    );
  }
}
