import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/router/app_router.gr.dart';

@RoutePage()
class VerificationWelcomeScreen extends StatelessWidget {
  const VerificationWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primaryLight, AppColors.primaryDark],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 18),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 68,
                    fontWeight: FontWeight.w700,
                    height: 1.0,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: Text(
                  'Registration completed successfully,\n'
                  'you can now proceed to set up your\n'
                  'user profile.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    height: 1.55,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/images/welcome.png',
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 12, 24, 34),
                child: SizedBox(
                  height: 72,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.router.replaceAll([const SignInRoute()]);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.secondaryLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Proceed',
                      style: TextStyle(
                        color: AppColors.primaryDark,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
