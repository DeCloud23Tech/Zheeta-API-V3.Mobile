// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import '../../../app/common/color.dart';
//
// class NetworkList extends StatelessWidget {
//   final String title;
//   final String subTitle;
//
//   const NetworkList({super.key, required this.title, required this.subTitle});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 14.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SvgPicture.asset('assets/images/icons/group-network.svg'),
//           SizedBox(width: 10),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                       color: AppColors.grayscale,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400),
//                 ),
//                 Text(
//                   subTitle,
//                   style: TextStyle(
//                       color: AppColors.grayscale,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );;
//   }
// }
