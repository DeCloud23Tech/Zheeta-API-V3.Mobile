import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/common/storage/token_storage/i_token_storage.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/core/router/app_router.dart';
import 'package:zheeta/core/router/app_router.gr.dart';
import 'package:zheeta/features/homepage/presentation/views/drawer/currency_info_widget.dart';
import 'package:zheeta/features/homepage/presentation/views/drawer/menu_items_widget.dart';
import 'package:zheeta/features/homepage/presentation/views/drawer/profile_counter_widget.dart';
import 'package:zheeta/features/homepage/presentation/views/drawer/profile_widget.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/bloc/withdrawal/withdrawal_cubit.dart';
import 'package:zheeta/utils/logout_utils.dart';
import 'package:zheeta/widgets/loader.dart';
import 'package:zheeta/widgets/primary_button.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final profileState = context.watch<ProfileCubit>().state;
    final countryName = profileState.profile?.data?.profile?.residentialAddress?.country;
    context.read<WithdrawalCubit>().getRateByCountryCubit(countryName);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Drawer(
        elevation: 0.0,
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(color: AppColors.primaryDark),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 30),
              buildUserProfile(context),
              buildProfileCounters(context),
              SizedBox(
                height: 35,
                child: PrimaryButton(
                  invert: true,
                  icon: "assets/images/icons/manage.svg",
                  title: 'Edit profile',
                  fontSize: 14,
                  action: () {
                    context.router.push(ProfileEditRoute(activeTab: 1));
                  },
                ),
              ),
              SizedBox(height: 15),
              // buildCommunitiesSection(context),
              // buildCommunities(context),
              // SizedBox(height: 15),
              buildMenuItems(context),
              SizedBox(height: 15),
              if (profileState is ProfileLoadedState) ...[
                buildCurrencyInfo(countryName)
              ],
              SizedBox(height: 15),
              SizedBox(
                height: 35,
                child: PrimaryButton(
                  invert: true,
                  icon: "assets/images/icons/logout.svg",
                  title: 'Logout',
                  fontSize: 14,
                  action: () => logout(context),
                ),
              ),
              SizedBox(height: 20),
              if (profileState is! ProfileLoadedState) ...[
                Center(
                  child: profileState
                          is ProfileLoadingState // Check for loading state
                      ?  loadingIndicator() // Show loading indicator
                      : SizedBox(
                    height: 35,
                    child: PrimaryButton(
                      invert: true,
                      title: 'Tap to Refresh Profile',
                      fontSize: 14,
                      action: () =>   context
                          .read<ProfileCubit>()
                          .getSingleUserProfileCubit(),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
