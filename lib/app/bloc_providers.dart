import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/authentication/presentation/bloc/authentication_cubit.dart';
import 'package:zheeta/connections/presentation/bloc/downline_cubit/downline_cubit.dart';
import 'package:zheeta/connections/presentation/bloc/friends_cubit/friends_cubit.dart';
import 'package:zheeta/discover/presentation/bloc/matches_bloc/matches_cubit.dart';
import 'package:zheeta/discover/presentation/bloc/nearby_bloc/nearby_cubit.dart';
import 'package:zheeta/events/presentation/bloc/event_cubit/event_cubit.dart';
import 'package:zheeta/events/presentation/bloc/sponsored_boost_cubit/sponsored_boost_cubit.dart';
import 'package:zheeta/gifts/presentation/bloc/gift/gift_cubit.dart';
import 'package:zheeta/notification/presentation/bloc/notification_cubit.dart';
import 'package:zheeta/payment_and_subscriptions/presentation/bloc/charges/charges_cubit.dart';
import 'package:zheeta/payment_and_subscriptions/presentation/bloc/subscription/subscription_cubit.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/profile/presentation/bloc/profile_view_cubit/profile_view_cubit.dart';
import 'package:zheeta/wallet/presentation/bloc/transaction/transaction_cubit.dart';
import 'package:zheeta/wallet/presentation/bloc/withdrawal/withdrawal_cubit.dart';

class AppBlocsProvider {
  static get allBlocProviders => [
        BlocProvider(create: (context) => locator<AuthenticationCubit>()),
        BlocProvider(create: (context) => locator<MatchesCubit>()),
        BlocProvider(create: (context) => locator<ProfileCubit>()),
        BlocProvider(create: (context) => locator<FriendsCubit>()),
        BlocProvider(create: (context) => locator<DownlineCubit>()),
        BlocProvider(create: (context) => locator<ProfileViewCubit>()),
        BlocProvider(create: (context) => locator<NearbyCubit>()),
        BlocProvider(create: (context) => locator<GiftCubit>()),
        BlocProvider(create: (context) => locator<ChargesCubit>()),
        BlocProvider(create: (context) => locator<SubscriptionCubit>()),
        BlocProvider(create: (context) => locator<NotificationCubit>()),
        BlocProvider(create: (context) => locator<EventCubit>()),
        BlocProvider(create: (context) => locator<SponsoredBoostCubit>()),
        BlocProvider(create: (context) => locator<WithdrawalCubit>()),
        BlocProvider(create: (context) => locator<TransactionCubit>()),
      ];
}
