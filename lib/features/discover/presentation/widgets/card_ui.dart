import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/extensions/string_extension.dart';
import 'package:zheeta/features/discover/data/models/match_model.dart';
import 'package:zheeta/router/app_router.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/widgets/gender_age.dart';
import 'package:zheeta/shared/widgets/gender_indicator.dart';
import 'package:zheeta/shared/widgets/network_image.dart';

class ExampleCard extends StatelessWidget {
  final MatchModel match;
  final AppinioSwiperController controller;

  const ExampleCard({
    super.key,
    required this.controller,
    required this.match,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: CupertinoColors.white,
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withValues(alpha: 0.2),
            spreadRadius: 8,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      alignment: Alignment.topCenter,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: CustomNetworkImage(
              height: MediaQuery.of(context).size.height * 0.65,
              width: MediaQuery.of(context).size.width,
              imageUrl: match.profilePhotoURL,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
              child: GestureDetector(
                onTap: () => router.push(ProfileViewRoute(profileId: match.id)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/icons/user.svg',
                            width: 22,
                            colorFilter: ColorFilter.mode(
                                AppColors.primaryDark, BlendMode.srcIn),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 150,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '@${match.username.toLowerCase()}',
                                style: const TextStyle(
                                  color: AppColors.darkText,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          GenderAgeWidget(
                            gender: match.gender.toString().getFirstLetter,
                            age: match.age,
                          ),
                          const SizedBox(width: 8),
                          GenderIndicator(
                            gender: match.gender.toString().getFirstLetter,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${match.location} (${match.distance.toString().roundToInt}km away)',
                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            child: Row(
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: () => controller.swipeLeft(),
                    style: ButtonStyle(
                      overlayColor:
                          WidgetStateProperty.all<Color>(AppColors.white),
                      shadowColor: WidgetStateProperty.all<Color>(
                          AppColors.black.withValues(alpha: 0.7)),
                      elevation: WidgetStateProperty.all(5),
                      backgroundColor:
                          WidgetStateProperty.all<Color>(AppColors.white),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    child: Transform.scale(
                      scale: 1.8,
                      child: SvgPicture.asset('assets/images/icons/close.svg'),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: () => controller.swipeUp(),
                    style: ButtonStyle(
                      overlayColor:
                          WidgetStateProperty.all<Color>(AppColors.white),
                      shadowColor: WidgetStateProperty.all<Color>(
                          AppColors.black.withValues(alpha: 0.7)),
                      elevation: WidgetStateProperty.all(5),
                      backgroundColor:
                          WidgetStateProperty.all<Color>(AppColors.white),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    child: Transform.scale(
                      scale: 1.8,
                      child:
                          SvgPicture.asset('assets/images/icons/favorite.svg'),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: () => controller.swipeRight(),
                    style: ButtonStyle(
                      overlayColor:
                          WidgetStateProperty.all<Color>(AppColors.white),
                      shadowColor: WidgetStateProperty.all<Color>(
                          AppColors.black.withValues(alpha: 0.7)),
                      elevation: WidgetStateProperty.all(5),
                      backgroundColor:
                          WidgetStateProperty.all<Color>(AppColors.white),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    child: Transform.scale(
                      scale: 1.8,
                      child: SvgPicture.asset('assets/images/icons/heart.svg'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
