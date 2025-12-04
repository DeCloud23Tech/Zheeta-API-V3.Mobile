import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/app/presentation/cubits/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/network_image.dart';
import 'package:zheeta/shared/widgets/subscription_badge.dart';

Widget buildUserProfile(BuildContext context) {
  final bottomNavCubit = locator<BottomNavCubit>();

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoadedState) {
              final data = state.profile!.data;
              return GestureDetector(
                onTap: () {
                  Scaffold.of(context).closeDrawer();
                  bottomNavCubit.changeTab(3);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(19),
                      child: CustomNetworkImage(
                        imageUrl: data?.profile?.profilePhotoURL,
                        height: 57,
                        width: 57,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            if (data?.user?.isFullyVerified ?? false)
                              Image.asset(
                                'assets/images/badge.png',
                                height: 18,
                                width: 18,
                              ),
                            if (data?.user?.isFullyVerified ?? false)
                              SizedBox(width: 8),
                            Text(
                              "${data?.profile?.firstName} ${data?.profile?.lastName}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "@${data?.user?.userName}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 6),
                              decoration: BoxDecoration(
                                color: AppColors.primaryDark,
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    AppColors.primaryLight,
                                    AppColors.primaryDark,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    '${data?.profile?.age}',
                                    style: const TextStyle(
                                        color: AppColors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 6),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 6),
                              decoration: BoxDecoration(
                                color: data?.profile?.gender == 1
                                    ? AppColors.greenGender
                                    : AppColors.primaryLight,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  data?.profile?.gender == 1 ? 'M' : 'F',
                                  style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                            SubscriptionBadge(
                              text: data?.userSubscription?.name?.trim() ?? '',
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
        AppBackButton(
          icon: Icons.menu,
          onTap: () {
            Scaffold.of(context).closeDrawer();
          },
        ),
      ],
    ),
  );
}
