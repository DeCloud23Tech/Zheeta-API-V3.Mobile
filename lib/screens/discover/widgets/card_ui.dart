import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/constants/color.dart';
import 'package:zheeta/screens/discover/widgets/card_model.dart';

class ExampleCard extends StatelessWidget {
  final ExampleCandidateModel candidate;
  final AppinioSwiperController controller;

  const ExampleCard({
    Key? key,
    required this.controller,
    required this.candidate,
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
          )
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
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.asset(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    "assets/images/User.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 50),
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
                            SvgPicture.asset('assets/images/icons/user.svg',
                                width: 22,
                                colorFilter: ColorFilter.mode(
                                    primaryDark, BlendMode.srcIn)),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              candidate.name!,
                              style: const TextStyle(
                                color: darkText,
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 30,
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: primaryDark,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  candidate.city!,
                                  style: const TextStyle(
                                    color: white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 25,
                              height: 25,
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: primaryDark,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  'F',
                                  style: const TextStyle(
                                    color: white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          candidate.job!,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 90,
            child: Row(
              children: [
                SizedBox(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                      onPressed: () => controller.swipeLeft(),
                      style: ButtonStyle(
                          shadowColor: MaterialStateProperty.all<Color>(
                              black.withOpacity(0.7)),
                          elevation: MaterialStateProperty.all(10),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ))),
                      child: SvgPicture.asset('assets/images/icons/close.svg')),
                ),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shadowColor: MaterialStateProperty.all<Color>(
                              black.withOpacity(0.7)),
                          elevation: MaterialStateProperty.all(10),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ))),
                      child:
                          SvgPicture.asset('assets/images/icons/favorite.svg')),
                ),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                      onPressed: () => controller.swipeRight(),
                      style: ButtonStyle(
                          shadowColor: MaterialStateProperty.all<Color>(
                              black.withOpacity(0.7)),
                          elevation: MaterialStateProperty.all(10),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ))),
                      child: SvgPicture.asset('assets/images/icons/heart.svg')),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
