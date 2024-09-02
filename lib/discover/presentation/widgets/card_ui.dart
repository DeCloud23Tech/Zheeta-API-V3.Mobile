import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/extensions/string_extension.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/discover/data/model/match_model.dart';
import 'package:zheeta/widgets/network_image.dart';

import '../../../widgets/gender_age.dart';
import '../../../widgets/gender_indicator.dart';

class ExampleCard extends StatelessWidget {
  final MatchModel match;
  final AppinioSwiperController controller;

  const ExampleCard({
    Key? key,
    required this.controller,
    required this.match,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: CupertinoColors.white,
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.2),
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
              height: MediaQuery.of(context).size.height * 0.63,
              width: MediaQuery.of(context).size.width,
              imageUrl: match.profilePhotoURL,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 30),
              height: MediaQuery.of(context).size.height * 0.13,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: GestureDetector(
                onTap: () => router.push(ProfileViewRoute(profileId: match.id)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            child: Row(
              children: [
                SizedBox(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () => controller.swipeLeft(),
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all<Color>(AppColors.white),
                      shadowColor: MaterialStateProperty.all<Color>(
                          AppColors.black.withOpacity(0.7)),
                      elevation: MaterialStateProperty.all(5),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    child: Transform.scale(
                      scale: 1.3,
                      child: SvgPicture.asset('assets/images/icons/close.svg'),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                SizedBox(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () => controller.swipeUp(),
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all<Color>(AppColors.white),
                      shadowColor: MaterialStateProperty.all<Color>(
                          AppColors.black.withOpacity(0.7)),
                      elevation: MaterialStateProperty.all(5),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    child: Transform.scale(
                      scale: 1.4,
                      child:
                          SvgPicture.asset('assets/images/icons/favorite.svg'),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                SizedBox(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () => controller.swipeRight(),
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all<Color>(AppColors.white),
                      shadowColor: MaterialStateProperty.all<Color>(
                          AppColors.black.withOpacity(0.7)),
                      elevation: MaterialStateProperty.all(5),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    child: Transform.scale(
                      scale: 1.5,
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
