import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/extensions/string_extension.dart';
import 'package:zheeta/discover/data/model/match_model.dart';
import 'package:zheeta/widgets/network_image.dart';

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
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                  child: CustomNetworkImage(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    imageUrl: match.profilePhotoURL,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 60),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/icons/user.svg',
                              width: 22,
                              colorFilter: ColorFilter.mode(AppColors.primaryDark, BlendMode.srcIn),
                            ),
                            const SizedBox(width: 15),
                            Text(
                              '@${match.username}',
                              style: const TextStyle(color: AppColors.darkText, fontWeight: FontWeight.w500, fontSize: 24),
                            ),
                            const SizedBox(width: 15),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                              decoration: BoxDecoration(
                                color: AppColors.primaryDark,
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [AppColors.primaryLight, AppColors.primaryDark],
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/images/female.svg', width: 11),
                                  SizedBox(width: 3),
                                  Text(
                                    '${match.age}',
                                    style: const TextStyle(color: AppColors.white, fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 15),
                            Container(
                              width: 30,
                              height: 25,
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: AppColors.primaryDark,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  '${match.gender.toString().getFirstLetter}',
                                  style: const TextStyle(color: AppColors.white, fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${match.location} (${match.distance.toString().roundToInt}km away)',
                          style: const TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 102,
            child: Row(
              children: [
                SizedBox(
                  height: 75,
                  width: 75,
                  child: ElevatedButton(
                    onPressed: () => controller.swipeLeft(),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all<Color>(AppColors.white),
                      shadowColor: MaterialStateProperty.all<Color>(AppColors.black.withOpacity(0.7)),
                      elevation: MaterialStateProperty.all(5),
                      backgroundColor: MaterialStateProperty.all<Color>(AppColors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                    child: Transform.scale(
                      scale: 1.2,
                      child: SvgPicture.asset('assets/images/icons/close.svg'),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                SizedBox(
                  height: 75,
                  width: 75,
                  child: ElevatedButton(
                    onPressed: () => controller.swipeUp(),
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all<Color>(AppColors.white),
                        shadowColor: MaterialStateProperty.all<Color>(AppColors.black.withOpacity(0.7)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: MaterialStateProperty.all<Color>(AppColors.white),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ))),
                    child: Transform.scale(
                      scale: 1.4,
                      child: SvgPicture.asset('assets/images/icons/favorite.svg'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  height: 75,
                  width: 75,
                  child: ElevatedButton(
                    onPressed: () => controller.swipeRight(),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all<Color>(AppColors.white),
                      shadowColor: MaterialStateProperty.all<Color>(AppColors.black.withOpacity(0.7)),
                      elevation: MaterialStateProperty.all(5),
                      backgroundColor: MaterialStateProperty.all<Color>(AppColors.white),
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
