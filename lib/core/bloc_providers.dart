import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/features/authentication/presentation/bloc/authenticate_country_cubit.dart';
import 'package:zheeta/features/authentication/presentation/bloc/authentication_cubit.dart';
import 'package:zheeta/features/buddy_events/presentation/bloc/event_create_cubit/event_create_cubit.dart';
import 'package:zheeta/features/buddy_events/presentation/bloc/event_cubit/event_cubit.dart';
import 'package:zheeta/features/buddy_events/presentation/bloc/event_search_cubit/event_search_cubit.dart';
import 'package:zheeta/features/buddy_events/presentation/bloc/event_verification_cubit/event_verification_cubit.dart';
import 'package:zheeta/features/buddy_events/presentation/bloc/sponsored_boost_cubit/sponsored_boost_cubit.dart';
import 'package:zheeta/features/connections/presentation/bloc/downline_cubit/downline_cubit.dart';
import 'package:zheeta/features/connections/presentation/bloc/friends_cubit/friends_cubit.dart';
import 'package:zheeta/features/discover/presentation/bloc/match_criteria_bloc/match_criteria_cubit.dart';
import 'package:zheeta/features/discover/presentation/bloc/matches_bloc/matches_cubit.dart';
import 'package:zheeta/features/discover/presentation/bloc/nearby_bloc/nearby_cubit.dart';
import 'package:zheeta/features/gifts/presentation/bloc/gift/gift_cubit.dart';
import 'package:zheeta/features/homepage/presentation/views/bloc/app_cubit/app_cubit.dart';
import 'package:zheeta/features/homepage/presentation/views/bloc/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:zheeta/features/messages/presentation/bloc/chat_cubit/chat_cubit.dart';
import 'package:zheeta/features/notification/presentation/bloc/notification_cubit.dart';
import 'package:zheeta/features/payment_and_subscriptions/presentation/bloc/charges/charges_cubit.dart';
import 'package:zheeta/features/payment_and_subscriptions/presentation/bloc/payment/payment_cubit.dart';
import 'package:zheeta/features/payment_and_subscriptions/presentation/bloc/payout/payout_cubit.dart';
import 'package:zheeta/features/payment_and_subscriptions/presentation/bloc/subscription/subscription_cubit.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_boost_cubit/profile_boost_cubit.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_create_cubit/profile_create_cubit.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_edit_cubit/profile_edit_cubit.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_interest_cubit/profile_interest_cubit.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_location_cubit/profile_location_cubit.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_search_cubit/profile_search_cubit.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_view_cubit/profile_view_cubit.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/bloc/transaction/transaction_cubit.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/bloc/wallet/wallet_cubit.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/bloc/withdrawal/withdrawal_cubit.dart';

import 'injection/di.dart';

class AppBlocsProvider {
  static get allBlocProviders => [
        BlocProvider(create: (context) => locator<AppCubit>()),
        BlocProvider(create: (context) => locator<BottomNavCubit>()),

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

        BlocProvider(create: (context) => locator<FriendsCubit>()),
        BlocProvider(create: (context) => locator<DownlineCubit>()),
        BlocProvider(create: (context) => locator<NearbyCubit>()),

        BlocProvider(create: (context) => locator<GiftCubit>()),

        BlocProvider(create: (context) => locator<SubscriptionCubit>()),
        BlocProvider(create: (context) => locator<ChargesCubit>()),
        BlocProvider(create: (context) => locator<PaymentCubit>()),
        BlocProvider(create: (context) => locator<PayoutCubit>()),

        BlocProvider(create: (context) => locator<NotificationCubit>()),

        BlocProvider(create: (context) => locator<EventCubit>()),
        BlocProvider(create: (context) => locator<EventCreateCubit>()),
        BlocProvider(create: (context) => locator<EventVerificationCubit>()),
        BlocProvider(create: (context) => locator<SponsoredBoostCubit>()),
        BlocProvider(create: (context) => locator<EventSearchCubit>()),

        BlocProvider(create: (context) => locator<WithdrawalCubit>()),
        BlocProvider(create: (context) => locator<TransactionCubit>()),
        BlocProvider(create: (context) => locator<WalletCubit>()),


        BlocProvider(create: (context) => locator<ChatCubit>()),
      ];
}
