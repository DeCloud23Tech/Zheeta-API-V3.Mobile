import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/features/profile/data/requests/update_user_interest_request.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_interest_cubit/profile_interest_cubit.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';
import 'package:zheeta/shared/widgets/radio_button.dart';

class InterestSection extends StatefulWidget {
  const InterestSection({super.key});

  @override
  State<InterestSection> createState() => _InterestSectionState();
}

class _InterestSectionState extends State<InterestSection> {
  List<dynamic> selectedIds = [];

  @override
  void initState() {
    super.initState();
    final profileState = context.read<ProfileCubit>().state;
    if (profileState is ProfileLoadedState) {
      selectedIds =
          profileState.profile?.data?.interests?.map((i) => i.id).toList() ??
              [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    final profileInterestCubit = context.read<ProfileInterestCubit>();

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, profileState) {
        if (profileState is! ProfileLoadedState) {
          return const SpinKitWave(color: AppColors.white, size: 20.0);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Interests",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white)),
            const SizedBox(height: 10),
            BlocConsumer<ProfileInterestCubit, ProfileInterestState>(
              listener: (context, state) {
                if (state is ProfileInterestUpdated) {
                  profileCubit.getSingleUserProfileCubit();
                  profileInterestCubit.getInterestsCubit();
                  NotifyUser.showSnackBar("Interests updated!");
                } else if (state is ProfileInterestUpdateError) {
                  NotifyUser.showSnackBar(state.errorMessage);
                }
              },
              builder: (context, state) {
                if (state is ProfileInterestLoaded ||
                    state is ProfileInterestLoading ||
                    state is ProfileInterestUpdating) {
                  // Always keep showing the interest list
                  final interestList = (state is ProfileInterestLoaded)
                      ? state.userInterestsList
                      : [];

                  return Wrap(
                    spacing: 15,
                    runSpacing: 10,
                    children: interestList.map((interest) {
                      final isActive = selectedIds.contains(interest.id);
                      return AppMultipleSelectRadioButton(
                        value: interest.id.toString(),
                        isActive: isActive,
                        title: interest.title,
                        textColor: AppColors.white,
                        activeColor: AppColors.white,
                        borderColor: AppColors.white,
                        onChanged: (_) {
                          setState(() {
                            isActive
                                ? selectedIds.remove(interest.id)
                                : selectedIds.add(interest.id);
                          });
                        },
                      );
                    }).toList(),
                  );
                } else {
                  return const Text(
                    "Failed to load interests",
                    style: TextStyle(color: Colors.red),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<ProfileInterestCubit, ProfileInterestState>(
              builder: (context, state) {
                return Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: SizedBox(
                    width: 150,
                    child: PrimaryButton(
                      title: "Update Interests",
                      state: (state is ProfileInterestLoading),
                      height: 30,
                      action: () {
                        if (selectedIds.isEmpty) {
                          NotifyUser.showSnackBar(
                              "Please select at least one interest.");
                          return;
                        }

                        profileInterestCubit.updateUserInterestCubit(
                          request: UpdateUserInterestRequest(
                            userId: profileCubit
                                    .state.profile?.data?.user!.userId ??
                                '',
                            interestIds:
                                selectedIds.map<int>((e) => e as int).toList(),
                          ),
                        );
                      },
                      color: AppColors.secondaryLight,
                      invert: true,
                      fontSize: 12,
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
