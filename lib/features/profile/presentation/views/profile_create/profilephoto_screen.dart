import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/constants/strings.dart';
import 'package:zheeta/common/mixins/image_picker.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/core/router/app_router.gr.dart';
import 'package:zheeta/features/profile/domain/usecase/user_profile_usecases.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_create_cubit/profile_create_cubit.dart';
import 'package:zheeta/utils/token_utils.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:http_parser/http_parser.dart';

@RoutePage()
class ProfilePhotoScreen extends StatefulWidget {
  const ProfilePhotoScreen({super.key});

  @override
  State<ProfilePhotoScreen> createState() => _ProfilePhotoScreenState();
}

class _ProfilePhotoScreenState extends State<ProfilePhotoScreen>
    with ImagePickerMixin {
  final ProfileCreateCubit _profileCreateCubit = locator<ProfileCreateCubit>();
  File? _profilePicture;

  Future<void> _chooseImage() async {
    final pickedImage = await pickImageFromGallery();
    if (pickedImage != null) {
      setState(() {
        _profilePicture = pickedImage;
      });
    } else {
      NotifyUser.showSnackBar('No image selected');
    }
  }

  Future<void> _uploadProfilePicture() async {
    if (_profilePicture == null) {
      NotifyUser.showSnackBar('Please select a photo');
      return;
    }

    final userId = await TokenUtil.getUserId();
    try {
      final file = await MultipartFile.fromFile(
        _profilePicture!.path,
        contentType: MediaType('image', 'jpg'),
      );
      _profileCreateCubit.createUserProfilePictureCubit(
        UploadProfilePictureParam(userId: userId!, file: file),
      );
    } catch (e) {
      NotifyUser.showSnackBar('Failed to upload image. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCreateCubit, ProfileCreateState>(
      listener: (context, state) {
        if (state is ProfileCreateError) {
          NotifyUser.showSnackBar(state.errorMessage);
        } else if (state is ProfilePictureCreateSuccess) {
          if (mounted) {
            context.router.replace(const ProfileCarouselRoute());
          }
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryDark,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Row(
                  children: [
                    AppBackButton(),
                    const SizedBox(width: 8),
                    Text(
                      photoTitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    photoSubtitle,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 120),
                Center(
                  child: GestureDetector(
                    onTap: _chooseImage,
                    child: _profilePicture == null
                        ? Image.asset(
                            'assets/images/photo-container.png',
                            width: 180,
                          )
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
                const SizedBox(height: 20),
                // BlocBuilder<ProfileCubit, ProfileState>(
                //   builder: (context, state) {
                //     final userName = state is ProfileLoadedState
                //         ? '@${state.profile?.data?.profile?.user?.userName ?? ''}'
                //         : '';
                //     return Center(
                //       child: Text(
                //         userName,
                //         style: const TextStyle(
                //           fontWeight: FontWeight.bold,
                //           fontSize: 16.0,
                //           color: Colors.white,
                //         ),
                //       ),
                //     );
                //   },
                // ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 50.0),
          child: BlocBuilder<ProfileCreateCubit, ProfileCreateState>(
            builder: (context, state) {
              return PrimaryButton(
                invert: true,
                title: 'Done',
                state: state is ProfileCreateLoading,
                action: _uploadProfilePicture,
              );
            },
          ),
        ),
      ),
    );
  }
}
