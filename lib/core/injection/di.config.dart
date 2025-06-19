// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:zheeta/common/services/api/api_manager.dart' as _i150;
import 'package:zheeta/common/services/deep_link_service.dart' as _i625;
import 'package:zheeta/common/services/inapp_purchase_service.dart' as _i889;
import 'package:zheeta/common/services/push_notification_service.dart' as _i888;
import 'package:zheeta/common/storage/token_storage/i_token_storage.dart'
    as _i573;
import 'package:zheeta/common/storage/token_storage/token_storage.dart'
    as _i669;
import 'package:zheeta/common/storage/user_storage/i_user_storage.dart'
    as _i734;
import 'package:zheeta/common/storage/user_storage/user_storage.dart' as _i217;
import 'package:zheeta/core/router/app_router.dart' as _i467;
import 'package:zheeta/features/authentication/data/datasource/prod/user_auth_datasource_impl.dart'
    as _i997;
import 'package:zheeta/features/authentication/data/datasource/prod/user_country_datasource_impl.dart'
    as _i714;
import 'package:zheeta/features/authentication/data/datasource/prod/user_otp_datasource_impl.dart'
    as _i6;
import 'package:zheeta/features/authentication/data/datasource/user_auth_datasource.dart'
    as _i84;
import 'package:zheeta/features/authentication/data/datasource/user_country_datasource.dart'
    as _i562;
import 'package:zheeta/features/authentication/data/datasource/user_otp_datasource.dart'
    as _i949;
import 'package:zheeta/features/authentication/data/repository/user_auth_repository_impl.dart'
    as _i213;
import 'package:zheeta/features/authentication/data/repository/user_country_repository_impl.dart'
    as _i720;
import 'package:zheeta/features/authentication/data/repository/user_otp_repository_impl.dart'
    as _i193;
import 'package:zheeta/features/authentication/domain/repository/user_auth_repository.dart'
    as _i561;
import 'package:zheeta/features/authentication/domain/repository/user_country_repository.dart'
    as _i511;
import 'package:zheeta/features/authentication/domain/repository/user_otp_repository.dart'
    as _i315;
import 'package:zheeta/features/authentication/domain/usecase/user_auth/user_auth_usecases.dart'
    as _i99;
import 'package:zheeta/features/authentication/domain/usecase/user_country/user_country_usecases.dart'
    as _i48;
import 'package:zheeta/features/authentication/domain/usecase/user_otp/user_otp_usecases.dart'
    as _i274;
import 'package:zheeta/features/authentication/presentation/bloc/authenticate_country_cubit.dart'
    as _i355;
import 'package:zheeta/features/authentication/presentation/bloc/authentication_cubit.dart'
    as _i270;
import 'package:zheeta/features/buddy_events/data/datasource/event_datasource.dart'
    as _i935;
import 'package:zheeta/features/buddy_events/data/datasource/event_member_datasource.dart'
    as _i513;
import 'package:zheeta/features/buddy_events/data/datasource/event_message_datasource.dart'
    as _i507;
import 'package:zheeta/features/buddy_events/data/datasource/event_search_datasource.dart'
    as _i393;
import 'package:zheeta/features/buddy_events/data/datasource/event_verification_datasource.dart'
    as _i459;
import 'package:zheeta/features/buddy_events/data/datasource/prod/event_datasource_impl.dart'
    as _i365;
import 'package:zheeta/features/buddy_events/data/datasource/prod/event_member_datasource_impl.dart'
    as _i316;
import 'package:zheeta/features/buddy_events/data/datasource/prod/event_message_datasource_impl.dart'
    as _i179;
import 'package:zheeta/features/buddy_events/data/datasource/prod/event_search_datasource_impl.dart'
    as _i721;
import 'package:zheeta/features/buddy_events/data/datasource/prod/event_verification_datasource_impl.dart'
    as _i603;
import 'package:zheeta/features/buddy_events/data/repository/event_member_repository_impl.dart'
    as _i965;
import 'package:zheeta/features/buddy_events/data/repository/event_message_repository_impl.dart'
    as _i724;
import 'package:zheeta/features/buddy_events/data/repository/event_repository_impl.dart'
    as _i15;
import 'package:zheeta/features/buddy_events/data/repository/event_search_repository_impl.dart'
    as _i750;
import 'package:zheeta/features/buddy_events/data/repository/event_verification_repository_impl.dart'
    as _i767;
import 'package:zheeta/features/buddy_events/domain/repository/event_member_repository.dart'
    as _i565;
import 'package:zheeta/features/buddy_events/domain/repository/event_message_repository.dart'
    as _i399;
import 'package:zheeta/features/buddy_events/domain/repository/event_repository.dart'
    as _i619;
import 'package:zheeta/features/buddy_events/domain/repository/event_search_repository.dart'
    as _i1068;
import 'package:zheeta/features/buddy_events/domain/repository/event_verification_repository.dart'
    as _i337;
import 'package:zheeta/features/buddy_events/domain/usecase/buddy_event_verification/get_event_verification_usecase.dart'
    as _i261;
import 'package:zheeta/features/buddy_events/domain/usecase/create_event_usecase.dart'
    as _i169;
import 'package:zheeta/features/buddy_events/domain/usecase/created_event_usecase.dart'
    as _i914;
import 'package:zheeta/features/buddy_events/domain/usecase/delete_event_usecase.dart'
    as _i736;
import 'package:zheeta/features/buddy_events/domain/usecase/get_event_details_usecase.dart'
    as _i273;
import 'package:zheeta/features/buddy_events/domain/usecase/get_event_feed_usecase.dart'
    as _i747;
import 'package:zheeta/features/buddy_events/domain/usecase/get_event_member_usecase.dart'
    as _i962;
import 'package:zheeta/features/buddy_events/domain/usecase/get_join_request_usecase.dart'
    as _i1031;
import 'package:zheeta/features/buddy_events/domain/usecase/joined_event_usecase.dart'
    as _i658;
import 'package:zheeta/features/buddy_events/domain/usecase/process_join_request_usecase.dart'
    as _i222;
import 'package:zheeta/features/buddy_events/domain/usecase/remove_event_feed_usecase.dart'
    as _i865;
import 'package:zheeta/features/buddy_events/domain/usecase/search_event_usecase.dart'
    as _i913;
import 'package:zheeta/features/buddy_events/domain/usecase/send_join_request_usecase.dart'
    as _i293;
import 'package:zheeta/features/buddy_events/domain/usecase/share_event_usecase.dart'
    as _i384;
import 'package:zheeta/features/buddy_events/domain/usecase/update_event_usecase.dart'
    as _i539;
import 'package:zheeta/features/buddy_events/presentation/bloc/event_create_cubit/event_create_cubit.dart'
    as _i250;
import 'package:zheeta/features/buddy_events/presentation/bloc/event_cubit/event_cubit.dart'
    as _i416;
import 'package:zheeta/features/buddy_events/presentation/bloc/event_search_cubit/event_search_cubit.dart'
    as _i1054;
import 'package:zheeta/features/buddy_events/presentation/bloc/event_verification_cubit/event_verification_cubit.dart'
    as _i734;
import 'package:zheeta/features/buddy_events/presentation/bloc/sponsored_boost_cubit/sponsored_boost_cubit.dart'
    as _i757;
import 'package:zheeta/features/connections/data/datasource/downline_datasource.dart'
    as _i664;
import 'package:zheeta/features/connections/data/datasource/friends_datasource.dart'
    as _i243;
import 'package:zheeta/features/connections/data/datasource/prod/downline_datasource_impl.dart'
    as _i599;
import 'package:zheeta/features/connections/data/datasource/prod/friends_datasource_impl.dart'
    as _i31;
import 'package:zheeta/features/connections/data/repository/prod/friends_repository_impl.dart'
    as _i59;
import 'package:zheeta/features/connections/data/repository/prod/user_downlines_repository_impl.dart'
    as _i185;
import 'package:zheeta/features/connections/domain/repository/friends_repository.dart'
    as _i809;
import 'package:zheeta/features/connections/domain/repository/user_downline_repository.dart'
    as _i442;
import 'package:zheeta/features/connections/domain/usecase/ref_usecases/get_all_friends_usecase.dart'
    as _i675;
import 'package:zheeta/features/connections/domain/usecase/ref_usecases/get_pending_friends_usecase.dart'
    as _i492;
import 'package:zheeta/features/connections/domain/usecase/ref_usecases/process_friend_request_usecase.dart'
    as _i608;
import 'package:zheeta/features/connections/domain/usecase/ref_usecases/send_bulk_friend_request_usecases.dart'
    as _i613;
import 'package:zheeta/features/connections/domain/usecase/ref_usecases/send_friend_request_usecases.dart'
    as _i566;
import 'package:zheeta/features/connections/domain/usecase/ref_usecases/user_downlines_usecase.dart'
    as _i981;
import 'package:zheeta/features/connections/presentation/bloc/downline_cubit/downline_cubit.dart'
    as _i365;
import 'package:zheeta/features/connections/presentation/bloc/friends_cubit/friends_cubit.dart'
    as _i598;
import 'package:zheeta/features/discover/data/datasource/match_criteria_datasource.dart'
    as _i756;
import 'package:zheeta/features/discover/data/datasource/nearby_datasource.dart'
    as _i1019;
import 'package:zheeta/features/discover/data/datasource/prod/match_criteria_datasource_impl.dart'
    as _i162;
import 'package:zheeta/features/discover/data/datasource/prod/nearby_datasource_impl.dart'
    as _i233;
import 'package:zheeta/features/discover/data/repository/prod/match_criteria_repository_impl.dart'
    as _i884;
import 'package:zheeta/features/discover/data/repository/prod/nearby_profile_repository_impl.dart'
    as _i673;
import 'package:zheeta/features/discover/domain/repository/match_criteria_repository.dart'
    as _i723;
import 'package:zheeta/features/discover/domain/repository/nearby_repository.dart'
    as _i1072;
import 'package:zheeta/features/discover/domain/usecase/ref/match_criteria_usecases.dart'
    as _i787;
import 'package:zheeta/features/discover/domain/usecase/ref/nearby_profiles_usecase.dart'
    as _i565;
import 'package:zheeta/features/discover/domain/usecase/ref/nearby_settings_usecase.dart'
    as _i866;
import 'package:zheeta/features/discover/domain/usecase/ref/nearby_update_usecase.dart'
    as _i477;
import 'package:zheeta/features/discover/presentation/bloc/match_criteria_bloc/match_criteria_cubit.dart'
    as _i206;
import 'package:zheeta/features/discover/presentation/bloc/matches_bloc/matches_cubit.dart'
    as _i216;
import 'package:zheeta/features/discover/presentation/bloc/nearby_bloc/nearby_cubit.dart'
    as _i370;
import 'package:zheeta/features/gifts/data/datasource/gift_datasource.dart'
    as _i589;
import 'package:zheeta/features/gifts/data/datasource/prod/gift_datasource_impl.dart'
    as _i652;
import 'package:zheeta/features/gifts/data/repository/gift_repository_impl.dart'
    as _i906;
import 'package:zheeta/features/gifts/domain/repository/gift_repository.dart'
    as _i810;
import 'package:zheeta/features/gifts/domain/usecase/deliver_gift_usecase.dart'
    as _i1031;
import 'package:zheeta/features/gifts/domain/usecase/get_gifts_usecase.dart'
    as _i167;
import 'package:zheeta/features/gifts/domain/usecase/received_gift_usecase.dart'
    as _i392;
import 'package:zheeta/features/gifts/domain/usecase/redeem_gift_usecase.dart'
    as _i951;
import 'package:zheeta/features/gifts/domain/usecase/send_gift_usecase.dart'
    as _i739;
import 'package:zheeta/features/gifts/domain/usecase/sent_gift_usecase.dart'
    as _i330;
import 'package:zheeta/features/gifts/presentation/bloc/gift/gift_cubit.dart'
    as _i597;
import 'package:zheeta/features/homepage/presentation/views/bloc/app_cubit/app_cubit.dart'
    as _i992;
import 'package:zheeta/features/homepage/presentation/views/bloc/bottom_nav_cubit/bottom_nav_cubit.dart'
    as _i283;
import 'package:zheeta/features/messages/data/datasource/chat_datasource.dart'
    as _i738;
import 'package:zheeta/features/messages/data/datasource/prod/chat_datasource_impl.dart'
    as _i722;
import 'package:zheeta/features/messages/data/repository/chat_repository_impl.dart'
    as _i898;
import 'package:zheeta/features/messages/domain/repository/chat_repository.dart'
    as _i876;
import 'package:zheeta/features/messages/domain/usecase/create_chat.dart'
    as _i13;
import 'package:zheeta/features/messages/domain/usecase/delete_chat.dart'
    as _i948;
import 'package:zheeta/features/messages/domain/usecase/get_chat_history.dart'
    as _i466;
import 'package:zheeta/features/messages/domain/usecase/get_chat_recipient.dart'
    as _i168;
import 'package:zheeta/features/messages/presentation/bloc/chat_cubit/chat_cubit.dart'
    as _i468;
import 'package:zheeta/features/notification/data/datasource/notification_datasource.dart'
    as _i650;
import 'package:zheeta/features/notification/data/datasource/prod/notification_datasource_impl.dart'
    as _i164;
import 'package:zheeta/features/notification/data/repository/prod/notification_repository_impl.dart'
    as _i390;
import 'package:zheeta/features/notification/domain/repository/notification_repository.dart'
    as _i95;
import 'package:zheeta/features/notification/domain/usecase/notification_usecase.dart'
    as _i666;
import 'package:zheeta/features/notification/presentation/bloc/notification_cubit.dart'
    as _i912;
import 'package:zheeta/features/payment_and_subscriptions/data/datasource/payment_datasource.dart'
    as _i687;
import 'package:zheeta/features/payment_and_subscriptions/data/datasource/payout_account_datasource.dart'
    as _i272;
import 'package:zheeta/features/payment_and_subscriptions/data/datasource/prod/payment_datasource_impl.dart'
    as _i884;
import 'package:zheeta/features/payment_and_subscriptions/data/datasource/prod/payout_account_datasource_impl.dart'
    as _i286;
import 'package:zheeta/features/payment_and_subscriptions/data/datasource/prod/subscription_datasource_impl.dart'
    as _i1068;
import 'package:zheeta/features/payment_and_subscriptions/data/datasource/subscription_datasource.dart'
    as _i74;
import 'package:zheeta/features/payment_and_subscriptions/data/repository/payment_repository_impl.dart'
    as _i886;
import 'package:zheeta/features/payment_and_subscriptions/data/repository/payout_account_repository_impl.dart'
    as _i312;
import 'package:zheeta/features/payment_and_subscriptions/data/repository/subscription_repository_impl.dart'
    as _i589;
import 'package:zheeta/features/payment_and_subscriptions/domain/repository/payment_repository.dart'
    as _i481;
import 'package:zheeta/features/payment_and_subscriptions/domain/repository/payout_account_repository.dart'
    as _i475;
import 'package:zheeta/features/payment_and_subscriptions/domain/repository/subscription_repository.dart'
    as _i1018;
import 'package:zheeta/features/payment_and_subscriptions/domain/usecase/get_charges_usecase.dart'
    as _i367;
import 'package:zheeta/features/payment_and_subscriptions/domain/usecase/get_payment_link_usecase.dart'
    as _i120;
import 'package:zheeta/features/payment_and_subscriptions/domain/usecase/get_payment_types_usecase.dart'
    as _i809;
import 'package:zheeta/features/payment_and_subscriptions/domain/usecase/get_subscriptions_usecase.dart'
    as _i593;
import 'package:zheeta/features/payment_and_subscriptions/domain/usecase/payout_usecase.dart'
    as _i891;
import 'package:zheeta/features/payment_and_subscriptions/presentation/bloc/charges/charges_cubit.dart'
    as _i981;
import 'package:zheeta/features/payment_and_subscriptions/presentation/bloc/payment/payment_cubit.dart'
    as _i233;
import 'package:zheeta/features/payment_and_subscriptions/presentation/bloc/payout/payout_cubit.dart'
    as _i307;
import 'package:zheeta/features/payment_and_subscriptions/presentation/bloc/subscription/subscription_cubit.dart'
    as _i589;
import 'package:zheeta/features/profile/data/datasource/location_datasource.dart'
    as _i962;
import 'package:zheeta/features/profile/data/datasource/prod/location_datasource_impl.dart'
    as _i847;
import 'package:zheeta/features/profile/data/datasource/prod/user_interest_datasource_impl.dart'
    as _i217;
import 'package:zheeta/features/profile/data/datasource/prod/user_profile_access_datasource_impl.dart'
    as _i348;
import 'package:zheeta/features/profile/data/datasource/prod/user_profile_boost_datasource_impl.dart'
    as _i653;
import 'package:zheeta/features/profile/data/datasource/prod/user_profile_datasource_impl.dart'
    as _i726;
import 'package:zheeta/features/profile/data/datasource/prod/user_search_datasource_impl.dart'
    as _i516;
import 'package:zheeta/features/profile/data/datasource/user_interest_datasource.dart'
    as _i277;
import 'package:zheeta/features/profile/data/datasource/user_profile_access_datasource.dart'
    as _i125;
import 'package:zheeta/features/profile/data/datasource/user_profile_boost_datasource.dart'
    as _i869;
import 'package:zheeta/features/profile/data/datasource/user_profile_datasource.dart'
    as _i710;
import 'package:zheeta/features/profile/data/datasource/user_search_datasource.dart'
    as _i789;
import 'package:zheeta/features/profile/data/repository/prod/location_repository_impl.dart'
    as _i558;
import 'package:zheeta/features/profile/data/repository/prod/user_interest_repository_impl.dart'
    as _i58;
import 'package:zheeta/features/profile/data/repository/prod/user_profile_access_repository_impl.dart'
    as _i245;
import 'package:zheeta/features/profile/data/repository/prod/user_profile_boost_repository_impl.dart'
    as _i439;
import 'package:zheeta/features/profile/data/repository/prod/user_profile_repository_impl.dart'
    as _i760;
import 'package:zheeta/features/profile/data/repository/prod/user_search_repository_impl.dart'
    as _i839;
import 'package:zheeta/features/profile/domain/repository/location_repository.dart'
    as _i801;
import 'package:zheeta/features/profile/domain/repository/user_interest_repository.dart'
    as _i20;
import 'package:zheeta/features/profile/domain/repository/user_profile_access_repository.dart'
    as _i500;
import 'package:zheeta/features/profile/domain/repository/user_profile_boost_repository.dart'
    as _i826;
import 'package:zheeta/features/profile/domain/repository/user_profile_repository.dart'
    as _i273;
import 'package:zheeta/features/profile/domain/repository/user_search_repository.dart'
    as _i599;
import 'package:zheeta/features/profile/domain/usecase/location_usecases.dart'
    as _i33;
import 'package:zheeta/features/profile/domain/usecase/user_interest_usecases.dart'
    as _i451;
import 'package:zheeta/features/profile/domain/usecase/user_profile_access_usecases.dart'
    as _i417;
import 'package:zheeta/features/profile/domain/usecase/user_profile_boost_usecases.dart'
    as _i861;
import 'package:zheeta/features/profile/domain/usecase/user_profile_usecases.dart'
    as _i94;
import 'package:zheeta/features/profile/domain/usecase/user_profile_view_usecase.dart'
    as _i665;
import 'package:zheeta/features/profile/domain/usecase/user_search_usecases.dart'
    as _i993;
import 'package:zheeta/features/profile/presentation/bloc/profile_boost_cubit/profile_boost_cubit.dart'
    as _i605;
import 'package:zheeta/features/profile/presentation/bloc/profile_create_cubit/profile_create_cubit.dart'
    as _i1039;
import 'package:zheeta/features/profile/presentation/bloc/profile_cubit/profile_cubit.dart'
    as _i137;
import 'package:zheeta/features/profile/presentation/bloc/profile_edit_cubit/profile_edit_cubit.dart'
    as _i288;
import 'package:zheeta/features/profile/presentation/bloc/profile_interest_cubit/profile_interest_cubit.dart'
    as _i462;
import 'package:zheeta/features/profile/presentation/bloc/profile_location_cubit/profile_location_cubit.dart'
    as _i562;
import 'package:zheeta/features/profile/presentation/bloc/profile_search_cubit/profile_search_cubit.dart'
    as _i348;
import 'package:zheeta/features/profile/presentation/bloc/profile_view_cubit/profile_view_cubit.dart'
    as _i298;
import 'package:zheeta/features/splash_screen/presentation/cubit/maintenance_mode_cubit.dart'
    as _i848;
import 'package:zheeta/features/wallet_and_transactions/data/datasource/prod/transaction_datasource_impl.dart'
    as _i298;
import 'package:zheeta/features/wallet_and_transactions/data/datasource/prod/wallet_datasource_impl.dart'
    as _i553;
import 'package:zheeta/features/wallet_and_transactions/data/datasource/prod/withdrawal_datasource_impl.dart'
    as _i1063;
import 'package:zheeta/features/wallet_and_transactions/data/datasource/transaction_datasource.dart'
    as _i761;
import 'package:zheeta/features/wallet_and_transactions/data/datasource/wallet_datasource.dart'
    as _i795;
import 'package:zheeta/features/wallet_and_transactions/data/datasource/withdrawal_datasource.dart'
    as _i101;
import 'package:zheeta/features/wallet_and_transactions/data/repository/transaction_repository_impl.dart'
    as _i998;
import 'package:zheeta/features/wallet_and_transactions/data/repository/wallet_repository_impl.dart'
    as _i704;
import 'package:zheeta/features/wallet_and_transactions/data/repository/withdrawal_repository_impl.dart'
    as _i28;
import 'package:zheeta/features/wallet_and_transactions/domain/repository/transaction_repository.dart'
    as _i389;
import 'package:zheeta/features/wallet_and_transactions/domain/repository/wallet_repository.dart'
    as _i667;
import 'package:zheeta/features/wallet_and_transactions/domain/repository/withdrawal_repository.dart'
    as _i1051;
import 'package:zheeta/features/wallet_and_transactions/domain/usecase/transaction_usecase/get_transactions_usecase.dart'
    as _i259;
import 'package:zheeta/features/wallet_and_transactions/domain/usecase/wallet_usecase/get_wallet_counters.dart'
    as _i110;
import 'package:zheeta/features/wallet_and_transactions/domain/usecase/wallet_usecase/transfer_to_user_wallet_balance.dart'
    as _i241;
import 'package:zheeta/features/wallet_and_transactions/domain/usecase/withdrawal_usecase/get_rate_by_country_usecase.dart'
    as _i1022;
import 'package:zheeta/features/wallet_and_transactions/domain/usecase/withdrawal_usecase/process_payout_usecase.dart'
    as _i776;
import 'package:zheeta/features/wallet_and_transactions/presentation/bloc/transaction/transaction_cubit.dart'
    as _i662;
import 'package:zheeta/features/wallet_and_transactions/presentation/bloc/wallet/wallet_cubit.dart'
    as _i191;
import 'package:zheeta/features/wallet_and_transactions/presentation/bloc/withdrawal/withdrawal_cubit.dart'
    as _i653;

const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i467.AppRouter>(() => _i467.AppRouter());
    gh.singleton<_i888.PushNotificationService>(
      () => _i888.PushNotificationService(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i283.BottomNavCubit>(
      () => _i283.BottomNavCubit(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i848.MaintenanceModeCubit>(
      () => _i848.MaintenanceModeCubit(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i625.DeepLinkService>(
      () => _i625.DeepLinkService(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i889.InAppPurchaseService>(
      () => _i889.InAppPurchaseService(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i150.Api>(
      () => _i150.Api(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i734.IUserStorage>(
      () => _i217.UserStorage(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i573.ITokenStorage>(
      () => _i669.TokenStorage(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i84.UserAuthDataSource>(
      () => _i997.UserAuthDataSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i789.UserSearchDataSource>(
      () => _i516.UserSearchDataSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i243.FriendsDataSource>(
      () => _i31.FriendsDataSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i809.FriendsRepository>(
      () => _i59.FriendsRepositoryImpl(gh<_i243.FriendsDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i277.UserInterestDataSource>(
      () => _i217.UserInterestDataSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i459.EventVerificationDataSource>(
      () => _i603.EventVerificationDataSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i687.PaymentDataSource>(
      () => _i884.PaymentDataSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i561.UserAuthRepository>(
      () => _i213.UserAuthRepositoryImpl(
        gh<_i84.UserAuthDataSource>(),
        gh<_i734.IUserStorage>(),
        gh<_i573.ITokenStorage>(),
      ),
      registerFor: {_prod},
    );
    gh.singleton<_i507.EventMessageDataSource>(
      () => _i179.EventMessageDataSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i393.EventSearchDataSource>(
      () => _i721.EventSearchDatasourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i935.EventDataSource>(
      () => _i365.EventDataSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i1019.NearbyDataSource>(
      () => _i233.NearbyDataSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i664.UserDownlineDataSource>(
      () => _i599.UserDownlineDataSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i20.UserInterestRepository>(
      () => _i58.UserInterestRepositoryImpl(gh<_i277.UserInterestDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i272.PayoutAccountDataSource>(
      () => _i286.PayoutAccountRepositoryImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i869.UserProfileBoostDataSource>(
      () => _i653.UserProfileBoostDataSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i589.GiftDataSource>(
      () => _i652.GiftDataSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i619.EventRepository>(
      () => _i15.EventDataRepositoryImpl(gh<_i935.EventDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i599.UserSearchRepository>(
      () => _i839.UserSearchRepositoryImpl(gh<_i789.UserSearchDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i710.UserProfileDataSource>(
      () => _i726.UserProfileDataSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i513.EventMemberDataSource>(
      () => _i316.EventMemberDataSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i756.MatchCriteriaDataSource>(
      () => _i162.MatchCriteriaDataSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i613.SendBulkFriendRequest>(
      () => _i613.SendBulkFriendRequest(gh<_i809.FriendsRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i566.SendFriendRequest>(
      () => _i566.SendFriendRequest(gh<_i809.FriendsRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i492.GetPendingFriends>(
      () => _i492.GetPendingFriends(gh<_i809.FriendsRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i675.GetAllFriends>(
      () => _i675.GetAllFriends(gh<_i809.FriendsRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i608.ProcessFriendRequest>(
      () => _i608.ProcessFriendRequest(gh<_i809.FriendsRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i1072.NearbyDataRepository>(
      () => _i673.NearbyDataRepositoryImpl(gh<_i1019.NearbyDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i1068.EventSearchRepository>(
      () => _i750.EventSearchRepositoryImpl(gh<_i393.EventSearchDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i795.WalletDataSource>(
      () => _i553.WalletDataSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i598.FriendsCubit>(
      () => _i598.FriendsCubit(
        getAllFriends: gh<_i675.GetAllFriends>(),
        getPendingFriends: gh<_i492.GetPendingFriends>(),
        processFriendRequest: gh<_i608.ProcessFriendRequest>(),
        sendFriendRequest: gh<_i566.SendFriendRequest>(),
        sendBulkFriendRequest: gh<_i613.SendBulkFriendRequest>(),
      ),
      registerFor: {_prod},
    );
    gh.singleton<_i125.UserProfileAccessDataSource>(
      () => _i348.UserProfileAccessDataSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i667.WalletRepository>(
      () => _i704.WalletRepositoryImpl(gh<_i795.WalletDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i442.UserDownlineRepository>(
      () =>
          _i185.UserDownlineRepositoryImpl(gh<_i664.UserDownlineDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i101.WithdrawalDataSource>(
      () => _i1063.WithdrawalDataSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i1051.WithdrawalRepository>(
      () => _i28.WithdrawalRepositoryImpl(gh<_i101.WithdrawalDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i949.UserOtpDataSource>(
      () => _i6.UserOtpDataSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i650.NotificationDataSource>(
      () => _i164.NotificationDataSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i761.TransactionDataSource>(
      () => _i298.TransactionSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i738.ChatDataSource>(
      () => _i722.ChatDataSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i562.UserCountryDataSource>(
      () => _i714.CountryDataSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i74.SubscriptionDataSource>(
      () => _i1068.SubscriptionDatasourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i399.EventMessageRepository>(
      () =>
          _i724.EventMessageRepositoryImpl(gh<_i507.EventMessageDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i962.LocationDataSource>(
      () => _i847.LocationDataSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i866.GetNearbySettings>(
      () => _i866.GetNearbySettings(gh<_i1072.NearbyDataRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i565.GetNearbyProfiles>(
      () => _i565.GetNearbyProfiles(gh<_i1072.NearbyDataRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i477.UpdateNearbySettings>(
      () => _i477.UpdateNearbySettings(gh<_i1072.NearbyDataRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i876.ChatRepository>(
      () => _i898.ChatRepositoryImpl(gh<_i738.ChatDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i658.GetAllJoinedEvents>(
      () => _i658.GetAllJoinedEvents(gh<_i619.EventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i273.GetBuddyEventDetails>(
      () => _i273.GetBuddyEventDetails(gh<_i619.EventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i539.UpdateBuddyEvent>(
      () => _i539.UpdateBuddyEvent(gh<_i619.EventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i384.ShareBuddyEvent>(
      () => _i384.ShareBuddyEvent(gh<_i619.EventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i747.GetBuddyEventsFeed>(
      () => _i747.GetBuddyEventsFeed(gh<_i619.EventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i736.DeleteBuddyEvent>(
      () => _i736.DeleteBuddyEvent(gh<_i619.EventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i169.CreateBuddyEvent>(
      () => _i169.CreateBuddyEvent(gh<_i619.EventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i914.GetAllCreatedEvents>(
      () => _i914.GetAllCreatedEvents(gh<_i619.EventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i273.UserProfileRepository>(
      () => _i760.UserProfileRepositoryImpl(gh<_i710.UserProfileDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i337.EventVerificationRepository>(
      () => _i767.EventVerificationRepositoryImpl(
          gh<_i459.EventVerificationDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i475.PayoutAccountRepository>(
      () => _i312.PayoutAccountRepositoryImpl(
          gh<_i272.PayoutAccountDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i416.EventCubit>(
      () => _i416.EventCubit(
        getAllJoinedEvents: gh<_i658.GetAllJoinedEvents>(),
        getAllCreatedEvents: gh<_i914.GetAllCreatedEvents>(),
        getBuddyEventsFeed: gh<_i747.GetBuddyEventsFeed>(),
        getBuddyEventDetails: gh<_i273.GetBuddyEventDetails>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i261.GetBuddyEventVerificationById>(
      () => _i261.GetBuddyEventVerificationById(
          gh<_i337.EventVerificationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i1018.SubscriptionRepository>(
      () => _i589.SubscriptionRepositoryImpl(gh<_i74.SubscriptionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i99.RegisterUser>(
      () => _i99.RegisterUser(gh<_i561.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i99.LoginUser>(
      () => _i99.LoginUser(gh<_i561.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i99.RegisterStaff>(
      () => _i99.RegisterStaff(gh<_i561.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i99.ChangePassword>(
      () => _i99.ChangePassword(gh<_i561.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i99.ResetPassword>(
      () => _i99.ResetPassword(gh<_i561.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i99.LoginOAuth>(
      () => _i99.LoginOAuth(gh<_i561.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i891.AddBankAccount>(
      () => _i891.AddBankAccount(gh<_i475.PayoutAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i891.AddMobileMoneyAccount>(
      () => _i891.AddMobileMoneyAccount(gh<_i475.PayoutAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i891.AddPaypalAccount>(
      () => _i891.AddPaypalAccount(gh<_i475.PayoutAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i891.AddCryptoAccount>(
      () => _i891.AddCryptoAccount(gh<_i475.PayoutAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i891.GetAllAccounts>(
      () => _i891.GetAllAccounts(gh<_i475.PayoutAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i891.GetAccountById>(
      () => _i891.GetAccountById(gh<_i475.PayoutAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i891.DeleteAccountById>(
      () => _i891.DeleteAccountById(gh<_i475.PayoutAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i891.GetPayoutCountries>(
      () => _i891.GetPayoutCountries(gh<_i475.PayoutAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i110.GetWalletCounters>(
      () => _i110.GetWalletCounters(gh<_i667.WalletRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i241.TransferToUserWallet>(
      () => _i241.TransferToUserWallet(gh<_i667.WalletRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i723.MatchCriteriaRepository>(
      () => _i884.MatchCriteriaRepositoryImpl(
          gh<_i756.MatchCriteriaDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i776.ProcessPayout>(
      () => _i776.ProcessPayout(gh<_i1051.WithdrawalRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i1022.GetRateByCountry>(
      () => _i1022.GetRateByCountry(gh<_i1051.WithdrawalRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i389.TransactionRepository>(
      () => _i998.TransactionRepositoryImpl(gh<_i761.TransactionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i370.NearbyCubit>(
      () => _i370.NearbyCubit(
        getNearbyProfiles: gh<_i565.GetNearbyProfiles>(),
        getNearbySettings: gh<_i866.GetNearbySettings>(),
        updateNearbySettings: gh<_i477.UpdateNearbySettings>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i801.LocationRepository>(
      () => _i558.LocationRepositoryImpl(gh<_i962.LocationDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i734.EventVerificationCubit>(
      () => _i734.EventVerificationCubit(
          getBuddyEventVerificationById:
              gh<_i261.GetBuddyEventVerificationById>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i481.PaymentRepository>(
      () => _i886.PaymentRepositoryImpl(gh<_i687.PaymentDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i913.SearchBuddyEvent>(
      () => _i913.SearchBuddyEvent(gh<_i1068.EventSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i810.GiftRepository>(
      () => _i906.GiftDataRepositoryImpl(gh<_i589.GiftDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i259.GetAllTransactions>(
      () => _i259.GetAllTransactions(gh<_i389.TransactionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i451.GetInterests>(
      () => _i451.GetInterests(gh<_i20.UserInterestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i451.UpdateUserInterest>(
      () => _i451.UpdateUserInterest(gh<_i20.UserInterestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i315.UserOtpRepository>(
      () => _i193.UserOtpRepositoryImpl(gh<_i949.UserOtpDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i500.UserProfileAccessRepository>(
      () => _i245.UserProfileAccessRepositoryImpl(
          gh<_i125.UserProfileAccessDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i826.UserProfileBoostRepository>(
      () => _i439.UserProfileBoostRepositoryImpl(
          gh<_i869.UserProfileBoostDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i993.SearchUser>(
      () => _i993.SearchUser(gh<_i599.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i565.EventMemberRepository>(
      () => _i965.EventMemberRepositoryImpl(gh<_i513.EventMemberDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i653.WithdrawalCubit>(
      () => _i653.WithdrawalCubit(
        getRateByCountry: gh<_i1022.GetRateByCountry>(),
        processPayout: gh<_i776.ProcessPayout>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i95.NotificationRepository>(
      () =>
          _i390.NotificationRepositoryImpl(gh<_i650.NotificationDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i981.GetUserDownlines>(
      () => _i981.GetUserDownlines(gh<_i442.UserDownlineRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i94.GetSingleUserProfile>(
      () => _i94.GetSingleUserProfile(gh<_i273.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i94.CreateProfile>(
      () => _i94.CreateProfile(gh<_i273.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i94.UpdateUserProfilePicture>(
      () => _i94.UpdateUserProfilePicture(gh<_i273.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i94.UpdateUserProfileCarousels>(
      () => _i94.UpdateUserProfileCarousels(gh<_i273.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i94.UpdateUserProfile>(
      () => _i94.UpdateUserProfile(gh<_i273.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i665.VisitUserProfile>(
      () => _i665.VisitUserProfile(gh<_i273.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i861.CreateProfileBoost>(
      () => _i861.CreateProfileBoost(gh<_i826.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i861.GetProfileBoost>(
      () => _i861.GetProfileBoost(gh<_i826.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i861.GetProfileBoostInsight>(
      () =>
          _i861.GetProfileBoostInsight(gh<_i826.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i417.BlockAccount>(
      () => _i417.BlockAccount(gh<_i500.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i417.GetBlockedUsers>(
      () => _i417.GetBlockedUsers(gh<_i500.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i417.UnBlockAccount>(
      () => _i417.UnBlockAccount(gh<_i500.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i809.GetAllPaymentTypes>(
      () => _i809.GetAllPaymentTypes(gh<_i481.PaymentRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i120.GetPaymentLink>(
      () => _i120.GetPaymentLink(gh<_i481.PaymentRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i511.UserCountryRepository>(
      () => _i720.UserCountryRepositoryImpl(gh<_i562.UserCountryDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i307.PayoutCubit>(
      () => _i307.PayoutCubit(
        addBankAccount: gh<_i891.AddBankAccount>(),
        addMobileMoneyAccount: gh<_i891.AddMobileMoneyAccount>(),
        addPaypalAccount: gh<_i891.AddPaypalAccount>(),
        addCryptoAccount: gh<_i891.AddCryptoAccount>(),
        getAllAccounts: gh<_i891.GetAllAccounts>(),
        getAccountById: gh<_i891.GetAccountById>(),
        deleteAccountById: gh<_i891.DeleteAccountById>(),
        getPayoutCountries: gh<_i891.GetPayoutCountries>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i33.GetAddressFromLocationCoordinate>(
      () =>
          _i33.GetAddressFromLocationCoordinate(gh<_i801.LocationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i33.GetLocationCoordinateFromAddress>(
      () =>
          _i33.GetLocationCoordinateFromAddress(gh<_i801.LocationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i787.GetMatchCriteria>(
      () => _i787.GetMatchCriteria(gh<_i723.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i787.PopulateMatches>(
      () => _i787.PopulateMatches(gh<_i723.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i787.GetMatches>(
      () => _i787.GetMatches(gh<_i723.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i787.UpdateMatchCriteria>(
      () => _i787.UpdateMatchCriteria(gh<_i723.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i787.IgnoreBulkMatches>(
      () => _i787.IgnoreBulkMatches(gh<_i723.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i13.CreateChat>(
      () => _i13.CreateChat(gh<_i876.ChatRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i13.SendMediaFile>(
      () => _i13.SendMediaFile(gh<_i876.ChatRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i466.GetChatHistory>(
      () => _i466.GetChatHistory(gh<_i876.ChatRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i168.GetChatRecipients>(
      () => _i168.GetChatRecipients(gh<_i876.ChatRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i948.DeleteChatHistory>(
      () => _i948.DeleteChatHistory(gh<_i876.ChatRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i948.DeleteChatMessage>(
      () => _i948.DeleteChatMessage(gh<_i876.ChatRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i365.DownlineCubit>(
      () => _i365.DownlineCubit(getUserDownlines: gh<_i981.GetUserDownlines>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i191.WalletCubit>(
      () => _i191.WalletCubit(
        getWalletCounters: gh<_i110.GetWalletCounters>(),
        transferToUserWallet: gh<_i241.TransferToUserWallet>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i367.GetAllCharges>(
      () => _i367.GetAllCharges(gh<_i1018.SubscriptionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i593.GetAllSubscriptions>(
      () => _i593.GetAllSubscriptions(gh<_i1018.SubscriptionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i250.EventCreateCubit>(
      () => _i250.EventCreateCubit(
          createBuddyEvent: gh<_i169.CreateBuddyEvent>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i739.SendGiftUseCase>(
      () => _i739.SendGiftUseCase(gh<_i810.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i392.GetAllReceivedGifts>(
      () => _i392.GetAllReceivedGifts(gh<_i810.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i951.RedeemGift>(
      () => _i951.RedeemGift(gh<_i810.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i167.GetAllGifts>(
      () => _i167.GetAllGifts(gh<_i810.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i330.GetAllSentGifts>(
      () => _i330.GetAllSentGifts(gh<_i810.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i1031.DeliverGift>(
      () => _i1031.DeliverGift(gh<_i810.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i662.TransactionCubit>(
      () => _i662.TransactionCubit(
          getAllTransactions: gh<_i259.GetAllTransactions>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i288.ProfileEditCubit>(
      () => _i288.ProfileEditCubit(
        userProfileCarousels: gh<_i94.UpdateUserProfileCarousels>(),
        updateUserProfile: gh<_i94.UpdateUserProfile>(),
        updateUserProfilePicture: gh<_i94.UpdateUserProfilePicture>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i605.ProfileBoostCubit>(
      () => _i605.ProfileBoostCubit(
        createProfileBoost: gh<_i861.CreateProfileBoost>(),
        getProfileBoostInsight: gh<_i861.GetProfileBoostInsight>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i562.ProfileLocationCubit>(
      () => _i562.ProfileLocationCubit(
        getAddressFromLocationCoordinate:
            gh<_i33.GetAddressFromLocationCoordinate>(),
        getLocationCoordinateFromAddress:
            gh<_i33.GetLocationCoordinateFromAddress>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i1031.GetJoinRequests>(
      () => _i1031.GetJoinRequests(gh<_i565.EventMemberRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i293.SendJoinRequest>(
      () => _i293.SendJoinRequest(gh<_i565.EventMemberRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i865.RemoveBuddyEventMember>(
      () => _i865.RemoveBuddyEventMember(gh<_i565.EventMemberRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i962.GetBuddyEventMembers>(
      () => _i962.GetBuddyEventMembers(gh<_i565.EventMemberRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i222.ProcessJoinEventRequest>(
      () => _i222.ProcessJoinEventRequest(gh<_i565.EventMemberRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i1054.EventSearchCubit>(
      () => _i1054.EventSearchCubit(
          searchBuddyEvent: gh<_i913.SearchBuddyEvent>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i274.SendEmailVerifyOtp>(
      () => _i274.SendEmailVerifyOtp(gh<_i315.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i274.SendPhoneVerifyOtp>(
      () => _i274.SendPhoneVerifyOtp(gh<_i315.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i274.SendPasswordResetOtp>(
      () => _i274.SendPasswordResetOtp(gh<_i315.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i274.VerifyPhoneOtp>(
      () => _i274.VerifyPhoneOtp(gh<_i315.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i274.VerifyEmailOtp>(
      () => _i274.VerifyEmailOtp(gh<_i315.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i48.GetAllCountries>(
      () => _i48.GetAllCountries(gh<_i511.UserCountryRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i48.GetCountryDetails>(
      () => _i48.GetCountryDetails(gh<_i511.UserCountryRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i462.ProfileInterestCubit>(
      () => _i462.ProfileInterestCubit(
        getInterests: gh<_i451.GetInterests>(),
        updateUserInterest: gh<_i451.UpdateUserInterest>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i666.GetAllNotifications>(
      () => _i666.GetAllNotifications(gh<_i95.NotificationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i666.DeleteNotification>(
      () => _i666.DeleteNotification(gh<_i95.NotificationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i666.MarkAllNotificationsRead>(
      () => _i666.MarkAllNotificationsRead(gh<_i95.NotificationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i666.MarkNotificationRead>(
      () => _i666.MarkNotificationRead(gh<_i95.NotificationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i589.SubscriptionCubit>(
      () => _i589.SubscriptionCubit(
          getAllSubscriptions: gh<_i593.GetAllSubscriptions>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i757.SponsoredBoostCubit>(
      () => _i757.SponsoredBoostCubit(
          getProfileBoost: gh<_i861.GetProfileBoost>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i216.MatchesCubit>(
      () => _i216.MatchesCubit(
        getMatches: gh<_i787.GetMatches>(),
        populateMatches: gh<_i787.PopulateMatches>(),
        ignoreBulkMatches: gh<_i787.IgnoreBulkMatches>(),
        friendsCubit: gh<_i598.FriendsCubit>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i270.AuthenticationCubit>(
      () => _i270.AuthenticationCubit(
        registerUser: gh<_i99.RegisterUser>(),
        loginUser: gh<_i99.LoginUser>(),
        changePassword: gh<_i99.ChangePassword>(),
        resetPassword: gh<_i99.ResetPassword>(),
        sendPasswordResetOtp: gh<_i274.SendPasswordResetOtp>(),
        sendEmailVerifyOtp: gh<_i274.SendEmailVerifyOtp>(),
        sendPhoneVerifyOtp: gh<_i274.SendPhoneVerifyOtp>(),
        verifyPhoneOtp: gh<_i274.VerifyPhoneOtp>(),
        verifyEmailOtp: gh<_i274.VerifyEmailOtp>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i348.ProfileSearchCubit>(
      () => _i348.ProfileSearchCubit(searchUser: gh<_i993.SearchUser>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i233.PaymentCubit>(
      () => _i233.PaymentCubit(
        getAllPaymentTypes: gh<_i809.GetAllPaymentTypes>(),
        getPaymentLink: gh<_i120.GetPaymentLink>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i298.ProfileViewCubit>(
      () => _i298.ProfileViewCubit(
          visitUserProfile: gh<_i665.VisitUserProfile>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i912.NotificationCubit>(
      () => _i912.NotificationCubit(
        getAllNotifications: gh<_i666.GetAllNotifications>(),
        deleteNotification: gh<_i666.DeleteNotification>(),
        markNotificationRead: gh<_i666.MarkNotificationRead>(),
        markAllNotificationsRead: gh<_i666.MarkAllNotificationsRead>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i137.ProfileCubit>(
      () => _i137.ProfileCubit(
        getSingleUserProfile: gh<_i94.GetSingleUserProfile>(),
        getBlockedUsers: gh<_i417.GetBlockedUsers>(),
        blockAccount: gh<_i417.BlockAccount>(),
        unBlockAccount: gh<_i417.UnBlockAccount>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i206.MatchCriteriaCubit>(
      () => _i206.MatchCriteriaCubit(
        getMatchCriteria: gh<_i787.GetMatchCriteria>(),
        updateMatchCriteria: gh<_i787.UpdateMatchCriteria>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i981.ChargesCubit>(
      () => _i981.ChargesCubit(getAllCharges: gh<_i367.GetAllCharges>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i1039.ProfileCreateCubit>(
      () => _i1039.ProfileCreateCubit(
        createProfile: gh<_i94.CreateProfile>(),
        userProfileCarousels: gh<_i94.UpdateUserProfileCarousels>(),
        updateUserProfilePicture: gh<_i94.UpdateUserProfilePicture>(),
        profileInterestCubit: gh<_i462.ProfileInterestCubit>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i468.ChatCubit>(
      () => _i468.ChatCubit(
        getChatRecipients: gh<_i168.GetChatRecipients>(),
        getChatHistory: gh<_i466.GetChatHistory>(),
        createChat: gh<_i13.CreateChat>(),
        sendMediaFile: gh<_i13.SendMediaFile>(),
        deleteChat: gh<_i948.DeleteChatHistory>(),
        deleteMessage: gh<_i948.DeleteChatMessage>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i597.GiftCubit>(
      () => _i597.GiftCubit(
        getAllGifts: gh<_i167.GetAllGifts>(),
        getAllReceivedGifts: gh<_i392.GetAllReceivedGifts>(),
        redeemGift: gh<_i951.RedeemGift>(),
        deliverGift: gh<_i1031.DeliverGift>(),
        sendGiftUseCase: gh<_i739.SendGiftUseCase>(),
        getAllSentGifts: gh<_i330.GetAllSentGifts>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i355.AuthenticateCountryCubit>(
      () => _i355.AuthenticateCountryCubit(
        getAllCountries: gh<_i48.GetAllCountries>(),
        getCountryDetails: gh<_i48.GetCountryDetails>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i992.AppCubit>(
      () => _i992.AppCubit(
        profileCubit: gh<_i137.ProfileCubit>(),
        matchesCubit: gh<_i216.MatchesCubit>(),
        eventVerificationCubit: gh<_i734.EventVerificationCubit>(),
        subscriptionCubit: gh<_i589.SubscriptionCubit>(),
      ),
      registerFor: {_prod},
    );
    return this;
  }
}
