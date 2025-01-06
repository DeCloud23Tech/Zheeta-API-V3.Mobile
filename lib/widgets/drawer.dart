import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/storage/token_storage/i_token_storage.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/homepage/presentation/views/drawer/community_widget.dart';
import 'package:zheeta/homepage/presentation/views/drawer/currency_info_widget.dart';
import 'package:zheeta/homepage/presentation/views/drawer/menu_items_widget.dart';
import 'package:zheeta/homepage/presentation/views/drawer/profile_counter_widget.dart';
import 'package:zheeta/homepage/presentation/views/drawer/profile_widget.dart';
import 'package:zheeta/widgets/primary_button.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});


  void _logout(BuildContext context) {
    final ITokenStorage tokenStorage = locator<ITokenStorage>();

    tokenStorage.clear().then((_) {
      ScaffoldMessenger.of(context).clearSnackBars();
      context.router.replaceAll([const SignInRoute()]);
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to logout. Please try again.'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

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
              buildCurrencyInfo(),
              SizedBox(height: 15),
              SizedBox(
                height: 35,
                child: PrimaryButton(
                    invert: true,
                    icon: "assets/images/icons/logout.svg",
                    title: 'Logout',
                    fontSize: 14,
                    action: () {
                      _logout(context);
                    }),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
