import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/logout_utils.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

class ErrorPage extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final VoidCallback? onTryAgain;

  const ErrorPage(
      {super.key,
      this.onTryAgain,
      this.mainAxisAlignment = MainAxisAlignment.center});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
          child: Column(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SVG Image
              SvgPicture.asset(
                'assets/images/icons/error-view.svg',
              ),
              const SizedBox(height: 24), // Spacing
              // Title Text
              const Text(
                'Oops! Something went wrong',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12), // Spacing
              // Description Text
              const Text(
                'Something didn’t go quite as planned.\nWe’re looking into it! Please try again later.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 32), // Spacing
              // Try Again Button (Optional)
              if (onTryAgain != null)
                PrimaryButton(
                  title: 'Reload Page',
                  action: onTryAgain,
                ),
              const SizedBox(height: 20), // Spacing
              PrimaryButton(
                invert: true,
                title: 'Logout',
                action: () => logout(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
