import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/utils/token_utils.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_usecases.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/profile/presentation/widgets/carousel_image_selector.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:mime/mime.dart';

@RoutePage()
class ProfileEditCarouselScreen extends StatefulWidget {
  const ProfileEditCarouselScreen({super.key});

  @override
  _ProfileEditCarouselScreenState createState() =>
      _ProfileEditCarouselScreenState();
}

class _ProfileEditCarouselScreenState extends State<ProfileEditCarouselScreen> {
  ProfileCubit profileCubit = locator<ProfileCubit>();
  File? _selectedImage; // Track a single selected image
  String? _currentMediaUrl; // URL of the media to be replaced (if exists)

  // Prepare file for upload
  Future<MultipartFile> _prepareFileForUpload(File file) async {
    final mimeType = lookupMimeType(file.path)?.split('/');
    return await MultipartFile.fromFile(
      file.path,
      contentType: mimeType != null ? MediaType(mimeType[0], mimeType[1]) : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryDark,
          body: Container(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.grey,
                            size: 16,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Edit Carousel Photos',
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
                    'Select a picture for your carousel to help people discover more about you',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  SizedBox(height: 25),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      if (state is ProfileCompositeState) {
                        final List<UserCarousels>? carouselImageUrls =
                            state.userProfile?.data?.userCarousels;
                        return ImageSelectionGrid(
                          selectedImages: _selectedImage != null ? [_selectedImage!] : [],
                          carouselImageUrls: carouselImageUrls,
                          onImagesChanged: (images) {
                            if (images.isNotEmpty) {
                              setState(() {
                                _selectedImage = images.first;
                                // Update current media URL if an image is being replaced
                                _currentMediaUrl = carouselImageUrls?.first.carouselPhotoUrl; // Assuming `url` is the field holding the media URL
                              });
                            }
                          },
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding:
            const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50.0),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return PrimaryButton(
                  invert: true,
                  title: 'Done',
                  state: state is ProfileLoadingState,
                  action: _selectedImage != null
                      ? () async {
                    final _userId = await TokenUtil.getUserId();
                    if (_userId != null) {
                      final fileToUpload = await _prepareFileForUpload(_selectedImage!);

                      // Call the method to upload the single image and replace the existing one
                      profileCubit.uploadProfileCarouselsCubit(
                        UploadProfileCarouselsParam(
                          userId: _userId,
                          file: [fileToUpload],
                          currentMediaUrl: _currentMediaUrl, // Add the current media URL to replace
                        ),
                      );
                    }
                  }
                      : null,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
