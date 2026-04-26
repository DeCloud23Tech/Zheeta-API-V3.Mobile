import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/constants/constansts.dart';
import 'package:zheeta/core/utils/launch_url.dart';
import 'package:zheeta/core/utils/logout_utils.dart';
import 'package:zheeta/features/app/presentation/drawer/currency_info_widget.dart';
import 'package:zheeta/features/app/presentation/drawer/menu_items_widget.dart';
import 'package:zheeta/features/app/presentation/drawer/profile_counter_widget.dart';
import 'package:zheeta/features/app/presentation/drawer/profile_widget.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/cubits/withdrawal_cubit/withdrawal_cubit.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/widgets/loader.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  Future<void> _refreshProfile(BuildContext context) async {
    await context.read<ProfileCubit>().getSingleUserProfileCubit(
          isRefresh: true,
        );
  }

  @override
  Widget build(BuildContext context) {
    final profileState = context.watch<ProfileCubit>().state;
    final countryName =
        profileState.profile?.data?.profile?.residentialAddress?.country;

    // Avoid calling cubit method directly in build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WithdrawalCubit>().getRateByCountryCubit(countryName ?? '');
    });

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Dynamic scaling values
    final buttonHeight = (screenHeight * 0.05).clamp(32.0, 45.0);
    final fontSize = (screenWidth * 0.035).clamp(12.0, 16.0);
    final verticalSpacing = (screenHeight * 0.02).clamp(12.0, 24.0);

    return SizedBox(
      width: screenWidth,
      child: Drawer(
        elevation: 0.0,
        child: Container(
          padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 16,
              top: 16 + MediaQuery.of(context).padding.top),
          decoration: const BoxDecoration(color: AppColors.primaryDark),
          child: Column(
            children: [
              // Pinned top section
              buildUserProfile(context),
              buildProfileCounters(context),
              SizedBox(
                height: buttonHeight,
                width: screenWidth,
                child: PrimaryButton(
                  invert: true,
                  icon: "assets/images/icons/manage.svg",
                  title: 'Edit profile',
                  fontSize: fontSize,
                  action: () {
                    context.router.push(ProfileEditRoute(activeTab: 1));
                  },
                ),
              ),
              SizedBox(height: verticalSpacing),

              // Scrollable content
              Expanded(
                child: RefreshIndicator(
                  color: AppColors.primaryDark,
                  onRefresh: () => _refreshProfile(context),
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    children: [
                      Center(child: buildMenuItems(context)),
                      SizedBox(height: verticalSpacing),
                      SizedBox(
                        height: buttonHeight,
                        child: PrimaryButton(
                          invert: true,
                          icon: "assets/images/icons/support.svg",
                          title: 'WhatsApp Support',
                          fontSize: fontSize,
                          action: () => customLaunchUrl(
                            context,
                            launchWhatsApp,
                          ),
                        ),
                      ),
                      SizedBox(height: verticalSpacing),
                      if (profileState is ProfileLoadedState)
                        buildCurrencyInfo(countryName ?? ''),
                      SizedBox(height: verticalSpacing),
                      SizedBox(
                        height: buttonHeight,
                        child: PrimaryButton(
                          invert: true,
                          icon: "assets/images/icons/logout.svg",
                          title: 'Logout',
                          fontSize: fontSize,
                          action: () => logout(context),
                        ),
                      ),
                      SizedBox(height: verticalSpacing * 0.8),
                      if (profileState is! ProfileLoadedState)
                        Center(
                          child: profileState is ProfileLoadingState
                              ? loadingIndicator()
                              : SizedBox(
                                  height: buttonHeight,
                                  child: PrimaryButton(
                                    invert: true,
                                    title: 'Tap to Refresh Profile',
                                    fontSize: fontSize,
                                    action: () => context
                                        .read<ProfileCubit>()
                                        .getSingleUserProfileCubit(
                                          isRefresh: true,
                                        ),
                                  ),
                                ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
