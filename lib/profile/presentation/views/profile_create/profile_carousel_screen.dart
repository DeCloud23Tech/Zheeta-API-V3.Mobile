import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/utils/token_utils.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_usecases.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/profile/presentation/widgets/carousel_image_selector.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:mime/mime.dart'; // For content type determination

@RoutePage()
class ProfileCarouselScreen extends StatefulWidget {
  const ProfileCarouselScreen({super.key});

  @override
  _ProfileCarouselScreenState createState() => _ProfileCarouselScreenState();
}

class _ProfileCarouselScreenState extends State<ProfileCarouselScreen> {
  ProfileCubit profileCubit = locator<ProfileCubit>();
  List<File> _selectedImages = [];

  Future<List<MultipartFile>> _prepareFilesForUpload(List<File> files) async {
    List<MultipartFile> multipartFiles = [];
    for (var file in files) {
      final mimeType = lookupMimeType(file.path)?.split('/');
      multipartFiles.add(
        await MultipartFile.fromFile(
          file.path,
          contentType:
              mimeType != null ? MediaType(mimeType[0], mimeType[1]) : null,
        ),
      );
    }
    return multipartFiles;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileErrorState) {
        } else if (state is ProfileCarouselsUploadedState) {
          profileCubit.getSingleUserProfileCubit();
          context.router.popUntil((route) => route.isFirst);
          context.router.replace(HomeRoute());
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryDark,
        body: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                Text(
                  'Add Carousel Photos',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Select 3 to 6 pictures for your carousel to help people discover more about you',
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
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50.0),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return PrimaryButton(
                invert: true,
                title: 'Done',
                state: state is ProfileLoadingState,
                action: _selectedImages.length >= 3
                    ? () async {
                  final _userId = await TokenUtil.getUserId();
                  if (_userId != null) {
                    final filesToUpload =
                    await _prepareFilesForUpload(_selectedImages);
                    profileCubit.uploadProfileCarouselsCubit(
                      UploadProfileCarouselsParam(
                        userId: _userId,
                        file: filesToUpload,
                      ),
                    );
                  }
                }
                    : null,
              );
            },
          ),
        ),
      ),
    );
  }
}
