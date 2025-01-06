import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/mixins/image_picker.dart';
import 'package:zheeta/app/common/strings.dart';
import 'package:zheeta/app/common/utils/token_utils.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_usecases.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class ProfilePhotoScreen extends StatefulWidget {
  @override
  State<ProfilePhotoScreen> createState() => _ProfilePhotoScreenState();
}

class _ProfilePhotoScreenState extends State<ProfilePhotoScreen>
    with ImagePickerMixin {
  File? _profilePicture;

  Future<void> _chooseImage() async {
    final pickedImage = await pickImageFromGallery(); // Use mixin method
    if (pickedImage != null) {
      setState(() {
        _profilePicture = pickedImage;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No image selected')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileErrorState) {
        } else if (state is ProfilePictureUploadedState) {
          context.router.replace(ProfileCarouselRoute());
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryDark,
        body: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                Text(
                  photoTitle,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 28),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    photoSubtitle,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                ),
                SizedBox(height: 120),
                Center(
                  child: GestureDetector(
                    onTap: _chooseImage,
                    child: _profilePicture == null
                        ? Image.asset('assets/images/photo-container.png',
                            width: 180)
                        : ClipOval(
                            child: Image.file(
                              _profilePicture!,
                              width: 180,
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 20),
                BlocBuilder<ProfileCubit, ProfileState>(
                  buildWhen: (previous, current) {
                    // Only rebuild when the profile data changes
                    if (previous is ProfileCompositeState &&
                        current is ProfileCompositeState) {
                      return previous.userProfile?.data?.profile?.user?.userName !=
                          current.userProfile?.data?.profile?.user?.userName;
                    }
                    return true; // rebuild if the state is different
                  },
                  builder: (context, state) {
                    return Center(
                      child: Text(
                        (state is ProfileCompositeState)
                            ? '@${state.userProfile?.data?.profile?.user?.userName}'
                            : '',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Colors.white),
                      ),
                    );
                  },
                ),
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50.0),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return PrimaryButton(
                invert: true,
                title: 'Done',
                state: state is ProfileLoadingState,
                action: () async {
                  final _userId = await TokenUtil.getUserId();
                  if (_profilePicture != null) {
                    context.read<ProfileCubit>().createUserProfilePictureCubit(
                            UploadProfilePictureParam(
                          userId: _userId!,
                          file: await MultipartFile.fromFile(
                              _profilePicture!.path,
                              contentType: MediaType('image', 'jpg')),
                        ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select a photo')),
                    );
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
