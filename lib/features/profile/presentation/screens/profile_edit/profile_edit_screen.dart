import 'dart:io';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/mixin/image_picker.dart';
import 'package:zheeta/core/mixin/validation_mixin.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_edit_cubit/profile_edit_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_interest_cubit/profile_interest_cubit.dart';
import 'package:zheeta/features/profile/presentation/screens/profile_edit/profile_edit_section/interest_section.dart';
import 'package:zheeta/features/profile/presentation/screens/profile_edit/profile_edit_section/profile_image_section.dart';
import 'package:zheeta/features/profile/presentation/screens/profile_edit/profile_edit_section/profile_section.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/loader.dart';

@RoutePage()
class ProfileEditScreen extends StatefulWidget {
  final int activeTab;

  const ProfileEditScreen({super.key, required this.activeTab});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen>
    with Validator, ImagePickerMixin {
  final ProfileCubit profileCubit = locator<ProfileCubit>();
  final ProfileEditCubit profileEditCubit = locator<ProfileEditCubit>();
  final ProfileInterestCubit profileInterestCubit =
      locator<ProfileInterestCubit>();

  File? _profilePicture;
  late int activeTab;

  @override
  void initState() {
    super.initState();
    activeTab = widget.activeTab;
    profileInterestCubit.getInterestsCubit();
  }

  Future<void> _chooseImage() async {
    final pickedImage = await pickImageFromGallery();
    if (pickedImage != null) {
      setState(() => _profilePicture = pickedImage);
    } else {
      NotifyUser.showSnackBar('No image selected.');
    }
  }

  void _clearImage() {
    setState(() => _profilePicture = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.primaryDark,
        surfaceTintColor: AppColors.secondaryLight,
        scrolledUnderElevation: 0.5,
        shadowColor: Colors.grey,
        leadingWidth: MediaQuery.of(context).size.width * 0.2,
        leading: Row(
          children: [
            AppBackButton(),
          ],
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // Image section
            ProfileImageSectionWrapper(
              profilePicture: _profilePicture,
              onChooseImage: _chooseImage,
              onClearImage: _clearImage,
            ),

            const SizedBox(height: 20),

            // Tab switcher
            _buildTabBar(),

            const SizedBox(height: 20),

            // Tab content
            _buildTabContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTabButton(1, "Profile"),
          _buildTabButton(2, "Interests"),
        ],
      ),
    );
  }

  Widget _buildTabButton(int tabIndex, String text) {
    final isActive = activeTab == tabIndex;
    return GestureDetector(
      onTap: () => setState(() => activeTab = tabIndex),
      child: Column(
        children: [
          Container(
            height: 3,
            width: MediaQuery.of(context).size.width * 0.44,
            decoration: BoxDecoration(
              color: isActive ? AppColors.primaryDark : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(
              color: isActive ? AppColors.primaryDark : AppColors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    if (activeTab == 1) {
      return const ProfileSection();
    } else if (activeTab == 2) {
      return const InterestSection();
    }
    return loadingIndicator();
  }
}
