import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/constants/lists.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/features/profile/data/requests/update_user_profile_request.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_edit_cubit/profile_edit_cubit.dart';
import 'package:zheeta/shared/widgets/input_field.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';
import 'package:zheeta/shared/widgets/radio_button.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  String? firstName, lastName, userName, bio, originCity, originCountry;
  String? bodyType, complexion, religion, customReligion;
  double height = 0.0;
  double weight = 0.0;

  @override
  void initState() {
    super.initState();

    final profileState = context.read<ProfileCubit>().state;
    if (profileState is ProfileLoadedState) {
      final profile = profileState.profile?.data?.profile;

      firstName = profile?.firstName;
      lastName = profile?.lastName;
      userName = profileState.profile?.data?.user?.userName;
      bio = profile?.aboutMe;
      originCity = profile?.originAddress?.city;
      originCountry = profile?.originAddress?.country;

      height = profile?.height?.toDouble() ?? 0.0;
      weight = profile?.weight?.toDouble() ?? 0.0;
      bodyType = profile?.bodyType;
      complexion = profile?.complexion;
      religion = profile?.religion;
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    final profileEditCubit = context.read<ProfileEditCubit>();

    return BlocListener<ProfileEditCubit, ProfileEditState>(
      listener: (context, state) {
        if (state is ProfileUpdateSuccess) {
          profileCubit.getSingleUserProfileCubit();
        } else if (state is ProfileUpdateError) {
          NotifyUser.showSnackBar(state.errorMessage);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField("First name", firstName, (val) {
            setState(() => firstName = val);
          }),
          _buildTextField("Last name", lastName, (val) {
            setState(() => lastName = val);
          }),
          _buildTextField("Username", userName, (val) {
            setState(() => userName = val);
          }),
          _buildTextField("Bio", bio, (val) {
            setState(() => bio = val);
          }, minLines: 4, maxLines: 5),
          _buildTextField("Origin City", originCity, (val) {
            setState(() => originCity = val);
          }),
          _buildTextField("Origin Country", originCountry, (val) {
            setState(() => originCountry = val);
          }),
          _buildSlider("Height ${height.toStringAsFixed(2)} ft", height, 0, 10,
              (val) => setState(() => height = val)),
          _buildSlider("Weight ${weight.round()} kg", weight, 0, 150,
              (val) => setState(() => weight = val)),
          _buildRadioGroup("Body Type", AppLists.bodyTypes, bodyType ?? '',
              (val) => setState(() => bodyType = val)),
          _buildRadioGroup("Complexion", AppLists.complexions, complexion ?? '',
              (val) => setState(() => complexion = val)),
          _buildRadioGroup("Religion", AppLists.religions, religion ?? '',
              (val) => setState(() => religion = val)),
          if (religion == 'Other')
            InputField(
              hintText: 'Specify',
              onChanged: (val) => customReligion = val,
            ),
          SizedBox(height: 20),
          _buildUpdateButton("Update Profile", () {
            final profileState = profileCubit.state as ProfileLoadedState;
            final profile = profileState.profile?.data?.profile;
            final userProfile = profileState.profile?.data;

            final selectedReligion =
                religion == 'Other' ? customReligion : religion;

            final updatedProfile = UpdateUserProfileRequest(
              userId: userProfile?.user?.userId,
              firstName: firstName ?? profile?.firstName,
              lastName: lastName ?? profile?.lastName,
              userName: userName ?? userProfile?.user?.userName,
              aboutMe: bio ?? profile?.aboutMe,
              originCity: originCity ?? profile?.originAddress?.city,
              originCountry: originCountry ?? profile?.originAddress?.country,
              height: height,
              weight: weight,
              bodyType: bodyType ?? profile?.bodyType,
              complexion: complexion ?? profile?.complexion,
              religion: selectedReligion ?? profile?.religion,
              dateOfBirth: profile?.dateOfBirth,
              gender: profile?.gender,
              languageCSV: profile?.languageCSV,
              occupation: profile?.occupation,
              tagline: profile?.tagline,
              state: profile?.residentialAddress?.state,
              city: profile?.residentialAddress?.city,
              country: profile?.residentialAddress?.country,
            );

            profileEditCubit.updateUserProfileCubit(updatedProfile);
          }),
        ],
      ),
    );
  }

  Widget _buildTextField(
      String label, String? initialValue, Function(String) onChanged,
      {int minLines = 1, int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: AppColors.white)),
        InputField(
          hintText: initialValue,
          onChanged: onChanged,
          minLine: minLines,
          maxLine: maxLines,
          suffixIcon: const Icon(Icons.edit_outlined, color: AppColors.grey),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildSlider(String label, double value, double min, double max,
      Function(double) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: AppColors.white)),
        Slider(
          value: value,
          min: min,
          max: max,
          activeColor: AppColors.secondaryLight,
          onChanged: onChanged,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildRadioGroup(String label, List<String> options, String selected,
      Function(String) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.white)),
        SizedBox(height: 10),
        Wrap(
          spacing: 15,
          runSpacing: 10,
          children: options.map((option) {
            return AppRadioButton(
              value: option,
              groupValue: selected,
              onChanged: (val) => onChanged(val),
              title: option,
              borderColor: AppColors.white.withValues(alpha: 0.8),
              activeColor: AppColors.white,
              textColor: AppColors.white,
            );
          }).toList(),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildUpdateButton(String title, VoidCallback action) {
    return BlocBuilder<ProfileEditCubit, ProfileEditState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: 150,
            child: PrimaryButton(
              title: title,
              action: action,
              height: 30,
              state: state is ProfileUpdateLoading,
              color: AppColors.secondaryLight,
              invert: true,
              fontSize: 12,
            ),
          ),
        );
      },
    );
  }
}
