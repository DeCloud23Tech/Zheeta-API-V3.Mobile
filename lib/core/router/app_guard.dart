import 'package:auto_route/auto_route.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/common/storage/token_storage/i_token_storage.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/core/router/app_router.gr.dart';

class AppGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    try {
      // Get token storage
      final ITokenStorage storage = locator<ITokenStorage>();
      final tokenData = await storage.read();

      // Check if the token exists
      if (tokenData == null) {
        _redirectToSignIn(router, message: 'You must be logged in to access this page!');
        return;
      }

      // Check if the token is expired
      if (Jwt.isExpired(tokenData.token)) {
        _redirectToSignIn(router, message: 'Your session has expired, please log in again!');
        return;
      }

      // If the token is valid, proceed to the next route
      resolver.next(true);
    } catch (e) {
      // Handle any unexpected errors gracefully
      NotifyUser.showSnackBar('An unexpected error occurred. Please log in again!');
      _redirectToSignIn(router);
    }
  }

  /// Helper method to redirect the user to the sign-in page
  void _redirectToSignIn(StackRouter router, {String? message}) {
    if (message != null) NotifyUser.showSnackBar(message);
    router.replaceAll([const SignInRoute()]);
  }
}
