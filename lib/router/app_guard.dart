import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:zheeta/core/storage/token_storage/i_token_storage.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/di/di.dart';

import 'app_router.gr.dart';

class AppGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    try {
      final ITokenStorage storage = locator<ITokenStorage>();
      final tokenData = await storage.read();

      // Check if the token exists
      if (tokenData == null) {
        _redirectToSignIn(router,
            message: 'You must be logged in to access this page!');
        return;
      }

      // Check if the token is expired
      if (Jwt.isExpired(tokenData.token)) {
        _redirectToSignIn(router,
            message: 'Your session has expired, please log in again!');
        return;
      }

      //TODO: Add Clause for onboarding flow, don't navigate when onboarding is true.

      // If the token is valid and not expired, proceed to the next route
      resolver.next(true);
    } catch (e, stackTrace) {
      // Handle any unexpected errors gracefully, e.g., issues with token parsing or storage access
      debugPrint(
          'Error in AppGuard: $e\n$stackTrace'); // Use debugPrint for development
      _redirectToSignIn(router,
          message: 'An unexpected error occurred. Please log in again.');
    }
  }

  /// Helper method to redirect the user to the sign-in page
  void _redirectToSignIn(StackRouter router, {String? message}) {
    if (message != null) {
      NotifyUser.showSnackBar(message);
    }
    // Use replaceAll to clear the navigation stack and ensure SignInRoute is the only route
    router.replaceAll([const SignInRoute()]);
  }
}
