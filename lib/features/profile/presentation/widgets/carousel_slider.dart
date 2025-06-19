import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/features/profile/data/model/user_profile_model.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  final UserProfileDataModel theUser;
  final ValueChanged<int> updateCurrentIndex;

  const CarouselSliderWidget({
    super.key,
    required this.theUser,
    required this.updateCurrentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final hasMultipleImages =
        theUser.userCarousels != null && theUser.userCarousels!.length > 1;

    return CarouselSlider.builder(
      itemCount: hasMultipleImages
          ? (theUser.userCarousels!.length > 6
              ? 6
              : theUser.userCarousels!.length)
          : 1,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        String imageUrl = theUser.userCarousels?.isNotEmpty ?? false
            ? theUser.userCarousels![itemIndex].carouselPhotoUrl!
            : theUser.profile?.profilePhotoURL ?? '';

        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.55,
            width: double.infinity,
            placeholder: (context, url) => const Center(
              child: CupertinoActivityIndicator(),
            ),
            errorWidget: (context, url, error) => const Center(
              child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
            ),
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: hasMultipleImages,
        height: MediaQuery.of(context).size.height * 0.65,
        viewportFraction: 1.0,
        enableInfiniteScroll: hasMultipleImages,
        initialPage: 0,
        onPageChanged: (index, reason) {
          if (hasMultipleImages) {
            updateCurrentIndex(index);
          }
        },
      ),
    );
  }
}
