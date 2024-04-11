import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/strings.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit.dart';
import 'package:zheeta/profile/presentation/viewmodel/user_profile_viewmodel.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class ProfileCarouselScreen extends StatefulWidget {
  UserProfileViewModel userProfileViewModel;
  ProfileCarouselScreen({super.key, required this.userProfileViewModel});

  @override
  State<ProfileCarouselScreen> createState() => _ProfileCarouselScreenState();
}

class _ProfileCarouselScreenState extends State<ProfileCarouselScreen> {
  late UserProfileViewModel userProfileViewModel;
  List<File?> files = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      return Scaffold(
        backgroundColor: AppColors.primaryDark,
        body: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                Text(
                  carouselTitle,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 28),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    carouselSubtitle,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                ),
                SizedBox(height: 120),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 100,
                              width: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/carousel_bg.png'))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50.0),
          child: PrimaryButton(
            invert: true,
            title: 'Done',
            state: state is ProfileLoadingState,
            action: () {
              //userProfileViewModel.updateUserProfilePicture();
            },
          ),
        ),
      );
    });
  }
}
