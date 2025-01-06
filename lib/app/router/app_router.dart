import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/router/app_guard.dart';

import 'app_router.gr.dart';

final router = locator.get<AppRouter>();

@injectable
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        // Auth Routes
        AutoRoute(page: IntroRoute.page, initial: true),
        AutoRoute(page: WelcomeRoute.page),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        // AutoRoute(page: ResetPasswordRoute.page),
        AutoRoute(page: ResetPasswordOtpRoute.page),
        AutoRoute(page: VerificationRoute.page),

        // Application Routes
        AutoRoute(page: HomeRoute.page, guards: [AppGuard()]),

        // Profile Routes
        AutoRoute(page: BioDataRoute.page, guards: [AppGuard()]),
        AutoRoute(page: LocationRoute.page, guards: [AppGuard()]),
        AutoRoute(page: AboutRoute.page, guards: [AppGuard()]),
        AutoRoute(page: ProfilePhotoRoute.page, guards: [AppGuard()]),
        AutoRoute(page: ProfileCarouselRoute.page, guards: [AppGuard()]),

        // Boost
        AutoRoute(page: ProfileBoostRoute.page, guards: [AppGuard()]),
        AutoRoute(page: ProfileBoostRoute.page, guards: [AppGuard()]),
        AutoRoute(page: ProfileBoostInsightRoute.page, guards: [AppGuard()]),
        AutoRoute(page: ProfileEditRoute.page, guards: [AppGuard()]),
        AutoRoute(page: ProfileEditCarouselRoute.page, guards: [AppGuard()]),
        AutoRoute(page: ProfileAccessManagementRoute.page, guards: [AppGuard()]),

        // AutoRoute(page: SelectLanguageRoute.page, guards: [AppGuard()]),
        AutoRoute(page: ProfileRoute.page, guards: [AppGuard()]),
        AutoRoute(page: ProfileViewRoute.page, guards: [AppGuard()]),

        // Connections Routes
        AutoRoute(page: FriendRoute.page, guards: [AppGuard()]),
        AutoRoute(page: FriendRequestsRoute.page, guards: [AppGuard()]),
        AutoRoute(page: DownLinesRoute.page, guards: [AppGuard()]),
        AutoRoute(page: RefereeListRoute.page, guards: [AppGuard()]),
        AutoRoute(page: NearbySearchRoute.page, guards: [AppGuard()]),

        // Feed Routes
        // AutoRoute(page: FeedPostRoute.page, guards: [AppGuard()]),
        // AutoRoute(page: FeedPostImageRoute.page, guards: [AppGuard()]),
        AutoRoute(page: ProfileBoostViewRoute.page, guards: [AppGuard()]),

        // Event Routes
        AutoRoute(page: MyBuddyEventsRoute.page, guards: [AppGuard()]),
        AutoRoute(page: CreateEventRoute.page, guards: [AppGuard()]),
        AutoRoute(page: EventPreviewRoute.page, guards: [AppGuard()]),
        AutoRoute(page: EventDetailsRoute.page, guards: [AppGuard()]),

        // Wallet Routes
        AutoRoute(page: WalletRoute.page, guards: [AppGuard()]),

        // Notification Routes
        AutoRoute(page: NotificationRoute.page, guards: [AppGuard()]),

        // Payments and Subscription Routes
        AutoRoute(page: MembershipSubscriptionRoute.page, guards: [AppGuard()]),
        AutoRoute(page: ChargesList.page, guards: [AppGuard()]),

        // Gift Routes
        AutoRoute(page: GiftShopRoute.page, guards: [AppGuard()]),
        AutoRoute(page: MyGiftRoute.page, guards: [AppGuard()]),
        AutoRoute(page: ProductDetailsRoute.page, guards: [AppGuard()]),
        AutoRoute(page: RedeemGiftDetailRoute.page, guards: [AppGuard()]),
        // AutoRoute(page: RedeemGiftSuccessRoute.page, guards: [AppGuard()]),
        // AutoRoute(page: GiftSuccessRoute.page, guards: [AppGuard()]),

        AutoRoute(page: BankAccountRoute.page, guards: [AppGuard()]),
        // AutoRoute(page: BankAccountRoute.page, guards: [AppGuard()]),
        // AutoRoute(page: BankAccountRoute.page, guards: [AppGuard()]),
        // AutoRoute(page: RefereeRoute.page, guards: [AppGuard()]),
      ];
}
