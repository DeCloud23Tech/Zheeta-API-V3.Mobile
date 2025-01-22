// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:zheeta/profile/data/model/user_profile_model.dart';
//
//
// class CarouselSliderWidget extends StatelessWidget {
//   final UserProfileDataModel theUser;
//   final ValueChanged<int> updateCurrentIndex;
//
//   const CarouselSliderWidget({
//     Key? key,
//     required this.theUser,
//     required this.updateCurrentIndex,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final hasMultipleImages = theUser.userCarousels != null &&
//         theUser.userCarousels!.length > 1;
//     return CarouselSlider.builder(
//       itemCount: hasMultipleImages ? theUser.userCarousels!.length : 1,
//       itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
//         if (theUser.userCarousels?.isNotEmpty ?? false) {
//           return ClipRRect(
//             child: Image.network(
//               theUser.userCarousels![itemIndex].carouselPhotoUrl!,
//               fit: BoxFit.cover,
//               height: MediaQuery.of(context).size.height * 0.55,
//               width: double.infinity,
//             ),
//           );
//         } else {
//           return ClipRRect(
//             child: Image.network(
//               theUser.profile?.profilePhotoURL ?? '',
//               fit: BoxFit.cover,
//               height: MediaQuery.of(context).size.height * 0.55,
//               width: double.infinity,
//             ),
//           );
//         }
//       },
//       options: CarouselOptions(
//         autoPlay: hasMultipleImages,
//         height: MediaQuery.of(context).size.height * 0.65,
//         viewportFraction: 1.0,
//         enableInfiniteScroll: hasMultipleImages,
//         initialPage: 0,
//         onPageChanged: (index, reason) {
//           if (hasMultipleImages) {
//             updateCurrentIndex(index);
//           }
//         },
//       ),
//     );
//   }
// }
