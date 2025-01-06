// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:zheeta/app/api/api_manager.dart' as _i759;
import 'package:zheeta/app/api/api_manager_refactored.dart' as _i695;
import 'package:zheeta/app/api/dio_module.dart' as _i603;
import 'package:zheeta/app/api/prod/api_manager_impl.dart' as _i800;
import 'package:zheeta/app/common/storage/token_storage/i_token_storage.dart'
    as _i366;
import 'package:zheeta/app/common/storage/token_storage/token_storage.dart'
    as _i1070;
import 'package:zheeta/app/common/storage/user_storage/i_user_storage.dart'
    as _i390;
import 'package:zheeta/app/common/storage/user_storage/user_storage.dart'
    as _i960;
import 'package:zheeta/app/router/app_router.dart' as _i831;
import 'package:zheeta/authentication/data/datasource/country_datasource.dart'
    as _i880;
import 'package:zheeta/authentication/data/datasource/identity_role_datasource.dart'
    as _i554;
import 'package:zheeta/authentication/data/datasource/prod/country_datasource_impl.dart'
    as _i926;
import 'package:zheeta/authentication/data/datasource/prod/identity_role_datasource_impl.dart'
    as _i743;
import 'package:zheeta/authentication/data/datasource/prod/user_auth_datasource_impl.dart'
    as _i168;
import 'package:zheeta/authentication/data/datasource/prod/user_otp_datasource_impl.dart'
    as _i698;
import 'package:zheeta/authentication/data/datasource/user_auth_datasource.dart'
    as _i731;
import 'package:zheeta/authentication/data/datasource/user_otp_datasource.dart'
    as _i926;
import 'package:zheeta/authentication/data/repository/prod/country_repository_impl.dart'
    as _i329;
import 'package:zheeta/authentication/data/repository/prod/identity_role_repository_impl.dart'
    as _i999;
import 'package:zheeta/authentication/data/repository/prod/user_auth_repository_impl.dart'
    as _i797;
import 'package:zheeta/authentication/data/repository/prod/user_otp_repository_impl.dart'
    as _i606;
import 'package:zheeta/authentication/domain/repository/country_repository.dart'
    as _i901;
import 'package:zheeta/authentication/domain/repository/identity_role_repository.dart'
    as _i90;
import 'package:zheeta/authentication/domain/repository/user_auth_repository.dart'
    as _i139;
import 'package:zheeta/authentication/domain/repository/user_otp_repository.dart'
    as _i804;
import 'package:zheeta/authentication/domain/usecase/country/country_usecases.dart'
    as _i607;
import 'package:zheeta/authentication/domain/usecase/identity/identity_usecases.dart'
    as _i931;
import 'package:zheeta/authentication/domain/usecase/user_auth/user_auth_usecases.dart'
    as _i193;
import 'package:zheeta/authentication/domain/usecase/user_otp/user_otp_usecases.dart'
    as _i307;
import 'package:zheeta/authentication/presentation/bloc/authentication_cubit.dart'
    as _i805;
import 'package:zheeta/connections/data/datasource/downline_datasource.dart'
    as _i884;
import 'package:zheeta/connections/data/datasource/friends_datasource.dart'
    as _i794;
import 'package:zheeta/connections/data/datasource/prod/downline_datasource_impl.dart'
    as _i437;
import 'package:zheeta/connections/data/datasource/prod/friends_datasource_impl.dart'
    as _i726;
import 'package:zheeta/connections/data/repository/prod/friends_repository_impl.dart'
    as _i822;
import 'package:zheeta/connections/data/repository/prod/user_downlines_repository_impl.dart'
    as _i214;
import 'package:zheeta/connections/domain/repository/friends_repository.dart'
    as _i928;
import 'package:zheeta/connections/domain/repository/user_downline_repository.dart'
    as _i588;
import 'package:zheeta/connections/domain/usecase/ref_usecases/get_all_friends_usecase.dart'
    as _i457;
import 'package:zheeta/connections/domain/usecase/ref_usecases/get_pending_friends_usecase.dart'
    as _i404;
import 'package:zheeta/connections/domain/usecase/ref_usecases/process_friend_request_usecase.dart'
    as _i177;
import 'package:zheeta/connections/domain/usecase/ref_usecases/send_friend_request_usecases.dart'
    as _i813;
import 'package:zheeta/connections/domain/usecase/ref_usecases/user_downlines_usecase.dart'
    as _i473;
import 'package:zheeta/connections/presentation/bloc/downline_cubit/downline_cubit.dart'
    as _i575;
import 'package:zheeta/connections/presentation/bloc/friends_cubit/friends_cubit.dart'
    as _i598;
import 'package:zheeta/discover/data/datasource/match_criteria_datasource.dart'
    as _i135;
import 'package:zheeta/discover/data/datasource/nearby_datasource.dart'
    as _i695;
import 'package:zheeta/discover/data/datasource/prod/match_criteria_datasource_impl.dart'
    as _i483;
import 'package:zheeta/discover/data/datasource/prod/nearby_datasource_impl.dart'
    as _i646;
import 'package:zheeta/discover/data/repository/prod/match_criteria_repository_impl.dart'
    as _i476;
import 'package:zheeta/discover/data/repository/prod/nearby_profile_repository_impl.dart'
    as _i571;
import 'package:zheeta/discover/domain/repository/match_criteria_repository.dart'
    as _i1018;
import 'package:zheeta/discover/domain/repository/nearby_repository.dart'
    as _i132;
import 'package:zheeta/discover/domain/usecase/ref/match_criteria_usecases.dart'
    as _i858;
import 'package:zheeta/discover/domain/usecase/ref/nearby_profiles_usecase.dart'
    as _i903;
import 'package:zheeta/discover/domain/usecase/ref/nearby_settings_usecase.dart'
    as _i154;
import 'package:zheeta/discover/presentation/bloc/matches_bloc/matches_cubit.dart'
    as _i729;
import 'package:zheeta/discover/presentation/bloc/nearby_bloc/nearby_cubit.dart'
    as _i935;
import 'package:zheeta/events/data/datasource/event_datasource.dart' as _i1061;
import 'package:zheeta/events/data/datasource/prod/event_datasource_impl.dart'
    as _i757;
import 'package:zheeta/events/data/repository/event_repository_impl.dart'
    as _i392;
import 'package:zheeta/events/domain/repository/event_repository.dart' as _i892;
import 'package:zheeta/events/domain/usecase/create_event_usecase.dart'
    as _i745;
import 'package:zheeta/events/domain/usecase/created_event_usecase.dart'
    as _i819;
import 'package:zheeta/events/domain/usecase/delete_event_usecase.dart'
    as _i913;
import 'package:zheeta/events/domain/usecase/get_event_by_friend_usecase.dart'
    as _i656;
import 'package:zheeta/events/domain/usecase/get_event_details_usecase.dart'
    as _i834;
import 'package:zheeta/events/domain/usecase/get_event_feed_usecase.dart'
    as _i677;
import 'package:zheeta/events/domain/usecase/get_event_member_usecase.dart'
    as _i209;
import 'package:zheeta/events/domain/usecase/get_join_request_usecase.dart'
    as _i340;
import 'package:zheeta/events/domain/usecase/joined_event_usecase.dart'
    as _i800;
import 'package:zheeta/events/domain/usecase/remove_event_feed_usecase.dart'
    as _i1047;
import 'package:zheeta/events/domain/usecase/send_join_request_usecase.dart'
    as _i601;
import 'package:zheeta/events/domain/usecase/share_event_usecase.dart' as _i397;
import 'package:zheeta/events/domain/usecase/update_event_usecase.dart'
    as _i531;
import 'package:zheeta/events/presentation/bloc/event_cubit/event_cubit.dart'
    as _i498;
import 'package:zheeta/events/presentation/bloc/sponsored_boost_cubit/sponsored_boost_cubit.dart'
    as _i724;
import 'package:zheeta/gifts/data/datasource/gift_datasource.dart' as _i1002;
import 'package:zheeta/gifts/data/datasource/prod/gift_datasource_impl.dart'
    as _i271;
import 'package:zheeta/gifts/data/repository/gift_repository_impl.dart'
    as _i719;
import 'package:zheeta/gifts/domain/repository/gift_repository.dart' as _i99;
import 'package:zheeta/gifts/domain/usecase/deliver_gift_usecase.dart' as _i440;
import 'package:zheeta/gifts/domain/usecase/get_gifts_usecase.dart' as _i795;
import 'package:zheeta/gifts/domain/usecase/received_gift_usecase.dart'
    as _i810;
import 'package:zheeta/gifts/domain/usecase/redeem_gift_usecase.dart' as _i528;
import 'package:zheeta/gifts/domain/usecase/send_gift_usecase.dart' as _i383;
import 'package:zheeta/gifts/domain/usecase/sent_gift_usecase.dart' as _i859;
import 'package:zheeta/gifts/presentation/bloc/gift/gift_cubit.dart' as _i215;
import 'package:zheeta/messages/data/datasource/chat_datasource.dart' as _i590;
import 'package:zheeta/messages/data/datasource/prod/chat_datasource_impl.dart'
    as _i263;
import 'package:zheeta/messages/data/repository/chat_repository_impl.dart'
    as _i238;
import 'package:zheeta/messages/domain/repository/chat_repository.dart'
    as _i888;
import 'package:zheeta/notification/data/datasource/notification_datasource.dart'
    as _i655;
import 'package:zheeta/notification/data/datasource/prod/notification_datasource_impl.dart'
    as _i402;
import 'package:zheeta/notification/data/repository/prod/notification_repository_impl.dart'
    as _i5;
import 'package:zheeta/notification/domain/repository/notification_repository.dart'
    as _i636;
import 'package:zheeta/notification/domain/usecase/notification_usecase.dart'
    as _i182;
import 'package:zheeta/notification/presentation/bloc/notification_cubit.dart'
    as _i644;
import 'package:zheeta/payment_and_subscriptions/data/datasource/prod/subscription_datasource_impl.dart'
    as _i564;
import 'package:zheeta/payment_and_subscriptions/data/datasource/subscription_datasource.dart'
    as _i537;
import 'package:zheeta/payment_and_subscriptions/data/repository/subscription_repository_impl.dart'
    as _i16;
import 'package:zheeta/payment_and_subscriptions/domain/repository/subscription_repository.dart'
    as _i316;
import 'package:zheeta/payment_and_subscriptions/domain/usecase/get_charges_usecase.dart'
    as _i547;
import 'package:zheeta/payment_and_subscriptions/domain/usecase/get_subscriptions_usecase.dart'
    as _i785;
import 'package:zheeta/payment_and_subscriptions/presentation/bloc/charges/charges_cubit.dart'
    as _i137;
import 'package:zheeta/payment_and_subscriptions/presentation/bloc/subscription/subscription_cubit.dart'
    as _i196;
import 'package:zheeta/profile/data/datasource/access_restriction_datasource.dart'
    as _i1019;
import 'package:zheeta/profile/data/datasource/location_datasource.dart'
    as _i257;
import 'package:zheeta/profile/data/datasource/prod/access_restriction_datasource_impl.dart'
    as _i555;
import 'package:zheeta/profile/data/datasource/prod/location_datasource_impl.dart'
    as _i991;
import 'package:zheeta/profile/data/datasource/prod/user_bank_account_datasource_impl.dart'
    as _i727;
import 'package:zheeta/profile/data/datasource/prod/user_interest_datasource_impl.dart'
    as _i43;
import 'package:zheeta/profile/data/datasource/prod/user_profile_access_datasource_impl.dart'
    as _i976;
import 'package:zheeta/profile/data/datasource/prod/user_profile_boost_datasource_impl.dart'
    as _i431;
import 'package:zheeta/profile/data/datasource/prod/user_profile_datasource_impl.dart'
    as _i183;
import 'package:zheeta/profile/data/datasource/prod/user_search_datasource_impl.dart'
    as _i770;
import 'package:zheeta/profile/data/datasource/prod/user_transaction_datasource_impl.dart'
    as _i656;
import 'package:zheeta/profile/data/datasource/user_bank_account_datasource.dart'
    as _i471;
import 'package:zheeta/profile/data/datasource/user_interest_datasource.dart'
    as _i469;
import 'package:zheeta/profile/data/datasource/user_profile_access_datasource.dart'
    as _i625;
import 'package:zheeta/profile/data/datasource/user_profile_boost_datasource.dart'
    as _i887;
import 'package:zheeta/profile/data/datasource/user_profile_datasource.dart'
    as _i80;
import 'package:zheeta/profile/data/datasource/user_search_datasource.dart'
    as _i315;
import 'package:zheeta/profile/data/datasource/user_transaction_datasource.dart'
    as _i358;
import 'package:zheeta/profile/data/repository/prod/access_restriction_repository_impl.dart'
    as _i560;
import 'package:zheeta/profile/data/repository/prod/location_repository_impl.dart'
    as _i473;
import 'package:zheeta/profile/data/repository/prod/user_bank_account_repository_impl.dart'
    as _i584;
import 'package:zheeta/profile/data/repository/prod/user_interest_repository_impl.dart'
    as _i330;
import 'package:zheeta/profile/data/repository/prod/user_profile_access_repository_impl.dart'
    as _i633;
import 'package:zheeta/profile/data/repository/prod/user_profile_boost_repository_impl.dart'
    as _i502;
import 'package:zheeta/profile/data/repository/prod/user_profile_repository_impl.dart'
    as _i804;
import 'package:zheeta/profile/data/repository/prod/user_search_repository_impl.dart'
    as _i432;
import 'package:zheeta/profile/data/repository/prod/user_transaction_repository_impl.dart'
    as _i779;
import 'package:zheeta/profile/domain/repository/access_restriction_repository.dart'
    as _i466;
import 'package:zheeta/profile/domain/repository/location_repository.dart'
    as _i737;
import 'package:zheeta/profile/domain/repository/user_bank_account_repository.dart'
    as _i701;
import 'package:zheeta/profile/domain/repository/user_interest_repository.dart'
    as _i367;
import 'package:zheeta/profile/domain/repository/user_profile_access_repository.dart'
    as _i215;
import 'package:zheeta/profile/domain/repository/user_profile_boost_repository.dart'
    as _i527;
import 'package:zheeta/profile/domain/repository/user_profile_repository.dart'
    as _i644;
import 'package:zheeta/profile/domain/repository/user_search_repository.dart'
    as _i1014;
import 'package:zheeta/profile/domain/repository/user_transaction_repository.dart'
    as _i188;
import 'package:zheeta/profile/domain/usecase/ref_usecases/location_usecases.dart'
    as _i609;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_interest_usecases.dart'
    as _i149;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_access_usecases.dart'
    as _i702;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_boost_usecases.dart'
    as _i308;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_usecases.dart'
    as _i401;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_view_usecase.dart'
    as _i582;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_search_usecases.dart'
    as _i536;
import 'package:zheeta/profile/presentation/bloc/profile_cubit/profile_cubit.dart'
    as _i93;
import 'package:zheeta/profile/presentation/bloc/profile_view_cubit/profile_view_cubit.dart'
    as _i148;
import 'package:zheeta/wallet/data/datasource/prod/transaction_datasource_impl.dart'
    as _i734;
import 'package:zheeta/wallet/data/datasource/prod/wallet_datasource_impl.dart'
    as _i235;
import 'package:zheeta/wallet/data/datasource/prod/withdrawal_datasource_impl.dart'
    as _i65;
import 'package:zheeta/wallet/data/datasource/transaction_datasource.dart'
    as _i204;
import 'package:zheeta/wallet/data/datasource/wallet_datasource.dart' as _i1002;
import 'package:zheeta/wallet/data/datasource/withdrawal_datasource.dart'
    as _i814;
import 'package:zheeta/wallet/data/repository/transaction_repository_impl.dart'
    as _i795;
import 'package:zheeta/wallet/data/repository/wallet_repository_impl.dart'
    as _i609;
import 'package:zheeta/wallet/data/repository/withdrawal_repository_impl.dart'
    as _i162;
import 'package:zheeta/wallet/domain/repository/transaction_repository.dart'
    as _i518;
import 'package:zheeta/wallet/domain/repository/wallet_repository.dart'
    as _i480;
import 'package:zheeta/wallet/domain/repository/withdrawal_repository.dart'
    as _i930;
import 'package:zheeta/wallet/domain/usecase/transaction_usecase/get_transactions_usecase.dart'
    as _i1023;
import 'package:zheeta/wallet/domain/usecase/withdrawal_usecase/get_rate_by_country_usecase.dart'
    as _i850;
import 'package:zheeta/wallet/presentation/bloc/transaction/transaction_cubit.dart'
    as _i394;
import 'package:zheeta/wallet/presentation/bloc/withdrawal/withdrawal_cubit.dart'
    as _i747;

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
    gh.factory<_i603.DioModule>(() => _i603.DioModule());
    gh.factory<_i831.AppRouter>(() => _i831.AppRouter());
    gh.factory<_i695.Api>(
      () => _i695.Api(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i390.IUserStorage>(
      () => _i960.UserStorage(),
      registerFor: {_prod},
    );
    gh.singleton<_i887.UserProfileBoostDataSource>(
      () => _i431.UserProfileBoostDataSourceImpl(gh<_i695.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i814.WithdrawalDataSource>(
      () => _i65.WithdrawalDataSourceImpl(gh<_i695.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i366.ITokenStorage>(
      () => _i1070.TokenStorage(),
      registerFor: {_prod},
    );
    gh.singleton<_i1061.EventDataSource>(
      () => _i757.EventDataSourceImpl(gh<_i695.Api>()),
      registerFor: {_prod},
    );
    gh.factory<_i759.ApiManager>(
      () => _i800.ApiManagerImpl(gh<_i603.DioModule>()),
      registerFor: {_prod},
    );
    gh.singleton<_i80.UserProfileDataSource>(
      () => _i183.UserProfileDataSourceImpl(gh<_i695.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i695.NearbyDataSource>(
      () => _i646.NearbyDataSourceImpl(gh<_i695.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i1002.GiftDataSource>(
      () => _i271.GiftDataSourceImpl(gh<_i695.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i794.FriendsDataSource>(
      () => _i726.FriendsDataSourceImpl(gh<_i695.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i731.UserAuthDataSource>(
      () => _i168.UserAuthDataSourceImpl(gh<_i695.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i1002.WalletDataSource>(
      () => _i235.WalletDataSourceImpl(gh<_i695.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i884.UserDownlineDataSource>(
      () => _i437.UserDownlineDataSourceImpl(gh<_i695.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i469.UserInterestDataSource>(
      () => _i43.UserInterestDataSourceImpl(gh<_i695.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i132.NearbyDataRepository>(
      () => _i571.NearbyDataRepositoryImpl(gh<_i695.NearbyDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i527.UserProfileBoostRepository>(
      () => _i502.UserProfileBoostRepositoryImpl(
          gh<_i887.UserProfileBoostDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i139.UserAuthRepository>(
      () => _i797.UserAuthRepositoryImpl(
        gh<_i731.UserAuthDataSource>(),
        gh<_i390.IUserStorage>(),
        gh<_i366.ITokenStorage>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i154.GetNearbySettings>(
      () => _i154.GetNearbySettings(gh<_i132.NearbyDataRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i903.GetNearbyProfiles>(
      () => _i903.GetNearbyProfiles(gh<_i132.NearbyDataRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i1019.AccessRestrictionDataSource>(
      () => _i555.AccessRestrictionDataSourceImpl(
        gh<_i759.ApiManager>(),
        gh<_i695.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i480.WalletRepository>(
      () => _i609.WalletRepositoryImpl(gh<_i1002.WalletDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i315.UserSearchDataSource>(
      () => _i770.UserSearchDataSourceImpl(
        gh<_i759.ApiManager>(),
        gh<_i695.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i880.CountryDataSource>(
      () => _i926.CountryDataSourceImpl(
        gh<_i759.ApiManager>(),
        gh<_i695.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i928.FriendsRepository>(
      () => _i822.FriendsRepositoryImpl(gh<_i794.FriendsDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i99.GiftRepository>(
      () => _i719.GiftDataRepositoryImpl(gh<_i1002.GiftDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i358.UserTransactionDataSource>(
      () => _i656.UserTransactionDataSourceImpl(
        gh<_i759.ApiManager>(),
        gh<_i695.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i193.RegisterUser>(
      () => _i193.RegisterUser(gh<_i139.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i193.LoginUser>(
      () => _i193.LoginUser(gh<_i139.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i193.RegisterStaff>(
      () => _i193.RegisterStaff(gh<_i139.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i193.ChangePassword>(
      () => _i193.ChangePassword(gh<_i139.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i193.ResetPassword>(
      () => _i193.ResetPassword(gh<_i139.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i193.LoginOAuth>(
      () => _i193.LoginOAuth(gh<_i139.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i554.IdentityRoleDataSource>(
      () => _i743.IdentityRoleDataSourceImpl(
        gh<_i759.ApiManager>(),
        gh<_i695.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.singleton<_i471.UserBankAccountDataSource>(
      () => _i727.UserBankAccountDataSourceImpl(
        gh<_i759.ApiManager>(),
        gh<_i695.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.singleton<_i257.LocationDataSource>(
      () => _i991.LocationDataSourceImpl(
        gh<_i759.ApiManager>(),
        gh<_i695.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i926.UserOtpDataSource>(
      () => _i698.UserOtpDataSourceImpl(
        gh<_i759.ApiManager>(),
        gh<_i695.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.singleton<_i625.UserProfileAccessDataSource>(
      () => _i976.UserProfileAccessDataSourceImpl(gh<_i695.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i590.ChatDataSource>(
      () => _i263.ChatDataSourceImpl(gh<_i695.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i537.SubscriptionDataSource>(
      () => _i564.SubscriptionDatasourceImpl(gh<_i695.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i1014.UserSearchRepository>(
      () => _i432.UserSearchRepositorImpl(gh<_i315.UserSearchDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i135.MatchCriteriaDataSource>(
      () => _i483.MatchCriteriaDataSourceImpl(gh<_i695.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i655.NotificationDataSource>(
      () => _i402.NotificationDataSourceImpl(gh<_i695.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i204.TransactionDataSource>(
      () => _i734.TransactionSourceImpl(gh<_i695.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i737.LocationRepository>(
      () => _i473.LocationRepositoryImpl(gh<_i257.LocationDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i588.UserDownlineRepository>(
      () =>
          _i214.UserDownlineRepositoryImpl(gh<_i884.UserDownlineDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i536.SearchUserByCustomer>(
      () => _i536.SearchUserByCustomer(gh<_i1014.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i644.UserProfileRepository>(
      () => _i804.UserProfileRepositoryImpl(gh<_i80.UserProfileDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i935.NearbyCubit>(
      () => _i935.NearbyCubit(
        getNearbyProfiles: gh<_i903.GetNearbyProfiles>(),
        getNearbySettings: gh<_i154.GetNearbySettings>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i930.WithdrawalRepository>(
      () => _i162.WithdrawalRepositoryImpl(gh<_i814.WithdrawalDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i892.EventRepository>(
      () => _i392.EventDataRepositoryImpl(gh<_i1061.EventDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i518.TransactionRepository>(
      () => _i795.TransactionRepositoryImpl(gh<_i204.TransactionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i813.SendFriendRequest>(
      () => _i813.SendFriendRequest(gh<_i928.FriendsRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i404.GetPendingFriends>(
      () => _i404.GetPendingFriends(gh<_i928.FriendsRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i457.GetAllFriends>(
      () => _i457.GetAllFriends(gh<_i928.FriendsRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i177.ProcessFriendRequest>(
      () => _i177.ProcessFriendRequest(gh<_i928.FriendsRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i901.CountryRepository>(
      () => _i329.CountryRepositoryImpl(gh<_i880.CountryDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i701.UserBankAccountRepository>(
      () => _i584.UserBankAccountRepositoryImpl(
          gh<_i471.UserBankAccountDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i340.GetJoinRequests>(
      () => _i340.GetJoinRequests(gh<_i892.EventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i800.GetAllJoinedEvents>(
      () => _i800.GetAllJoinedEvents(gh<_i892.EventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i601.SendJoinRequest>(
      () => _i601.SendJoinRequest(gh<_i892.EventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i834.GetBuddyEventDetails>(
      () => _i834.GetBuddyEventDetails(gh<_i892.EventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i531.UpdateBuddyEvent>(
      () => _i531.UpdateBuddyEvent(gh<_i892.EventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i1047.RemoveBuddyEventMember>(
      () => _i1047.RemoveBuddyEventMember(gh<_i892.EventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i209.GetBuddyEventMembers>(
      () => _i209.GetBuddyEventMembers(gh<_i892.EventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i397.ShareBuddyEvent>(
      () => _i397.ShareBuddyEvent(gh<_i892.EventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i677.GetBuddyEventsFeed>(
      () => _i677.GetBuddyEventsFeed(gh<_i892.EventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i913.DeleteBuddyEvent>(
      () => _i913.DeleteBuddyEvent(gh<_i892.EventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i745.CreateBuddyEvent>(
      () => _i745.CreateBuddyEvent(gh<_i892.EventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i656.GetEventsCreatedByFriends>(
      () => _i656.GetEventsCreatedByFriends(gh<_i892.EventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i819.GetAllCreatedEvents>(
      () => _i819.GetAllCreatedEvents(gh<_i892.EventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i473.GetUserDownlines>(
      () => _i473.GetUserDownlines(gh<_i588.UserDownlineRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i607.GetAllCountries>(
      () => _i607.GetAllCountries(gh<_i901.CountryRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i607.GetCountryDetails>(
      () => _i607.GetCountryDetails(gh<_i901.CountryRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i367.UserInterestRepository>(
      () =>
          _i330.UserInterestRepositoryImpl(gh<_i469.UserInterestDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i609.GetAddressFromLocationCoordinate>(
      () => _i609.GetAddressFromLocationCoordinate(
          gh<_i737.LocationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i609.GetLocationCoordinateFromAddress>(
      () => _i609.GetLocationCoordinateFromAddress(
          gh<_i737.LocationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i188.UserTransactionRepository>(
      () => _i779.UserTransactionRepositoryImpl(
          gh<_i358.UserTransactionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i308.GetProfileBoost>(
      () => _i308.GetProfileBoost(gh<_i527.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i316.SubscriptionRepository>(
      () => _i16.SubscriptionRepositoryImpl(gh<_i537.SubscriptionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i598.FriendsCubit>(
      () => _i598.FriendsCubit(
        getAllFriends: gh<_i457.GetAllFriends>(),
        getPendingFriends: gh<_i404.GetPendingFriends>(),
        processFriendRequest: gh<_i177.ProcessFriendRequest>(),
        sendFriendRequest: gh<_i813.SendFriendRequest>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i383.SendGiftUseCase>(
      () => _i383.SendGiftUseCase(gh<_i99.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i810.GetAllReceivedGifts>(
      () => _i810.GetAllReceivedGifts(gh<_i99.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i528.RedeemGift>(
      () => _i528.RedeemGift(gh<_i99.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i795.GetAllGifts>(
      () => _i795.GetAllGifts(gh<_i99.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i859.GetAllSentGifts>(
      () => _i859.GetAllSentGifts(gh<_i99.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i440.DeliverGift>(
      () => _i440.DeliverGift(gh<_i99.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i90.IdentityRoleRepository>(
      () =>
          _i999.IdentityRoleRepositoryImpl(gh<_i554.IdentityRoleDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i575.DownlineCubit>(
      () => _i575.DownlineCubit(getUserDownlines: gh<_i473.GetUserDownlines>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i804.UserOtpRepository>(
      () => _i606.UserOtpRepositoryImpl(gh<_i926.UserOtpDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i466.AccessRestrictionRepository>(
      () => _i560.AccessRestrictionRepositoryImpl(
          gh<_i1019.AccessRestrictionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i498.EventCubit>(
      () => _i498.EventCubit(
        getAllJoinedEvents: gh<_i800.GetAllJoinedEvents>(),
        getAllCreatedEvents: gh<_i819.GetAllCreatedEvents>(),
        getBuddyEventsFeed: gh<_i677.GetBuddyEventsFeed>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i850.GetRateByCountry>(
      () => _i850.GetRateByCountry(gh<_i930.WithdrawalRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i1023.GetAllTransactions>(
      () => _i1023.GetAllTransactions(gh<_i518.TransactionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i636.NotificationRepository>(
      () => _i5.NotificationRepositoryImpl(gh<_i655.NotificationDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i215.UserProfileAccessRepository>(
      () => _i633.UserProfileAccessRepositoryImpl(
          gh<_i625.UserProfileAccessDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i724.SponsoredBoostCubit>(
      () => _i724.SponsoredBoostCubit(
          getProfileBoost: gh<_i308.GetProfileBoost>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i182.GetAllNotifications>(
      () => _i182.GetAllNotifications(gh<_i636.NotificationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i182.DeleteNotification>(
      () => _i182.DeleteNotification(gh<_i636.NotificationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i182.MarkAllNotificationsRead>(
      () => _i182.MarkAllNotificationsRead(gh<_i636.NotificationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i182.MarkNotificationRead>(
      () => _i182.MarkNotificationRead(gh<_i636.NotificationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i888.ChatRepository>(
      () => _i238.ChatRepositoryImpl(gh<_i590.ChatDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i1018.MatchCriteriaRepository>(
      () => _i476.MatchCriteriaRepositoryImpl(
          gh<_i135.MatchCriteriaDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i858.GetMatchCriteria>(
      () => _i858.GetMatchCriteria(gh<_i1018.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i858.PopulateMatches>(
      () => _i858.PopulateMatches(gh<_i1018.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i858.GetMatches>(
      () => _i858.GetMatches(gh<_i1018.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i858.UpdateMatchCriteria>(
      () => _i858.UpdateMatchCriteria(gh<_i1018.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i401.CreateProfile>(
      () => _i401.CreateProfile(gh<_i644.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i401.GetAllUsersProfile>(
      () => _i401.GetAllUsersProfile(gh<_i644.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i401.GetSingleUserProfile>(
      () => _i401.GetSingleUserProfile(gh<_i644.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i401.UpdateUserProfilePicture>(
      () => _i401.UpdateUserProfilePicture(gh<_i644.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i401.UpdateUserProfileCarousels>(
      () => _i401.UpdateUserProfileCarousels(gh<_i644.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i401.UpdateUserProfile>(
      () => _i401.UpdateUserProfile(gh<_i644.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i401.GetUserRecentActivity>(
      () => _i401.GetUserRecentActivity(gh<_i644.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i582.VisitUserProfile>(
      () => _i582.VisitUserProfile(gh<_i644.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i547.GetAllCharges>(
      () => _i547.GetAllCharges(gh<_i316.SubscriptionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i785.GetAllSubscriptions>(
      () => _i785.GetAllSubscriptions(gh<_i316.SubscriptionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i307.SendEmailVerifyOtp>(
      () => _i307.SendEmailVerifyOtp(gh<_i804.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i307.SendPhoneVerifyOtp>(
      () => _i307.SendPhoneVerifyOtp(gh<_i804.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i307.SendPasswordResetOtp>(
      () => _i307.SendPasswordResetOtp(gh<_i804.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i307.VerifyPhoneOtp>(
      () => _i307.VerifyPhoneOtp(gh<_i804.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i307.VerifyEmailOtp>(
      () => _i307.VerifyEmailOtp(gh<_i804.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i149.GetInterests>(
      () => _i149.GetInterests(gh<_i367.UserInterestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i149.UpdateUserInterest>(
      () => _i149.UpdateUserInterest(gh<_i367.UserInterestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i702.BlockAccount>(
      () => _i702.BlockAccount(gh<_i215.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i702.GetBlockedUsers>(
      () => _i702.GetBlockedUsers(gh<_i215.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i702.UnBlockAccount>(
      () => _i702.UnBlockAccount(gh<_i215.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i729.MatchesCubit>(
      () => _i729.MatchesCubit(
        getMatchCriteria: gh<_i858.GetMatchCriteria>(),
        getMatches: gh<_i858.GetMatches>(),
        populateMatches: gh<_i858.PopulateMatches>(),
        updateMatchCriteria: gh<_i858.UpdateMatchCriteria>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i148.ProfileViewCubit>(
      () => _i148.ProfileViewCubit(
          visitUserProfile: gh<_i582.VisitUserProfile>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i215.GiftCubit>(
      () => _i215.GiftCubit(
        getAllGifts: gh<_i795.GetAllGifts>(),
        getAllReceivedGifts: gh<_i810.GetAllReceivedGifts>(),
        redeemGift: gh<_i528.RedeemGift>(),
        deliverGift: gh<_i440.DeliverGift>(),
        sendGiftUseCase: gh<_i383.SendGiftUseCase>(),
        getAllSentGifts: gh<_i859.GetAllSentGifts>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i644.NotificationCubit>(
      () => _i644.NotificationCubit(
        getAllNotifications: gh<_i182.GetAllNotifications>(),
        deleteNotification: gh<_i182.DeleteNotification>(),
        markNotificationRead: gh<_i182.MarkNotificationRead>(),
        markAllNotificationsRead: gh<_i182.MarkAllNotificationsRead>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i931.UpgradeUserRole>(
      () => _i931.UpgradeUserRole(gh<_i90.IdentityRoleRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i931.DowngradeUserRole>(
      () => _i931.DowngradeUserRole(gh<_i90.IdentityRoleRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i747.WithdrawalCubit>(
      () =>
          _i747.WithdrawalCubit(getRateByCountry: gh<_i850.GetRateByCountry>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i394.TransactionCubit>(
      () => _i394.TransactionCubit(
          getAllTransactions: gh<_i1023.GetAllTransactions>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i137.ChargesCubit>(
      () => _i137.ChargesCubit(getAllCharges: gh<_i547.GetAllCharges>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i93.ProfileCubit>(
      () => _i93.ProfileCubit(
        getAddressFromLocationCoordinate:
            gh<_i609.GetAddressFromLocationCoordinate>(),
        getLocationCoordinateFromAddress:
            gh<_i609.GetLocationCoordinateFromAddress>(),
        getInterests: gh<_i149.GetInterests>(),
        updateUserInterest: gh<_i149.UpdateUserInterest>(),
        blockAccount: gh<_i702.BlockAccount>(),
        getBlockedUsers: gh<_i702.GetBlockedUsers>(),
        unBlockAccount: gh<_i702.UnBlockAccount>(),
        createProfile: gh<_i401.CreateProfile>(),
        getAllUsersProfile: gh<_i401.GetAllUsersProfile>(),
        getSingleUserProfile: gh<_i401.GetSingleUserProfile>(),
        getUserRecentActivity: gh<_i401.GetUserRecentActivity>(),
        updateUserProfilePicture: gh<_i401.UpdateUserProfilePicture>(),
        userProfileCarousels: gh<_i401.UpdateUserProfileCarousels>(),
        updateUserProfile: gh<_i401.UpdateUserProfile>(),
        searchUserByCustomer: gh<_i536.SearchUserByCustomer>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i196.SubscriptionCubit>(
      () => _i196.SubscriptionCubit(
          getAllSubscriptions: gh<_i785.GetAllSubscriptions>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i805.AuthenticationCubit>(
      () => _i805.AuthenticationCubit(
        getAllCountries: gh<_i607.GetAllCountries>(),
        getCountryDetails: gh<_i607.GetCountryDetails>(),
        registerUser: gh<_i193.RegisterUser>(),
        loginUser: gh<_i193.LoginUser>(),
        registerStaff: gh<_i193.RegisterStaff>(),
        changePassword: gh<_i193.ChangePassword>(),
        resetPassword: gh<_i193.ResetPassword>(),
        loginOAuth: gh<_i193.LoginOAuth>(),
        sendPasswordResetOtp: gh<_i307.SendPasswordResetOtp>(),
        sendEmailVerifyOtp: gh<_i307.SendEmailVerifyOtp>(),
        sendPhoneVerifyOtp: gh<_i307.SendPhoneVerifyOtp>(),
        verifyPhoneOtp: gh<_i307.VerifyPhoneOtp>(),
        verifyEmailOtp: gh<_i307.VerifyEmailOtp>(),
      ),
      registerFor: {_prod},
    );
    return this;
  }
}
