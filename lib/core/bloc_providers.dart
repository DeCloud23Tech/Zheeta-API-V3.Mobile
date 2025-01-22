import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/features/authentication/presentation/bloc/authentication_cubit.dart';
import 'package:zheeta/features/homepage/presentation/views/bloc/app_cubit.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_cubit/profile_cubit.dart';

import 'injection/di.dart';

class AppBlocsProvider {
  static get allBlocProviders => [
        BlocProvider(create: (context) => locator<AuthenticationCubit>()),
        BlocProvider(create: (context) => locator<ProfileCubit>()),
        BlocProvider(create: (context) => locator<AppCubit>()),

        // BlocProvider(create: (context) => locator<MatchesCubit>()),
        // BlocProvider(create: (context) => locator<FriendsCubit>()),
        // BlocProvider(create: (context) => locator<DownlineCubit>()),
        // BlocProvider(create: (context) => locator<ProfileViewCubit>()),
        // BlocProvider(create: (context) => locator<NearbyCubit>()),
        // BlocProvider(create: (context) => locator<GiftCubit>()),
        // BlocProvider(create: (context) => locator<ChargesCubit>()),
        // BlocProvider(create: (context) => locator<SubscriptionCubit>()),
        // BlocProvider(create: (context) => locator<NotificationCubit>()),
        // BlocProvider(create: (context) => locator<EventCubit>()),
        // BlocProvider(create: (context) => locator<SponsoredBoostCubit>()),
        // BlocProvider(create: (context) => locator<WithdrawalCubit>()),
        // BlocProvider(create: (context) => locator<TransactionCubit>()),
        // BlocProvider(create: (context) => locator<ChatCubit>()),
      ];
}
