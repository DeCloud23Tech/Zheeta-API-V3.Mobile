import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/constants/strings.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const EdgeInsets _horizontalPadding = EdgeInsets.symmetric(horizontal: 20);
  static const double _titleFontSize = 32.0;
  static const double _subtitleFontSize = 15.0;

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: _horizontalPadding,
              child: SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  title: 'Proceed',
                  action: () {
                    // router.replace(const HomeRoute());
                  },
                  invert: true,
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
