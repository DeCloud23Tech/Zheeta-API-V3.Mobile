import 'package:auto_route/auto_route.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/common/storage/user_storage/i_user_storage.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/core/router/app_router.gr.dart';

class AppVerifiedGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    try {
      final IUserStorage userStorage = locator<IUserStorage>();
      final user = await userStorage.read();


      // Redirect to VerificationRoute if user is not fully verified
      if (user != null && !user.isFullyVerified) {
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


      // Proceed with navigation
      resolver.next(true);
    } catch (e) {
      // NotifyUser.showSnackBar('An unexpected error occurred. Please log in again.');
      router.replaceAll([WelcomeRoute()]);
    }
  }


}
