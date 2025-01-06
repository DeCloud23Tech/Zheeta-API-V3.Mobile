// import 'package:auto_route/annotations.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:zheeta/app/common/color.dart';
// import 'package:zheeta/app/common/extensions/num_extension.dart';
// import 'package:zheeta/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
// import 'package:zheeta/widgets/back_button.dart';
// import 'package:zheeta/widgets/input_field.dart';
// import 'package:zheeta/widgets/primary_button.dart';
//
// @RoutePage()
// class ProfileBoostScreen extends StatefulWidget {
//   const ProfileBoostScreen();
//
//   @override
//   _ProfileBoostScreenState createState() => _ProfileBoostScreenState();
// }
//
// class _ProfileBoostScreenState extends State<ProfileBoostScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.secondaryLight,
//       appBar: AppBar(
//         backgroundColor: AppColors.secondaryLight,
//         elevation: 0.0,
//         leading: AppBackButton(),
//         title: Text(
//           'Promote Profile',
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
//             child: Form(
//               // key: formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           // userPostsBottomSheet(
//                           //     context, widget.subscriptionPlan, selectedMedias,
//                           //     (List<ActivityModel> selectedImages) {
//                           //   setState(() {
//                           //     selectedMedias = selectedImages;
//                           //   });
//                           // });
//                         },
//                         child: DottedBorder(
//                           dashPattern: [8, 4],
//                           strokeWidth: 1.5,
//                           color: AppColors.grey.withOpacity(0.5),
//                           strokeCap: StrokeCap.round,
//                           borderType: BorderType.RRect,
//                           radius: Radius.circular(10),
//                           child: Container(
//                             color: AppColors.white,
//                             width: 100,
//                             height: 100,
//                             padding: EdgeInsets.all(12),
//                             child: Center(
//                               child: RichText(
//                                 text: TextSpan(
//                                   children: [
//                                     WidgetSpan(
//                                       child: SvgPicture.asset(
//                                           'assets/images/icons/add-media.svg'),
//                                     ),
//                                     TextSpan(
//                                       text: ' Add',
//                                       style: TextStyle(
//                                           color: AppColors.primaryDark,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                     TextSpan(
//                                       text: ' file',
//                                       style: TextStyle(
//                                         color: AppColors.grey,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 15),
//                       // Expanded(
//                       //   child: Wrap(
//                       //     spacing: 10,
//                       //     runSpacing: 10,
//                       //     children:
//                       //         List.generate(selectedMedias.length, (index) {
//                       //       return Stack(
//                       //         children: [
//                       //           Container(
//                       //             width: 100,
//                       //             height: 100,
//                       //             decoration: BoxDecoration(
//                       //               borderRadius: BorderRadius.circular(10),
//                       //               image: DecorationImage(
//                       //                 image: NetworkImage(selectedMedias[index]
//                       //                     .mediaCollectionURL[0]),
//                       //                 fit: BoxFit.cover,
//                       //               ),
//                       //             ),
//                       //           ),
//                       //           Positioned(
//                       //             top: 0,
//                       //             right: 0,
//                       //             child: GestureDetector(
//                       //               onTap: () {
//                       //                 setState(() {
//                       //                   selectedMedias.removeAt(index);
//                       //                 });
//                       //               },
//                       //               child: Container(
//                       //                 padding: EdgeInsets.all(4),
//                       //                 decoration: BoxDecoration(
//                       //                   color: AppColors.white,
//                       //                   shape: BoxShape.circle,
//                       //                 ),
//                       //                 child: Icon(
//                       //                   Icons.close,
//                       //                   color: AppColors.grey,
//                       //                   size: 10,
//                       //                 ),
//                       //               ),
//                       //             ),
//                       //           ),
//                       //         ],
//                       //       );
//                       //     }),
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   // InputField(
//                   //   controller: captionController,
//                   //   hintText: 'Write a caption (add hashtags if any)',
//                   //   minLine: 4,
//                   //   maxLine: 4,
//                   //   // validator: validateTextField,
//                   //   onChanged: (value) {},
//                   // ),
//                   // DropdownInputField(
//                   //   value: selectedCountry,
//                   //   hintText: 'Target Country',
//                   //   onChanged: (value) {
//                   //     setState(() {
//                   //       selectedCountry = value!;
//                   //       userProfileViewModel.setCountry(value);
//                   //       userProfileViewModel.loadSelectedCountryStates(value,
//                   //           clearState: true);
//                   //     });
//                   //   },
//                   //   validator: validateCountryField,
//                   //   items: userProfileViewModel.allCountries.isNotEmpty
//                   //       ? userProfileViewModel.allCountries
//                   //       : [],
//                   // ),
//                   // DropdownInputField(
//                   //   value: selectedGender,
//                   //   hintText: 'Target Gender',
//                   //   onChanged: (value) {
//                   //     setState(() {
//                   //       selectedGender = value!;
//                   //     });
//                   //   },
//                   //   validator: validateGenderField,
//                   //   items: ['Male', 'Female'],
//                   // ),
//                   // InputField(
//                   //   controller: targetCityController,
//                   //   hintText: 'Target City',
//                   //   validator: validateTextField,
//                   //   onChanged: (value) {},
//                   // ),
//                   Row(
//                     children: [
//                       // Expanded(
//                       //   child: InputField(
//                       //     controller: minAgeController,
//                       //     hintText: 'Min Age',
//                       //     validator: validateNumberField,
//                       //     onChanged: (value) {},
//                       //   ),
//                       // ),
//                       // SizedBox(width: 20),
//                       // Expanded(
//                       //   child: InputField(
//                       //     controller: maxAgeController,
//                       //     hintText: 'Max Age',
//                       //     validator: validateNumberField,
//                       //     onChanged: (value) {},
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                   // DropdownInputField(
//                   //   value: selectedMaritalStatus,
//                   //   hintText: 'Marital Status',
//                   //   onChanged: (value) {
//                   //     setState(() {
//                   //       selectedMaritalStatus = value!;
//                   //     });
//                   //   },
//                   //   validator: validateMaritalStatusField,
//                   //   items: [
//                   //     'Single',
//                   //     'Married',
//                   //     'Divorced',
//                   //     'Widowed',
//                   //     'Separated',
//                   //     'Other'
//                   //   ],
//                   // ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.check_circle_outline,
//                               color: AppColors.primaryDark,
//                               size: 30,
//                             ),
//                             Text(
//                               ' Target all',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w400,
//                                 color: AppColors.grayscale,
//                               ),
//                             ),
//                           ],
//                         ),
//                         // Text(
//                         //   'Total Matched Users: ${userProfileViewModel.matchedProfileBoostCount}',
//                         //   style: TextStyle(
//                         //     fontSize: 16,
//                         //     fontWeight: FontWeight.w400,
//                         //     color: AppColors.primaryDark,
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   ),
//                   // InputField(
//                   //   controller: manualNumberController,
//                   //   hintText: 'Manually Enter Number',
//                   //   validator: validateNumberField,
//                   //   onChanged: (value) {},
//                   // ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         // BlocBuilder<ChargesCubit, ChargesState>(
//                         //   builder: (context, state) {
//                         //     return Text(
//                         //       'Boost Charges',
//                         //       style: TextStyle(
//                         //         fontSize: 16,
//                         //         fontWeight: FontWeight.w700,
//                         //         color: AppColors.primaryDark,
//                         //       ),
//                         //     );
//                         //   },
//                         // ),
//                         Row(
//                           children: [
//                             SvgPicture.asset(
//                               'assets/images/icons/zheeta-coin-light.svg',
//                               height: 12,
//                             ),
//                             // BlocBuilder<ChargesCubit, ChargesState>(
//                             //   builder: (context, state) {
//                             //     if (state is ChargesSuccess) {
//                             //       final boostPerDayCharge = state.charges.data
//                             //           .firstWhere((charge) =>
//                             //               charge.title ==
//                             //               'Cost-Of-Boost-PerDay')
//                             //           .amount;
//                             //       return Text(
//                             //         '${boostPerDayCharge}0/day',
//                             //         style: TextStyle(
//                             //           fontSize: 16,
//                             //           fontWeight: FontWeight.w400,
//                             //           color: AppColors.grayscale,
//                             //         ),
//                             //       );
//                             //     } else {
//                             //       return SizedBox.shrink();
//                             //     }
//                             //   },
//                             // ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   // InputField(
//                   //   controller: durationController,
//                   //   hintText: 'Duration (Days)',
//                   //   validator: validateNumberField,
//                   //   onChanged: (value) {},
//                   // ),
//                   SizedBox(height: 15),
//                   Divider(color: AppColors.grey.withOpacity(0.5)),
//                   SizedBox(height: 10),
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Total Promotion cost',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w700,
//                           color: AppColors.primaryDark,
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           SvgPicture.asset(
//                             'assets/images/icons/zheeta-coin-bold.svg',
//                             height: 12,
//                           ),
//                           // Text(
//                           //   '${calculatedCost}',
//                           //   style: TextStyle(
//                           //     fontSize: 16,
//                           //     fontWeight: FontWeight.w600,
//                           //     color: AppColors.grayscale,
//                           //   ),
//                           // ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   PrimaryButton(
//                     title: 'Boost Profile',
//                     action: () {
//                       // if (formKey.currentState!.validate()) {
//                       //   userProfileViewModel.createProfileBoost(
//                       //     context,
//                       //     CreateProfileBoostRequest(
//                       //       userId: userProfileViewModel.userId!,
//                       //       targetCountry: selectedCountry,
//                       //       targetGender: selectedGender,
//                       //       targetCity: targetCityController.text,
//                       //       minAge: int.tryParse(minAgeController.text)!,
//                       //       maxAge: int.tryParse(maxAgeController.text)!,
//                       //       maritalStatus: selectedMaritalStatus,
//                       //       targetUsersNumber:
//                       //           int.tryParse(manualNumberController.text)!,
//                       //       duration:
//                       //           int.tryParse(durationController.text)!,
//                       //       adsCost: calculatedCost.toDouble(),
//                       //       photoUrlForAds: selectedMedias
//                       //           .map((media) =>
//                       //               media.mediaCollectionURL[0] as String)
//                       //           .toList(),
//                       //       caption: captionController.text,
//                       //     ),
//                       //   );
//                       // }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // class UserPostsBottomSheetView extends StatefulWidget {
// //   final String subscriptionPlan;
// //   final Function(List<ActivityModel>) onSelect;
// //   final List<ActivityModel> selectedMedias;
// //   final ScrollController scrollController;
// //
// //   UserPostsBottomSheetView({
// //     Key? key,
// //     required this.selectedMedias,
// //     required this.onSelect,
// //     required this.subscriptionPlan,
// //     required this.scrollController,
// //   }) : super(key: key);
// //
// //   @override
// //   _UserPostsBottomSheetViewState createState() =>
// //       _UserPostsBottomSheetViewState();
// // }
// //
// // class _UserPostsBottomSheetViewState extends State<UserPostsBottomSheetView> {
// //   late List<ActivityModel> _selectedMedias;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _selectedMedias = List.from(widget.selectedMedias);
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       decoration: const BoxDecoration(
// //         color: Color(0xffFFF1F7),
// //         borderRadius: BorderRadius.only(
// //             topLeft: Radius.circular(15), topRight: Radius.circular(15)),
// //       ),
// //       child: Stack(
// //         children: [
// //           ListView(
// //             controller: widget.scrollController,
// //             children: [
// //               SizedBox(height: 8),
// //               Center(
// //                 child: Container(
// //                   width: 50,
// //                   height: 4,
// //                   decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(2),
// //                       color: Color(0xffDADADA)),
// //                 ),
// //               ),
// //               SizedBox(height: 8),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                 children: [
// //                   AppCloseButton(),
// //                   Flexible(
// //                     child: Text(
// //                       'Select Media for Promote profile',
// //                       style:
// //                           TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
// //                       textAlign: TextAlign.center,
// //                     ),
// //                   ),
// //                   SizedBox(width: 20),
// //                 ],
// //               ),
// //               SizedBox(height: 5),
// //               Divider(color: AppColors.grey.withOpacity(0.5)),
// //               Padding(
// //                 padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
// //                 child: SelectPostsWidget(
// //                   subscriptionPlan: widget.subscriptionPlan,
// //                   selectedMedias: _selectedMedias,
// //                   onSelectionChanged: (selectedMedias) {
// //                     setState(() {
// //                       _selectedMedias = selectedMedias;
// //                     });
// //                   },
// //                   scrollController: widget.scrollController,
// //                 ),
// //               ),
// //               SizedBox(height: 20),
// //             ],
// //           ),
// //           Positioned(
// //             bottom: 25,
// //             left: 5,
// //             right: 5,
// //             child: Visibility(
// //               visible: _selectedMedias.isNotEmpty,
// //               child: Container(
// //                 color: AppColors.secondarySwirl,
// //                 height: 70,
// //                 child: Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
// //                   child: Row(
// //                     mainAxisSize: MainAxisSize.max,
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Expanded(
// //                         child: Padding(
// //                           padding: const EdgeInsets.all(8.0),
// //                           child: ListView.builder(
// //                             scrollDirection: Axis.horizontal,
// //                             itemCount: _selectedMedias.length,
// //                             itemBuilder: (context, index) {
// //                               final media = _selectedMedias[index];
// //                               return Padding(
// //                                 padding:
// //                                     const EdgeInsets.symmetric(horizontal: 5.0),
// //                                 child: ClipRRect(
// //                                   borderRadius: BorderRadius.circular(8),
// //                                   child: Image.network(
// //                                     media.mediaCollectionURL.isNotEmpty
// //                                         ? media.mediaCollectionURL[0]
// //                                         : 'assets/images/placeholder.png',
// //                                     height: 54,
// //                                     width: 54,
// //                                     fit: BoxFit.cover,
// //                                   ),
// //                                 ),
// //                               );
// //                             },
// //                           ),
// //                         ),
// //                       ),
// //                       IconButton(
// //                         onPressed: () {
// //                           widget.onSelect(_selectedMedias);
// //                           Navigator.of(context).pop();
// //                         },
// //                         icon: Icon(
// //                           size: 48,
// //                           Icons.check_circle,
// //                           color: AppColors.primaryDark,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // class SelectPostsWidget extends StatefulWidget {
// //   final String subscriptionPlan;
// //   final List<ActivityModel> selectedMedias;
// //   final Function(List<ActivityModel>) onSelectionChanged;
// //   final ScrollController scrollController;
// //
// //   const SelectPostsWidget({
// //     Key? key,
// //     required this.selectedMedias,
// //     required this.onSelectionChanged,
// //     required this.subscriptionPlan,
// //     required this.scrollController,
// //   }) : super(key: key);
// //
// //   @override
// //   _SelectPostsWidgetState createState() => _SelectPostsWidgetState();
// // }
// //
// // class _SelectPostsWidgetState extends State<SelectPostsWidget> {
// //   late List<ActivityModel> _selectedMedias;
// //   late ProfileCubit profileCubit;
// //
// //   bool get _isBottom {
// //     if (!widget.scrollController.hasClients) return false;
// //     final maxScroll = widget.scrollController.position.maxScrollExtent;
// //     final currentScroll = widget.scrollController.position.pixels;
// //     return currentScroll >= (maxScroll * 0.9);
// //   }
// //
// //   void _onScroll() {
// //     if (_isBottom) {
// //       final currentState = profileCubit.state;
// //       if (currentState is ProfileCompositeState && !currentState.isFetching) {
// //         profileCubit.getUserRecentActivityCubit(
// //           currentPage: currentState.currentPage + 1,
// //         );
// //       }
// //     }
// //   }
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     profileCubit = locator<ProfileCubit>();
// //     widget.scrollController.addListener(_onScroll);
// //     _selectedMedias = List.from(widget.selectedMedias);
// //   }
// //
// //   @override
// //   void dispose() {
// //     widget.scrollController.removeListener(_onScroll);
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocBuilder<ProfileCubit, ProfileState>(
// //       builder: (context, state) {
// //         if (state is ProfileCompositeState) {
// //           final List<ActivityModel>? medias = state.recentActivities?.data;
// //           print(medias);
// //           return LayoutBuilder(
// //             builder: (context, constraints) {
// //               return Padding(
// //                 padding: const EdgeInsets.only(top: 20),
// //                 child: SizedBox(
// //                   width: double.infinity,
// //                   child: Wrap(
// //                     runSpacing: 10,
// //                     spacing: 2,
// //                     alignment: WrapAlignment.spaceBetween,
// //                     runAlignment: WrapAlignment.spaceBetween,
// //                     children: medias!
// //                         .where((e) =>
// //                             e.mediaCollectionURL != null &&
// //                             e.mediaCollectionURL.isNotEmpty)
// //                         .map((e) => InkWell(
// //                               onTap: () {
// //                                 setState(
// //                                   () {
// //                                     if (widget.subscriptionPlan != '') {
// //                                       if (_selectedMedias.contains(e)) {
// //                                         _selectedMedias.remove(e);
// //                                       } else {
// //                                         if (_selectedMedias.isEmpty) {
// //                                           _selectedMedias.add(e);
// //                                         } else {
// //                                           _selectedMedias = [e];
// //                                         }
// //                                       }
// //                                     } else {
// //                                       if (_selectedMedias.contains(e)) {
// //                                         _selectedMedias.remove(e);
// //                                       } else {
// //                                         _selectedMedias.add(e);
// //                                       }
// //                                     }
// //                                     widget.onSelectionChanged(_selectedMedias);
// //                                   },
// //                                 );
// //                               },
// //                               child: Stack(
// //                                 children: [
// //                                   SizedBox(
// //                                     width: constraints.maxWidth / 3.2,
// //                                     child: MediaContainer(
// //                                         mediaPath: e.mediaCollectionURL[0]),
// //                                   ),
// //                                   if (_selectedMedias.contains(e))
// //                                     Positioned(
// //                                       bottom: 0,
// //                                       right: 8,
// //                                       child: Container(
// //                                         padding: EdgeInsets.all(2),
// //                                         decoration: BoxDecoration(
// //                                           color: AppColors.primaryDark,
// //                                           shape: BoxShape.circle,
// //                                         ),
// //                                         child: Padding(
// //                                           padding: const EdgeInsets.all(7.0),
// //                                           child: Text(
// //                                             (_selectedMedias.indexOf(e) + 1)
// //                                                 .toString(),
// //                                             style: TextStyle(
// //                                               color: Colors.white,
// //                                               fontWeight: FontWeight.bold,
// //                                             ),
// //                                           ),
// //                                         ),
// //                                       ),
// //                                     ),
// //                                 ],
// //                               ),
// //                             ))
// //                         .toList(),
// //                   ),
// //                 ),
// //               );
// //             },
// //           );
// //         } else {
// //           return Center(child: Text('No posts available.'));
// //         }
// //       },
// //     );
// //   }
// // }
// //
// // Future userPostsBottomSheet(
// //     BuildContext context,
// //     String subscriptionPlan,
// //     List<ActivityModel> selectedMedias,
// //     Function(List<ActivityModel>) onSelect) {
// //   return showModalBottomSheet(
// //     context: context,
// //     isDismissible: true,
// //     isScrollControlled: true,
// //     backgroundColor: Colors.transparent,
// //     builder: (context) {
// //       return DraggableScrollableSheet(
// //         initialChildSize: 0.5,
// //         minChildSize: 0.47,
// //         maxChildSize: 0.9,
// //         builder: (context, scrollController) {
// //           return UserPostsBottomSheetView(
// //             subscriptionPlan: subscriptionPlan,
// //             selectedMedias: selectedMedias,
// //             onSelect: onSelect,
// //             scrollController: scrollController,
// //           );
// //         },
// //       );
// //     },
// //   );
// // }
