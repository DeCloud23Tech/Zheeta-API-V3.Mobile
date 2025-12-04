import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/features/profile/data/models/user_profile_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
    final userCarousels = theUser.userCarousels;
    final profilePhoto = theUser.profile?.profilePhotoURL ?? '';
    final int itemCount = (userCarousels != null && userCarousels.isNotEmpty)
        ? (userCarousels.length > 6 ? 6 : userCarousels.length)
        : 1;

    final double carouselHeight = MediaQuery.of(context).size.height * 0.65;

    return CarouselSlider.builder(
      itemCount: itemCount,
      itemBuilder: (context, index, _) {
        final imageUrl = (userCarousels != null && userCarousels.isNotEmpty)
            ? userCarousels[index].carouselPhotoUrl ?? profilePhoto
            : profilePhoto;

        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            height: carouselHeight * 0.85,
            width: double.infinity,
            placeholder: (context, url) =>
                const Center(child: CupertinoActivityIndicator()),
            errorWidget: (context, url, error) => const Center(
                child: Icon(Icons.broken_image, size: 50, color: Colors.grey)),
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: false,
        height: carouselHeight,
        viewportFraction: 1.0,
        enableInfiniteScroll: false,
        onPageChanged: (index, _) => updateCurrentIndex(index),
      ),
    );
  }
}
