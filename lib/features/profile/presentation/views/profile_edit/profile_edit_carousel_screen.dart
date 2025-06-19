import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart' as http_parser;
import 'package:mime/mime.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/features/profile/data/model/user_profile_model.dart';
import 'package:zheeta/features/profile/domain/usecase/user_profile_usecases.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_create_cubit/profile_create_cubit.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_edit_cubit/profile_edit_cubit.dart';
import 'package:zheeta/features/profile/presentation/widgets/carousel_image_selector.dart';
import 'package:zheeta/utils/token_utils.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/loading_screen.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class ProfileEditCarouselScreen extends StatefulWidget {
  const ProfileEditCarouselScreen({super.key});

  @override
  ProfileEditCarouselScreenState createState() =>
      ProfileEditCarouselScreenState();
}

class ProfileEditCarouselScreenState extends State<ProfileEditCarouselScreen> {
  final ProfileEditCubit _profileEditCubit = locator<ProfileEditCubit>();
  final ProfileCreateCubit _profileCreateCubit = locator<ProfileCreateCubit>();
  final ProfileCubit _profileCubit = locator<ProfileCubit>();

  File? _selectedImage;
  String? _currentMediaUrl;
  List<File> _selectedImages = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final carouselImageUrls = state is ProfileLoadedState
            ? state.profile?.data?.userCarousels
            : null;

        return Scaffold(
          backgroundColor: AppColors.primaryDark,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Wrap(
                children: [
                  _buildHeader(context),
                  _buildDescriptionText(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 36.0),
                    child: _buildCarouselEditor(carouselImageUrls, state),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: _buildBottomNavigationBar(),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return const Row(
      children: [
        AppBackButton(),
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
    );
  }

  Widget _buildDescriptionText() {
    return const Text(
      'Select a picture for your carousel to help people discover more about you',
      textAlign: TextAlign.start,
      style: TextStyle(fontSize: 18.0, color: Colors.white),
    );
  }

  Widget _buildCarouselEditor(
      List<UserCarousels>? carouselImageUrls, ProfileState state) {
    if (state is! ProfileLoadedState) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        child: const LoadingScreen(),
      );
    }

    return CarouselImageEditor(
      imageUrls: carouselImageUrls,
      onImageChanged: (File newImage, String currentMediaUrl) {
        setState(() {
          _selectedImage = newImage;
          _currentMediaUrl = currentMediaUrl;
        });
      },
      selectedImages: _selectedImages,
      onImagesChanged: (images) => setState(() => _selectedImages = images),
    );
  }

  Widget _buildBottomNavigationBar() {
    if (_selectedImages.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50.0),
        child: BlocConsumer<ProfileCreateCubit, ProfileCreateState>(
          listener: (context, state) {
            if (state is ProfileCarouselsCreateSuccess) {
              Navigator.of(context).pop();
              _profileCubit.getSingleUserProfileCubit();
            } else if (state is ProfileCreateError) {
              NotifyUser.showSnackBar(state.errorMessage);
            }
          },
          builder: (context, state) {
            final isLoading = state is ProfileCreateLoading;
            return PrimaryButton(
              invert: true,
              title: 'Upload',
              state: isLoading,
              action: _handleImageUpload,
            );
          },
        ),
      );
    } else if (_selectedImage != null) {
      return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50.0),
        child: BlocConsumer<ProfileEditCubit, ProfileEditState>(
          listener: (context, state) {
            if (state is ProfileCarouselsUpdateSuccess) {
              _profileCubit.getSingleUserProfileCubit();
            } else if (state is ProfileUpdateError) {
              NotifyUser.showSnackBar(state.errorMessage);
            }
          },
          builder: (context, state) {
            return PrimaryButton(
              invert: true,
              title: 'Update',
              state: state is ProfileUpdateLoading,
              action: _uploadProfileCarousel,
            );
          },
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Future<void> _handleImageUpload() async {
    final userId = await TokenUtil.getUserId();
    if (userId == null) return;

    final filesToUpload = await _prepareFilesForUpload(_selectedImages);
    _profileCreateCubit.uploadProfileCarouselsCubit(
      UploadProfileCarouselsParam(
        userId: userId,
        file: filesToUpload,
      ),
    );
  }

  Future<void> _uploadProfileCarousel() async {
    if (_selectedImage == null) return;

    final userId = await TokenUtil.getUserId();
    if (userId == null) return;

    final fileToUpload = await _prepareFileForUpdate(_selectedImage!);
    _profileEditCubit.uploadProfileCarouselsCubit(
      UploadProfileCarouselsParam(
        userId: userId,
        file: [fileToUpload],
        currentMediaUrl: _currentMediaUrl,
      ),
    );
  }

  Future<MultipartFile> _prepareFileForUpdate(File file) async {
    final mimeType = lookupMimeType(file.path)?.split('/');
    return MultipartFile.fromFile(
      file.path,
      contentType: mimeType != null
          ? http_parser.MediaType(mimeType[0], mimeType[1])
          : null,
    );
  }

  Future<List<MultipartFile>> _prepareFilesForUpload(List<File> files) {
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
}
