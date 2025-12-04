import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:zheeta/core/storage/user_storage/i_user_storage.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/enums/snackbar_type.dart';

class AppVerifiedGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    try {
      final IUserStorage userStorage = locator<IUserStorage>();
      final user = await userStorage.read();

      if (user == null) {
        debugPrint('AppVerifiedGuard: No user found, redirecting to Welcome.');
        _redirectToWelcome(router,
            message: 'Session expired. Please log in again.');
        return;
      }

      if (!user.isFullyVerified) {
        debugPrint('AppVerifiedGuard: User not fully verified.');
        router.push(
          VerificationRoute(
            isPhoneNumber: !user.phoneNumberConfirmed,
            phoneNumber: user.phoneNumber,
            countryCode: user.phoneCountryCode,
            email: user.email,
          ),
        );
        return;
      }

      resolver.next(true); // Allow navigation
    } catch (e, stackTrace) {
      debugPrint('AppVerifiedGuard error: $e\n$stackTrace');
      _redirectToWelcome(router,
          message:
              'Something went wrong during verification. Please log in again.');
    }
  }

  void _redirectToWelcome(StackRouter router, {String? message}) {
    if (message != null) {
      NotifyUser.showSnackBar(message, type: SnackBarType.error);
    }
    router.replaceAll([WelcomeRoute()]);
  }
}
