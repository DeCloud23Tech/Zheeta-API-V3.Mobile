// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class OutlinesButton extends StatelessWidget {
//   final title;
//   final action;
//   final invert;
//   final icon;
//   final icon2;
//   const OutlinesButton({
//     Key? key,
//     required this.title,
//     required this.action,
//     this.invert = false,
//     this.icon,
//     this.icon2,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(
//               width: 2, color: invert ? primaryPurple : Colors.white),
//         ),
//         child: ElevatedButton(
//           onPressed: (action),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               icon != null
//                   ? Row(children: [
//                       SvgPicture.asset(
//                         icon,
//                         color: invert ? primaryPurple : white,
//                       ),
//                       SizedBox(width: 5)
//                     ])
//                   : SizedBox(),
//               Text(
//                 title,
//                 style: TextStyle(
//                     color: invert ? primaryPurple : white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold),
//               ),
//               icon2 != null
//                   ? Row(children: [
//                       SizedBox(width: 5),
//                       SvgPicture.asset(
//                         icon2,
//                         color: invert ? primaryPurple : white,
//                       ),
//                     ])
//                   : SizedBox(),
//             ],
//           ),
//           style: ButtonStyle(
//               backgroundColor: MaterialStateProperty.all<Color>(
//                   invert ? Colors.transparent : primaryPurple),
//               shadowColor: MaterialStateProperty.all<Color>(
//                   invert ? Colors.transparent : primaryPurple)),
//         ));
//   }
// }
