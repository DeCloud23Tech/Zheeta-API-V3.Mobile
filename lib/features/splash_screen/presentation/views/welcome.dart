import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/constants/strings.dart';
import 'package:zheeta/core/utils/logout_utils.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/features/profile/data/models/user_profile_model.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  final UserProfileModel? profile;

  const WelcomeScreen({super.key, this.profile});

  static const EdgeInsets _horizontalPadding =
      EdgeInsets.symmetric(horizontal: 20);
  static const double _titleFontSize = 32.0;
  static const double _subtitleFontSize = 15.0;

  @override
  Widget build(BuildContext context) {
    final userProfile = profile?.data?.profile;
    final userCarousels = profile?.data?.userCarousels;

    void handleProceedAction(BuildContext context) {
      if (userProfile == null) {
        // context.router.push(const BioDataRoute());
        return;
      }

      if (userProfile.profilePhotoURL == null) {
        // context.router.push(ProfilePhotoRoute());
        return;
      }

      if (userCarousels!.isEmpty) {
        // context.router.push(ProfileCarouselRoute());
        return;
      }

      NotifyUser.showSnackBar('Profile setup is already complete.');
    }

    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: _horizontalPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          welcomeTitle,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: _titleFontSize,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          welcomeSubtitle,
                          style: const TextStyle(
                            fontSize: _subtitleFontSize,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Image.asset("assets/images/welcome.png"),
                  const SizedBox(height: 40),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: _horizontalPadding,
              child: SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  title: 'Proceed',
                  action: () => handleProceedAction(context),
                  invert: true,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: _horizontalPadding,
              child: SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  title: 'Logout',
                  action: () => logout(context),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
