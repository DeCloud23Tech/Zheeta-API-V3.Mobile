import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

class CreateAccountPrompt extends StatelessWidget {
  final VoidCallback onClick;

  const CreateAccountPrompt({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(30),
        color: const Color(0xFFFDF5F7), // Light pink background
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: AppColors.grayscale,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  const TextSpan(text: 'Do you want to create a new account? '),
                  TextSpan(
                    text: 'Click Here',
                    style: const TextStyle(
                      color: AppColors.primaryDark,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = onClick,
                  ),
                  const TextSpan(
                      text: '. This will redirect to Payout Account'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              title: 'Add New Account',
              color: AppColors.primaryDark,
              action: onClick,
            ),
          ],
        ),
      ),
    );
  }
}
