import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit.dart';
import 'package:zheeta/profile/presentation/viewmodel/location_viewmodel.dart';
import 'package:zheeta/profile/presentation/viewmodel/user_profile_viewmodel.dart';
import 'package:zheeta/widgets/primary_button.dart';

Future locationBottomSheet(BuildContext context) {
  UserProfileViewModel userProfileViewModel = locator<UserProfileViewModel>();
  return showModalBottomSheet(
    context: context,
    isDismissible: false,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Icon(Icons.location_pin,
                      color: AppColors.primaryDark, size: 32.0),
                  SizedBox(height: 10),
                  Text("Location Services",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryDark)),
                  SizedBox(height: 15),
                  Text(
                      'We need to know where you’re in order\nto find nearby friends',
                      style: TextStyle(
                          color: AppColors.grayscale,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center),
                  SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      state: state is ProfileLoadingState,
                      title: 'Enable location services',
                      action: () async {
                        final result = await userProfileViewModel
                            .getCurrentLocation(context);
                        if (result) router.pop();
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      invert: true,
                      color: AppColors.secondaryLight,
                      title: 'Skip',
                      action: () {
                        router.pop();
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
