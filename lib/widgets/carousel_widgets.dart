import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarouselWidget extends StatelessWidget {
  bool isPicked;
  File? image;
  Function() action;
  CarouselWidget({super.key, this.isPicked = false, required this.action});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: image == null
          ? Stack(
              children: [
                Container(
                  height: 100,
                  width: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/carousel_bg.png'))),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: SvgPicture.asset('assets/images/add_carousel.svg',
                      width: 11),
                )
              ],
            )
          : Stack(
              children: [
                Container(
                  height: 100,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(image!),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    'assets/images/close_carousel.svg',
                    width: 11,
                  ),
                )
              ],
            ),
    );
  }
}
