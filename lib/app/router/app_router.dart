import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/router/app_guard.dart';

import 'app_router.gr.dart';

@injectable
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: IntroRoute.page, initial: true),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: HomeRoute.page, guards: [AppGuard()]),
        AutoRoute(page: BioDataRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: LocationRoute.page, guards: [AppGuard()]),
        AutoRoute(page: ProfilePhotoRoute.page, guards: [AppGuard()]),
        AutoRoute(page: VerificationRoute.page),
        AutoRoute(page: AuthWelcomeRoute.page, guards: [AppGuard()]),
        AutoRoute(page: ProductDetailsRoute.page, guards: [AppGuard()]),
        AutoRoute(page: BankAccountRoute.page, guards: [AppGuard()]),
        AutoRoute(page: GiftShopRoute.page, guards: [AppGuard()]),
        AutoRoute(page: MyGiftRoute.page, guards: [AppGuard()]),
        AutoRoute(page: PendingRequestRoute.page, guards: [AppGuard()]),
        AutoRoute(page: RefereeRoute.page, guards: [AppGuard()]),
      ];
}
