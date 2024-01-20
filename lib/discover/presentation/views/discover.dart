import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: AppinioSwiper(
                  swipeOptions: SwipeOptions.only(up: true, left: true, right: true),
                  allowUnlimitedUnSwipe: true,
                  controller: controller,
                  cardCount: candidates.length,
                  cardBuilder: (BuildContext context, int index) {
                    return ExampleCard(candidate: candidates[index], controller: controller);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
