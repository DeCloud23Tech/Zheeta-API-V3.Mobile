import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/di/di.dart';

import 'app_guard.dart';
import 'app_router.gr.dart';
import 'app_verified_guard.dart';

final router = locator.get<AppRouter>(); // Keep as is, common AutoRoute pattern

@injectable
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        // Routes accessible to everyone (no guards)
        AutoRoute(page: IntroRoute.page, initial: true),
        AutoRoute(page: WelcomeRoute.page),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: ResetPasswordRoute.page),
        AutoRoute(page: ResetPasswordOtpRoute.page),
        AutoRoute(page: VerificationRoute.page),
        // No guard here

        // Main authenticated flow. All children will implicitly use AppGuard
        // and then AppVerifiedGuard if applicable.
        AutoRoute(
          path: '/', // Root path for authenticated users
          page: EmptyRoute.page, // A dummy page for routing structure
          guards: [
            AppGuard(), // Checks for token presence and expiry
            // AppVerifiedGuard(), // Checks if user is fully verified
          ],
          children: [
            // Home and main application routes
            // Application Routes
            AutoRoute(page: HomeRoute.page),
            //
            // Profile Routes
            AutoRoute(page: BioDataRoute.page),
            AutoRoute(page: LocationRoute.page),
            AutoRoute(page: AboutRoute.page),
            AutoRoute(page: ProfilePhotoRoute.page),
            AutoRoute(page: ProfileCarouselRoute.page),
            //
            // // Boost
            AutoRoute(page: ProfileBoostRoute.page),
            AutoRoute(page: ProfileBoostInsightRoute.page),
            AutoRoute(page: ProfileEditRoute.page),
            AutoRoute(page: ProfileEditCarouselRoute.page),
            AutoRoute(page: ProfileAccessManagementRoute.page),
            //
            // // AutoRoute(page: SelectLanguageRoute.page, ),
            // AutoRoute(page: ProfileRoute.page, ),
            AutoRoute(page: ProfileViewRoute.page),
            //
            // // Connections Routes
            AutoRoute(page: UserFinderRoute.page),
            AutoRoute(page: FriendRoute.page),
            AutoRoute(page: FriendRequestsRoute.page),
            AutoRoute(page: DownlinesRoute.page),
            AutoRoute(page: RefereeListRoute.page),
            AutoRoute(page: NearbySearchRoute.page),
            //
            // // Feed Routes
            // AutoRoute(page: FeedPostRoute.page, ),
            // AutoRoute(page: FeedPostImageRoute.page, ),
            ///AutoRoute(page: ProfileBoostViewRoute.page, ),
            //
            // // Event Routes
            AutoRoute(page: MyBuddyEventsRoute.page),
            AutoRoute(page: CreateEventRoute.page),
            AutoRoute(page: DateTimeLocationRoute.page),
            AutoRoute(page: GuidelinesItemsRoute.page),
            AutoRoute(page: TargetInsightsRoute.page),

            AutoRoute(page: EventPreviewRoute.page),
            AutoRoute(page: EventDetailsRoute.page),
            AutoRoute(page: EventVerificationRoute.page),
            //
            // // Wallet Routes
            AutoRoute(page: WalletRoute.page),
            // AutoRoute(page: TransactionRoute.page),
            AutoRoute(page: SendCoinRoute.page),
            AutoRoute(page: WithdrawalPayoutAccountRoute.page),
            AutoRoute(page: WithdrawalRoute.page),
            //
            // // Notification Routes
            AutoRoute(page: NotificationRoute.page),
            //
            // // Payments and Subscription Routes
            AutoRoute(page: MembershipSubscriptionRoute.page),
            AutoRoute(page: ChargeListRoute.page),
            AutoRoute(page: PaymentTypeRoute.page),
            AutoRoute(page: PaymentLinkRoute.page),
            AutoRoute(page: PayoutMenuRoute.page),
            AutoRoute(page: PayoutAccountRoute.page),
            AutoRoute(page: PayoutCreateAccount.page),
            //
            // Gift Routes
            AutoRoute(page: GiftShopRoute.page),
            AutoRoute(page: MyGiftRoute.page),
            AutoRoute(page: ProductDetailsRoute.page),
            AutoRoute(page: RedeemGiftDetailRoute.page),
            // AutoRoute(page: RedeemGiftSuccessRoute.page, ),
            // AutoRoute(page: GiftSuccessRoute.page, ),
            //

            // Chats Routes
            AutoRoute(page: ChatConversationRoute.page),
            AutoRoute(page: ChatMessagesRoute.page),

            // AutoRoute(page: BankAccountRoute.page, ),
            /// AutoRoute(page: ShareRoute.page, ),
            // // AutoRoute(page: BankAccountRoute.page, ),
            // // AutoRoute(page: BankAccountRoute.page, ),
            // // AutoRoute(page: RefereeRoute.page, ),
            // Redirect any unmatched path within the authenticated flow back to home
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),

        // Catch-all for unknown routes outside the authenticated flow
        // Should generally go to a 404 page or back to the welcome/intro
        // AutoRoute(path: '*', page: WelcomeRoute.page), // Or a NotFoundPage.page
      ];
}

// Make sure you have EmptyRouterPage defined by auto_route
// It's usually part of the auto_route package or you can create a dummy one:
// @RoutePage()
// class EmptyRouterPage extends AutoRouter {
//   const EmptyRouterPage({super.key});
// }
