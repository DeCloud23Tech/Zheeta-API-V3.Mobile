// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:zheeta/app/common/color.dart';
// import 'package:zheeta/app/common/mixins/image_picker.dart';
// import 'package:zheeta/widgets/input_field.dart';
// import 'package:zheeta/widgets/primary_button.dart';
//
// class UploadActivityPostScreen extends StatefulWidget {
//   const UploadActivityPostScreen({Key? key}) : super(key: key);
//
//   @override
//   _UploadActivityPostScreenState createState() =>
//       _UploadActivityPostScreenState();
// }
//
// class _UploadActivityPostScreenState extends State<UploadActivityPostScreen>
//     with ImagePickerMixin {
//   List<File> mediaFiles = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.secondaryLight,
//       appBar: AppBar(
//         backgroundColor: AppColors.secondaryLight,
//         elevation: 0.0,
//         leading: GestureDetector(
//           onTap: () => Navigator.pop(context),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               padding: EdgeInsets.all(5),
//               height: 30,
//               width: 30,
//               decoration: BoxDecoration(
//                 color: AppColors.white,
//                 borderRadius: BorderRadius.circular(100),
//               ),
//               child: Icon(Icons.arrow_back_ios_new, color: AppColors.grey),
//             ),
//           ),
//         ),
//         title: Text(
//           'New Activity post',
//           style: TextStyle(
//             color: AppColors.grayscale,
//             fontSize: 24,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () async {
//                         final image = await pickImageFromGallery();
//                         if (image != null) {
//                           setState(() {
//                             mediaFiles.add(image);
//                           });
//                         }
//                       },
//                       child: DottedBorder(
//                         dashPattern: [8, 4],
//                         strokeWidth: 1.5,
//                         color: AppColors.grey.withOpacity(0.5),
//                         strokeCap: StrokeCap.round,
//                         borderType: BorderType.RRect,
//                         radius: Radius.circular(10),
//                         child: Container(
//                           color: AppColors.white,
//                           width: 100,
//                           height: 100,
//                           padding: EdgeInsets.all(12),
//                           child: Center(
//                             child: RichText(
//                               text: TextSpan(
//                                 children: [
//                                   WidgetSpan(
//                                     child: SvgPicture.asset(
//                                         'assets/images/icons/add-media.svg'),
//                                   ),
//                                   TextSpan(
//                                     text: ' Add',
//                                     style: TextStyle(
//                                         color: AppColors.primaryDark,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                   TextSpan(
//                                     text: ' file',
//                                     style: TextStyle(
//                                       color: AppColors.grey,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 15),
//                     Expanded(
//                       child: Wrap(
//                         spacing: 10,
//                         runSpacing: 10,
//                         children: List.generate(mediaFiles.length, (index) {
//                           return Stack(
//                             children: [
//                               Container(
//                                 width: 100,
//                                 height: 100,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   image: DecorationImage(
//                                     image: FileImage(mediaFiles[index]),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 top: 0,
//                                 right: 0,
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       mediaFiles.removeAt(index);
//                                     });
//                                   },
//                                   child: Container(
//                                     padding: EdgeInsets.all(4),
//                                     decoration: BoxDecoration(
//                                       color: AppColors.white,
//                                       shape: BoxShape.circle,
//                                     ),
//                                     child: Icon(
//                                       Icons.close,
//                                       color: AppColors.grey,
//                                       size: 10,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           );
//                         }),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 InputField(
//                   hintText: 'Write a caption (add hashtags if any)',
//                   minLine: 4,
//                   maxLine: 4,
//                   onChanged: (value) {},
//                 ),
//                 InputField(
//                   hintText: 'Add Location',
//                   onChanged: (value) {},
//                 ),
//                 SizedBox(height: 20),
//                 PrimaryButton(title: 'Continue', action: () {})
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
