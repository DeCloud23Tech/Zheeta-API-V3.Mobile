import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mime/mime.dart';

import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/constants/strings.dart';
import 'package:zheeta/core/mixin/image_picker.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/core/utils/token_utils.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/profile/domain/usecases/user_profile_usecases.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_create_cubit/profile_create_cubit.dart';
import 'package:zheeta/features/profile/presentation/widgets/carousel_image_selector.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:http_parser/http_parser.dart' as http_parser;
import 'package:zheeta/shared/widgets/primary_button.dart';

@RoutePage()
class ProfileCarouselScreen extends StatefulWidget {
  const ProfileCarouselScreen({super.key});

  @override
  ProfileCarouselScreenState createState() => ProfileCarouselScreenState();
}

class ProfileCarouselScreenState extends State<ProfileCarouselScreen> {
  final ProfileCreateCubit _profileCreateCubit = locator<ProfileCreateCubit>();

  List<File> _selectedImages = [];

  // Prepare files for upload by converting them into MultipartFile
  Future<List<MultipartFile>> _prepareFilesForUpload(List<File> files) async {
    return Future.wait(files.map((file) async {
      final mimeType = lookupMimeType(file.path)?.split('/');
      return MultipartFile.fromFile(
        file.path,
        contentType: mimeType != null
            ? http_parser.MediaType(mimeType[0], mimeType[1])
            : null,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCreateCubit, ProfileCreateState>(
      listener: (context, state) {
        if (state is ProfileCreateError) {
          NotifyUser.showSnackBar(state.errorMessage);
        } else if (state is ProfileCarouselsCreateSuccess) {
          context.router.popUntil((route) => route.isFirst);
          context.router.replace(HomeRoute());
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryDark,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Row(
                children: [
                  AppBackButton(),
                  const SizedBox(width: 8),
                  Text(
                    'Add Carousel Photos',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Select at least 2 pictures for your carousel to help people discover more about you',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              SizedBox(height: 25),
              ImageSelectionGrid(
                selectedImages: _selectedImages,
                onImagesChanged: (images) {
                  setState(() {
                    _selectedImages = images;
                  });
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50.0),
          child: BlocBuilder<ProfileCreateCubit, ProfileCreateState>(
            builder: (context, state) {
              final isLoading = state is ProfileCreateLoading;
              final isReadyToSubmit =
                  _selectedImages.length >= 2; // Updated validation

              return PrimaryButton(
                invert: true,
                title: 'Done',
                state: isLoading,
                action: isReadyToSubmit
                    ? () async {
                        final userId = await TokenUtil.getUserId();
                        if (userId != null) {
                          final filesToUpload =
                              await _prepareFilesForUpload(_selectedImages);
                          _profileCreateCubit.uploadProfileCarouselsCubit(
                            UploadProfileCarouselsParam(
                              userId: userId,
                              file: filesToUpload,
                            ),
                          );
                        }
                      }
                    : () {
                        NotifyUser.showSnackBar(
                            'Please select at least 2 images.'); // Validation feedback
                      },
              );
            },
          ),
        ),
      ),
    );
  }
}
