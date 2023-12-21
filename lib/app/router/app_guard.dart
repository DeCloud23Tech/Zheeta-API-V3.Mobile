import 'package:auto_route/auto_route.dart';
import 'package:zheeta/app/keys.dart';
import 'package:zheeta/app/notify/notify_user.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/app/storage/local_storage_impl.dart';

class AppGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final isLoggedIn = storage.getBool(LocalStorageKeys.isLoggedIn);
    if (isLoggedIn == null || !isLoggedIn) {
      NotifyUser.showToast('You must be logged in to access this page!', true);
      router.push(const SignInRoute());
    } else {
      resolver.next(true);
    }
  }
}
