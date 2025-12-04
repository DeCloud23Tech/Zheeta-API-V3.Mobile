import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart' as http_parser;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/core/utils/token_utils.dart';
import 'package:zheeta/features/profile/domain/usecases/user_profile_usecases.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_edit_cubit/profile_edit_cubit.dart';
import 'package:zheeta/features/profile/presentation/widgets/profile_image_selection.dart';

class ProfileImageSectionWrapper extends StatelessWidget {
  final File? profilePicture;
  final Function onChooseImage;
  final Function onClearImage;

  const ProfileImageSectionWrapper({
    super.key,
    required this.profilePicture,
    required this.onChooseImage,
    required this.onClearImage,
  });

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    final profileEditCubit = context.read<ProfileEditCubit>();

    return BlocListener<ProfileEditCubit, ProfileEditState>(
      listener: (context, state) {
        if (state is ProfilePictureUpdateSuccess) {
          profileCubit.getSingleUserProfileCubit();
        } else if (state is ProfileUpdateError) {
          NotifyUser.showSnackBar(state.errorMessage);
        }
      },
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is! ProfileLoadedState) {
            return const Center(child: CircularProgressIndicator());
          }

          final user = state.profile!.data;

          return ProfileImageSection(
            profilePhotoUrl: user?.profile?.profilePhotoURL,
            profilePicture: profilePicture,
            onChooseImage: () => onChooseImage(),
            onUpdate: () async {
              final userId = await TokenUtil.getUserId();
              if (profilePicture != null) {
                profileEditCubit.updateUserProfilePictureCubit(
                  UploadProfilePictureParam(
                    userId: userId!,
                    file: await MultipartFile.fromFile(
                      profilePicture!.path,
                      contentType: http_parser.MediaType('image', 'jpg'),
                    ),
                  ),
                );
                onClearImage();
              } else {
                NotifyUser.showSnackBar('Please select a photo');
              }
            },
          );
        },
      ),
    );
  }
}
