import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/constants/strings.dart';
import 'package:zheeta/core/constants/text_style.dart';
import 'package:zheeta/core/storage/token_storage/i_token_storage.dart';
import 'package:zheeta/core/utils/pending_verification_utils.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

@RoutePage()
class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  final ITokenStorage _tokenStorage = locator<ITokenStorage>();

  static const Duration _animationDuration = Duration(seconds: 5);
  static const Interval _imageFadeInterval = Interval(0.0, 0.2);
  static const Interval _buttonFadeInterval = Interval(0.2, 0.3);
  static const Interval _moveInterval = Interval(0.0, 0.2);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..animateTo(0.5);

    // Check login status on initialization
    _checkForLogin();
  }

  Future<void> _checkForLogin() async {
    final pendingVerification = await PendingVerificationUtils.read();
    if (pendingVerification != null) {
      if (mounted) {
        context.router.pushAndPopUntil(
          VerificationRoute(
            isPhoneNumber: pendingVerification.isPhoneNumber,
            phoneNumber: pendingVerification.phoneNumber,
            countryCode: pendingVerification.countryCode,
            email: pendingVerification.email,
          ),
          predicate: (route) => false,
        );
      }
      return;
    }

    final token = await _tokenStorage.read();
    if (token != null) {
      // User is logged in, navigate to HomeRoute
      if (mounted) {
        context.router.pushAndPopUntil(
          HomeRoute(),
          predicate: (route) => false,
        );
      }
    }
  }

  @override
  void dispose() {
    if (_animationController.isAnimating) {
      _animationController.stop();
    }
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imageFade = CurvedAnimation(
      parent: _animationController,
      curve: _imageFadeInterval,
    );

    final buttonFade = CurvedAnimation(
      parent: _animationController,
      curve: _buttonFadeInterval,
    );

    final moveAnimation = Tween<Offset>(
      begin: const Offset(0, -2),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: _moveInterval,
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          const Positioned.fill(
            child: ColoredBox(
              color: AppColors.primaryDark,
            ),
          ),
          Positioned.fill(
            child: FadeTransition(
              opacity: imageFade,
              child: Image.asset(
                "assets/images/heroo.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              color: AppColors.primaryDark.withValues(alpha: 0.4),
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeTransition(
                    opacity: imageFade,
                    child: SlideTransition(
                      position: moveAnimation,
                      child: Text(
                        heroTitle,
                        style: titleStyle,
                      ),
                    ),
                  ),
                  FadeTransition(
                    opacity: imageFade,
                    child: Text(
                      heroSubtitle,
                      style: subtitleStyle,
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeTransition(
                    opacity: buttonFade,
                    child: Column(
                      children: [
                        PrimaryButton(
                          title: 'Login',
                          action: () {
                            context.router.push(SignInRoute());
                          },
                        ),
                        const SizedBox(height: 10),
                        PrimaryButton(
                          title: 'Sign up',
                          invert: true,
                          action: () {
                            context.router.push(SignUpRoute());
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
