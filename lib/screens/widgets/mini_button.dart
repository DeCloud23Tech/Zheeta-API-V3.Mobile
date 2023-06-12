// import 'package:flutter/material.dart';

// class MiniButton extends StatelessWidget {
//   final title;
//   final action;
//   final color;
//   const MiniButton({
//     Key? key,
//     required this.title,
//     required this.action,
//     this.color,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         // decoration: BoxDecoration(
//         // boxShadow: [
//         //   BoxShadow(
//         //     color: primaryPurple.withOpacity(0.6),
//         //     spreadRadius: -5,
//         //     blurRadius: 20,
//         //     offset: Offset(0, 8),
//         //   ),
//         // ],
//         // ),
//         child: ElevatedButton(
//             onPressed: (action),
//             child: Text(
//               title,
//               style: TextStyle(
//                   color: color != null ? deepBlue : primaryPurple,
//                   fontSize: 14),
//             ),
//             style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all<Color>(
//                     color != null ? color : primaryPurple),
//                 shadowColor:
//                     MaterialStateProperty.all<Color>(Colors.transparent))));
//   }
// }
