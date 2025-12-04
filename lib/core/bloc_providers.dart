import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/app/presentation/cubits/app_cubit/app_cubit.dart';
import 'package:zheeta/features/app/presentation/cubits/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:zheeta/features/authentication/presentation/cubits/authenticate_country_cubit/authenticate_country_cubit.dart';
import 'package:zheeta/features/authentication/presentation/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:zheeta/features/buddy_events/presentation/cubits/event_create_cubit/event_create_cubit.dart';
import 'package:zheeta/features/buddy_events/presentation/cubits/event_cubit/event_cubit.dart';
import 'package:zheeta/features/buddy_events/presentation/cubits/event_details_cubit/event_details_cubit.dart';
import 'package:zheeta/features/buddy_events/presentation/cubits/event_search_cubit/event_search_cubit.dart';
import 'package:zheeta/features/buddy_events/presentation/cubits/event_verification_cubit/event_verification_cubit.dart';
import 'package:zheeta/features/buddy_events/presentation/cubits/sponsored_boost_cubit/sponsored_boost_cubit.dart';
import 'package:zheeta/features/connections/presentation/cubits/all_friends_cubit/all_friends_cubit.dart';
import 'package:zheeta/features/connections/presentation/cubits/block_account_cubit/block_account_cubit.dart';
import 'package:zheeta/features/connections/presentation/cubits/downline_cubit/downline_cubit.dart';
import 'package:zheeta/features/connections/presentation/cubits/downline_cubit/user_downline_cubit.dart';
import 'package:zheeta/features/connections/presentation/cubits/friends_cubit/friends_cubit.dart';
import 'package:zheeta/features/discover/presentation/cubits/match_criteria_cubit/match_criteria_cubit.dart';
import 'package:zheeta/features/discover/presentation/cubits/matches_cubit/matches_cubit.dart';
import 'package:zheeta/features/discover/presentation/cubits/nearby_profiles_cubit/nearby_profile_cubit.dart';
import 'package:zheeta/features/discover/presentation/cubits/nearby_settings_cubit/nearby_settings_cubit.dart';
import 'package:zheeta/features/gifts/presentation/cubits/gift_cubit/gift_cubit.dart';
import 'package:zheeta/features/messages/presentation/cubits/chat_action_cubit/chat_action_cubit.dart';
import 'package:zheeta/features/messages/presentation/cubits/chat_cubit/chat_cubit.dart';
import 'package:zheeta/features/messages/presentation/cubits/chat_delete_cubit/chat_delete_cubit.dart';
import 'package:zheeta/features/messages/presentation/cubits/chat_history_cubit/chat_history_cubit.dart';
import 'package:zheeta/features/messages/presentation/cubits/chat_recipients_cubit/chat_recipients_cubit.dart';
import 'package:zheeta/features/notification/presentation/cubits/notification_action_cubit/notification_action_cubit.dart';
import 'package:zheeta/features/notification/presentation/cubits/notification_cubit/notification_cubit.dart';
import 'package:zheeta/features/payment_and_subscriptions/presentation/cubits/charges_cubit/charges_cubit.dart';
import 'package:zheeta/features/payment_and_subscriptions/presentation/cubits/payment_cubit/payment_cubit.dart';
import 'package:zheeta/features/payment_and_subscriptions/presentation/cubits/payout_cubit/payout_cubit.dart';
import 'package:zheeta/features/payment_and_subscriptions/presentation/cubits/subscription_cubit/subscription_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_boost_cubit/profile_boost_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_create_cubit/profile_create_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_edit_cubit/profile_edit_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_interest_cubit/profile_interest_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_location_cubit/profile_location_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_search_cubit/profile_search_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_view_cubit/profile_view_cubit.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/cubits/transaction_cubit/transaction_cubit.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/cubits/wallet_cubit/wallet_cubit.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/cubits/withdrawal_cubit/withdrawal_cubit.dart';

class AppBlocsProvider {
  static get allBlocProviders => [
        //Missing type annotation. (Documentation)
        BlocProvider(create: (context) => locator<AppCubit>()),
        BlocProvider(create: (context) => locator<BottomNavCubit>()),
        //
        BlocProvider(create: (context) => locator<AuthenticationCubit>()),
        BlocProvider(create: (context) => locator<AuthenticateCountryCubit>()),

        BlocProvider(create: (context) => locator<ProfileCubit>()),
        BlocProvider(create: (context) => locator<ProfileCreateCubit>()),
        BlocProvider(create: (context) => locator<ProfileEditCubit>()),
        BlocProvider(create: (context) => locator<ProfileInterestCubit>()),
        BlocProvider(create: (context) => locator<ProfileLocationCubit>()),
        BlocProvider(create: (context) => locator<ProfileSearchCubit>()),
        BlocProvider(create: (context) => locator<ProfileBoostCubit>()),
        BlocProvider(create: (context) => locator<ProfileViewCubit>()),

        BlocProvider(create: (context) => locator<MatchesCubit>()),
        BlocProvider(create: (context) => locator<MatchCriteriaCubit>()),
        //
        // BlocProvider(create: (context) => locator<AllFriendsCubit>()),
        BlocProvider(create: (context) => locator<FriendsCubit>()),
        BlocProvider(create: (context) => locator<BlockAccountCubit>()),
        // BlocProvider(create: (context) => locator<FriendsCubit>()),
        // BlocProvider(create: (context) => locator<FriendsCubit>()),

        // BlocProvider(create: (context) => locator<UserDownlinesCubit>()),
        // BlocProvider(create: (context) => locator<DownlineCubit>()),
        // BlocProvider(create: (context) => locator<NearbyCubit>()),
        BlocProvider(create: (context) => locator<NearbyProfilesCubit>()),
        //
        BlocProvider(create: (context) => locator<GiftCubit>()),
        //

        BlocProvider(create: (context) => locator<SubscriptionCubit>()),
        BlocProvider(create: (context) => locator<ChargesCubit>()),
        BlocProvider(create: (context) => locator<PaymentCubit>()),
        BlocProvider(create: (context) => locator<PayoutCubit>()),
        //
        BlocProvider(create: (context) => locator<NotificationActionCubit>()),
        BlocProvider(create: (context) => locator<NearbySettingsCubit>()),

        //
        // BlocProvider(create: (context) => locator<EventDetailsCubit>()),
        BlocProvider(create: (context) => locator<EventCreateCubit>()),
        BlocProvider(create: (context) => locator<EventVerificationCubit>()),
        BlocProvider(create: (context) => locator<SponsoredBoostCubit>()),
        // BlocProvider(create: (context) => locator<EventSearchCubit>()),
        //
        BlocProvider(create: (context) => locator<WithdrawalCubit>()),
        BlocProvider(create: (context) => locator<TransactionCubit>()),
        BlocProvider(create: (context) => locator<WalletCubit>()),
        //
        //
        // BlocProvider(create: (context) => locator<ChatCubit>()),
        BlocProvider(
            create: (context) =>
                locator<ChatRecipientsCubit>()..loadNextPage()),
        BlocProvider(create: (context) => locator<ChatHistoryCubit>()),
        BlocProvider(create: (context) => locator<ChatDeleteCubit>()),
        BlocProvider(create: (context) => locator<ChatActionCubit>()),
      ];
}
