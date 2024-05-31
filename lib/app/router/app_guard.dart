import 'package:auto_route/auto_route.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:zheeta/app/common/notify/notify_user.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/app/common/storage/token_storage/i_token_storage.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/router/app_router.gr.dart';

class AppGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    ITokenStorage storage = locator<ITokenStorage>();
    var result = await storage.read();
    bool isLoggedIn = result != null;
    if (!isLoggedIn) {
      NotifyUser.showSnackbar('You must be logged in to access this page!');
      router.push(const SignInRoute());
    } else {
      final isTokeExpired = Jwt.isExpired(result.token);
      if (isTokeExpired) {
        NotifyUser.showSnackbar(
            'Your session has expired, please login again!');
        router.push(const SignInRoute());
      }
      resolver.next(true);
    }
  }
}
