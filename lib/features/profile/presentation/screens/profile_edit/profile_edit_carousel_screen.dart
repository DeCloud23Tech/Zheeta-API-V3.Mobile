import 'dart:io';
import 'package:auto_route/annotations.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart' as http_parser;
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/core/utils/token_utils.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/profile/data/models/user_profile_model.dart';
import 'package:zheeta/features/profile/domain/usecases/user_profile_usecases.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_create_cubit/profile_create_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_edit_cubit/profile_edit_cubit.dart';
import 'package:zheeta/features/profile/presentation/widgets/carousel_image_selector.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/loading_screen.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

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
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        List<UserCarousels>? carouselImageUrls;
        if (state is ProfileLoadedState) {
          carouselImageUrls = state.profile?.data?.userCarousels;
          if (carouselImageUrls != null && carouselImageUrls.length > 6) {
            carouselImageUrls = carouselImageUrls.sublist(0, 6);
          }
        }

        return Scaffold(
          backgroundColor: AppColors.primaryDark,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Wrap(
                children: [
                  _buildHeader(),
                  const SizedBox(height: 16),
                  _buildDescriptionText(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 36),
                    child: _buildCarouselEditor(
                        carouselImageUrls, state, screenHeight, screenWidth),
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

  Widget _buildHeader() {
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
      style: TextStyle(fontSize: 18, color: Colors.white),
    );
  }

  Widget _buildCarouselEditor(List<UserCarousels>? carouselImageUrls,
      ProfileState state, double screenHeight, double screenWidth) {
    if (state is! ProfileLoadedState || carouselImageUrls == null) {
      return SizedBox(
        height: screenHeight * 0.5,
        width: screenWidth,
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
      return _buildUploadButton();
    } else if (_selectedImage != null) {
      return _buildUpdateButton();
    }
    return const SizedBox.shrink();
  }

  Widget _buildUploadButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
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
  }

  Widget _buildUpdateButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
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

  Future<void> _handleImageUpload() async {
    final userId = await TokenUtil.getUserId();
    if (userId == null || _selectedImages.isEmpty) return;

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
