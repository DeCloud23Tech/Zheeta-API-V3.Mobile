import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/router/app_guard.dart';

import 'app_router.gr.dart';

final router = locator.get<AppRouter>();

@injectable
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        // Auth
        AutoRoute(page: IntroRoute.page, initial: true),
        AutoRoute(page: SignInRoute.page, initial: false),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: ResetPasswordRoute.page),
        AutoRoute(page: ResetPasswordOtpRoute.page),
        AutoRoute(page: VerificationRoute.page),

        // Profile
        AutoRoute(page: WelcomeRoute.page, guards: [AppGuard()]),
        AutoRoute(page: BioDataRoute.page, guards: [AppGuard()]),
        AutoRoute(page: LocationRoute.page, guards: [AppGuard()]),
        AutoRoute(page: AboutRoute.page, guards: [AppGuard()]),
        AutoRoute(page: ProfilePhotoRoute.page, guards: [AppGuard()]),
        AutoRoute(page: SelectLanguageRoute.page, guards: [AppGuard()]),
        AutoRoute(page: ProfileViewRoute.page, guards: [AppGuard()]),

        // Explore
        AutoRoute(page: HomeRoute.page, guards: [AppGuard()]),
        AutoRoute(page: ProfileRoute.page, guards: [AppGuard()]),
        AutoRoute(page: ProfileBoostRoute.page, guards: [AppGuard()]),
        AutoRoute(page: ProfileEditRoute.page, guards: [AppGuard()]),

        // Discover
        AutoRoute(page: NearbySearchRoute.page, guards: [AppGuard()]),
        AutoRoute(page: DownLinesRoute.page, guards: [AppGuard()]),

        // Friends
        AutoRoute(page: FriendRoute.page, guards: [AppGuard()]),
        AutoRoute(page: PendingRequestRoute.page, guards: [AppGuard()]),

        // Notification
        AutoRoute(page: NotificationRoute.page, guards: [AppGuard()]),

        // Gift
        AutoRoute(page: GiftShopRoute.page, guards: [AppGuard()]),
        AutoRoute(page: MyGiftRoute.page, guards: [AppGuard()]),
        AutoRoute(page: ProductDetailsRoute.page, guards: [AppGuard()]),
        AutoRoute(page: RedeemGiftDetailRoute.page, guards: [AppGuard()]),
        AutoRoute(page: GiftSuccessRoute.page, guards: [AppGuard()]),

        //
        AutoRoute(page: BankAccountRoute.page, guards: [AppGuard()]),
        AutoRoute(page: RefereeRoute.page, guards: [AppGuard()]),
        AutoRoute(page: MembershipSubscriptionRoute.page, guards: [AppGuard()]),
      ];
}
