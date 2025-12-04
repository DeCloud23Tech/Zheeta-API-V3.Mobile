import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:zheeta/core/constants/color.dart';

class MaintenanceView extends StatelessWidget {
  final VoidCallback? onTryAgain;
  final String title;
  final String message;

  const MaintenanceView(
      {super.key, this.onTryAgain, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SVG Image
              SvgPicture.asset(
                'assets/images/icons/error-view.svg',
              ),
              const SizedBox(height: 24), // Spacing
              // Title Text
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12), // Spacing
              // Description Text
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 32), // Spacing
              /// Try Again Button (Optional)
              // SocialButton(
              //   icon: 'assets/images/whatsapp.png',
              //   text: 'WhatsApp support',
              //   color: Colors.green.shade300,
              //   height: 28,
              //   width: MediaQuery.of(context).size.width,
              //   link: launchWhatsApp,
              // ),
              // const SizedBox(height: 32), // Spacing
              //
              // PrimaryButton(
              //   title: 'Reload page',
              //   action: onTryAgain ?? () {
              //
              //   }, // Default to an empty function
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
