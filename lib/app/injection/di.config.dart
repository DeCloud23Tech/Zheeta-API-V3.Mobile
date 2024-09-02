// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:zheeta/app/api/api_manager.dart' as _i15;
import 'package:zheeta/app/api/api_manager_refactored.dart' as _i5;
import 'package:zheeta/app/api/dio_module.dart' as _i3;
import 'package:zheeta/app/api/prod/api_manager_impl.dart' as _i16;
import 'package:zheeta/app/common/storage/token_storage/i_token_storage.dart'
    as _i13;
import 'package:zheeta/app/common/storage/token_storage/token_storage.dart'
    as _i14;
import 'package:zheeta/app/common/storage/user_storage/i_user_storage.dart'
    as _i11;
import 'package:zheeta/app/common/storage/user_storage/user_storage.dart'
    as _i12;
import 'package:zheeta/app/router/app_router.dart' as _i4;
import 'package:zheeta/authentication/data/datasource/country_datasource.dart'
    as _i37;
import 'package:zheeta/authentication/data/datasource/identity_role_datasource.dart'
    as _i46;
import 'package:zheeta/authentication/data/datasource/prod/country_datasource_impl.dart'
    as _i38;
import 'package:zheeta/authentication/data/datasource/prod/identity_role_datasource_impl.dart'
    as _i47;
import 'package:zheeta/authentication/data/datasource/prod/user_auth_datasource_impl.dart'
    as _i28;
import 'package:zheeta/authentication/data/datasource/prod/user_otp_datasource_impl.dart'
    as _i55;
import 'package:zheeta/authentication/data/datasource/user_auth_datasource.dart'
    as _i27;
import 'package:zheeta/authentication/data/datasource/user_otp_datasource.dart'
    as _i54;
import 'package:zheeta/authentication/data/repository/prod/country_repository_impl.dart'
    as _i77;
import 'package:zheeta/authentication/data/repository/prod/identity_role_repository_impl.dart'
    as _i101;
import 'package:zheeta/authentication/data/repository/prod/user_auth_repository_impl.dart'
    as _i30;
import 'package:zheeta/authentication/data/repository/prod/user_otp_repository_impl.dart'
    as _i103;
import 'package:zheeta/authentication/domain/repository/country_repository.dart'
    as _i76;
import 'package:zheeta/authentication/domain/repository/identity_role_repository.dart'
    as _i100;
import 'package:zheeta/authentication/domain/repository/user_auth_repository.dart'
    as _i29;
import 'package:zheeta/authentication/domain/repository/user_otp_repository.dart'
    as _i102;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/country/country_usecases.dart'
    as _i81;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/identity/identity_usecases.dart'
    as _i136;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/user_auth/user_auth_usecases.dart'
    as _i45;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/user_otp/user_otp_usecases.dart'
    as _i127;
import 'package:zheeta/authentication/presentation/bloc/authentication_bloc.dart'
    as _i140;
import 'package:zheeta/authentication/presentation/viewmodel/user_auth_viewmodel.dart'
    as _i10;
import 'package:zheeta/authentication/presentation/viewmodel/user_otp_viewmodel.dart'
    as _i9;
import 'package:zheeta/discover/data/datasource/downline_datasource.dart'
    as _i23;
import 'package:zheeta/discover/data/datasource/match_criteria_datasource.dart'
    as _i50;
import 'package:zheeta/discover/data/datasource/nearby_datasource.dart' as _i19;
import 'package:zheeta/discover/data/datasource/prod/downline_datasource_impl.dart'
    as _i24;
import 'package:zheeta/discover/data/datasource/prod/match_criteria_datasource_impl.dart'
    as _i51;
import 'package:zheeta/discover/data/datasource/prod/nearby_datasource_impl.dart'
    as _i20;
import 'package:zheeta/discover/data/repository/prod/match_criteria_repository_impl.dart'
    as _i59;
import 'package:zheeta/discover/data/repository/prod/nearby_profile_repository_impl.dart'
    as _i73;
import 'package:zheeta/discover/data/repository/prod/user_downlines_repository_impl.dart'
    as _i75;
import 'package:zheeta/discover/domain/repository/match_criteria_repository.dart'
    as _i58;
import 'package:zheeta/discover/domain/repository/populate_nearby_repository.dart'
    as _i72;
import 'package:zheeta/discover/domain/repository/user_downline_repository.dart'
    as _i74;
import 'package:zheeta/discover/domain/usecase/match_criteria_usecase.dart'
    as _i108;
import 'package:zheeta/discover/domain/usecase/prod/match_criteria_usecase_impl.dart'
    as _i109;
import 'package:zheeta/discover/domain/usecase/ref/match_criteria_usecases.dart'
    as _i60;
import 'package:zheeta/discover/domain/usecase/ref/nearby_profiles_usecase.dart'
    as _i105;
import 'package:zheeta/discover/domain/usecase/ref/nearby_settings_usecase.dart'
    as _i104;
import 'package:zheeta/discover/domain/usecase/ref/user_downlines_usecase.dart'
    as _i114;
import 'package:zheeta/discover/presentation/bloc/downline_bloc/downline_cubit.dart'
    as _i124;
import 'package:zheeta/discover/presentation/bloc/matches_bloc/matches_cubit.dart'
    as _i84;
import 'package:zheeta/discover/presentation/bloc/nearby_bloc/nearby_cubit.dart'
    as _i125;
import 'package:zheeta/discover/presentation/viewmodel/match_criteria_viewmodel.dart'
    as _i6;
import 'package:zheeta/feeds/presentation/bloc/feeds_cubit.dart' as _i142;
import 'package:zheeta/feeds/presentation/viewmodel/feeds_viewmodel.dart'
    as _i144;
import 'package:zheeta/friends/data/datasource/friends_datasource.dart' as _i31;
import 'package:zheeta/friends/data/datasource/prod/friends_datasource_impl.dart'
    as _i32;
import 'package:zheeta/friends/data/repository/prod/friends_repository_impl.dart'
    as _i86;
import 'package:zheeta/friends/domain/repository/friends_repository.dart'
    as _i85;
import 'package:zheeta/friends/domain/usecase/ref_usecases/get_all_friends_usecase.dart'
    as _i119;
import 'package:zheeta/friends/domain/usecase/ref_usecases/get_pending_friends_usecase.dart'
    as _i118;
import 'package:zheeta/friends/domain/usecase/ref_usecases/process_friend_request_usecase.dart'
    as _i120;
import 'package:zheeta/friends/domain/usecase/ref_usecases/send_friend_request_usecases.dart'
    as _i117;
import 'package:zheeta/friends/presentation/bloc/friends_cubit.dart' as _i129;
import 'package:zheeta/gifts/data/datasource/gift_datasource.dart' as _i21;
import 'package:zheeta/gifts/data/datasource/prod/gift_datasource_impl.dart'
    as _i22;
import 'package:zheeta/gifts/data/repository/gift_repository_impl.dart' as _i42;
import 'package:zheeta/gifts/domain/repository/gift_repository.dart' as _i41;
import 'package:zheeta/gifts/domain/usecase/deliver_gift_usecase.dart' as _i99;
import 'package:zheeta/gifts/domain/usecase/get_gifts_usecase.dart' as _i97;
import 'package:zheeta/gifts/domain/usecase/received_gift_usecase.dart' as _i95;
import 'package:zheeta/gifts/domain/usecase/redeem_gift_usecase.dart' as _i96;
import 'package:zheeta/gifts/domain/usecase/send_gift_usecase.dart' as _i94;
import 'package:zheeta/gifts/domain/usecase/sent_gift_usecase.dart' as _i98;
import 'package:zheeta/gifts/presentation/bloc/gift/gift_cubit.dart' as _i135;
import 'package:zheeta/notification/data/datasource/notification_datasource.dart'
    as _i65;
import 'package:zheeta/notification/data/datasource/prod/notification_datasource_impl.dart'
    as _i66;
import 'package:zheeta/notification/data/repository/prod/notification_repository_impl.dart'
    as _i111;
import 'package:zheeta/notification/domain/repository/notification_repository.dart'
    as _i110;
import 'package:zheeta/notification/domain/usecase/notification_usecase.dart'
    as _i116;
import 'package:zheeta/notification/presentation/bloc/notification_cubit.dart'
    as _i132;
import 'package:zheeta/payment_and_subscriptions/data/datasource/prod/subscription_datasource_impl.dart'
    as _i62;
import 'package:zheeta/payment_and_subscriptions/data/datasource/subscription_datasource.dart'
    as _i61;
import 'package:zheeta/payment_and_subscriptions/data/repository/subscription_repository_impl.dart'
    as _i91;
import 'package:zheeta/payment_and_subscriptions/domain/repository/subscription_repository.dart'
    as _i90;
import 'package:zheeta/payment_and_subscriptions/domain/usecase/get_charges_usecase.dart'
    as _i122;
import 'package:zheeta/payment_and_subscriptions/domain/usecase/get_subscriptions_usecase.dart'
    as _i123;
import 'package:zheeta/payment_and_subscriptions/presentation/bloc/charges/charges_cubit.dart'
    as _i138;
import 'package:zheeta/payment_and_subscriptions/presentation/bloc/subscription/subscription_cubit.dart'
    as _i141;
import 'package:zheeta/payment_and_subscriptions/presentation/viewmodel/charge_viewmodel.dart'
    as _i139;
import 'package:zheeta/profile/data/datasource/access_restriction_datasource.dart'
    as _i33;
import 'package:zheeta/profile/data/datasource/location_datasource.dart'
    as _i52;
import 'package:zheeta/profile/data/datasource/prod/access_restriction_datasource_impl.dart'
    as _i34;
import 'package:zheeta/profile/data/datasource/prod/location_datasource_impl.dart'
    as _i53;
import 'package:zheeta/profile/data/datasource/prod/user_bank_account_datasource_impl.dart'
    as _i49;
import 'package:zheeta/profile/data/datasource/prod/user_interest_datasource_impl.dart'
    as _i26;
import 'package:zheeta/profile/data/datasource/prod/user_profile_access_datasource_impl.dart'
    as _i57;
import 'package:zheeta/profile/data/datasource/prod/user_profile_boost_datasource_impl.dart'
    as _i40;
import 'package:zheeta/profile/data/datasource/prod/user_profile_datasource_impl.dart'
    as _i18;
import 'package:zheeta/profile/data/datasource/prod/user_search_datasource_impl.dart'
    as _i36;
import 'package:zheeta/profile/data/datasource/prod/user_transaction_datasource_impl.dart'
    as _i44;
import 'package:zheeta/profile/data/datasource/user_bank_account_datasource.dart'
    as _i48;
import 'package:zheeta/profile/data/datasource/user_interest_datasource.dart'
    as _i25;
import 'package:zheeta/profile/data/datasource/user_profile_access_datasource.dart'
    as _i56;
import 'package:zheeta/profile/data/datasource/user_profile_boost_datasource.dart'
    as _i39;
import 'package:zheeta/profile/data/datasource/user_profile_datasource.dart'
    as _i17;
import 'package:zheeta/profile/data/datasource/user_search_datasource.dart'
    as _i35;
import 'package:zheeta/profile/data/datasource/user_transaction_datasource.dart'
    as _i43;
import 'package:zheeta/profile/data/repository/prod/access_restriction_repository_impl.dart'
    as _i107;
import 'package:zheeta/profile/data/repository/prod/location_repository_impl.dart'
    as _i68;
import 'package:zheeta/profile/data/repository/prod/user_bank_account_repository_impl.dart'
    as _i79;
import 'package:zheeta/profile/data/repository/prod/user_interest_repository_impl.dart'
    as _i83;
import 'package:zheeta/profile/data/repository/prod/user_profile_access_repository_impl.dart'
    as _i113;
import 'package:zheeta/profile/data/repository/prod/user_profile_boost_repository_impl.dart'
    as _i93;
import 'package:zheeta/profile/data/repository/prod/user_profile_repository_impl.dart'
    as _i71;
import 'package:zheeta/profile/data/repository/prod/user_search_repository_impl.dart'
    as _i64;
import 'package:zheeta/profile/data/repository/prod/user_transaction_repository_impl.dart'
    as _i89;
import 'package:zheeta/profile/domain/repository/access_restriction_repository.dart'
    as _i106;
import 'package:zheeta/profile/domain/repository/location_repository.dart'
    as _i67;
import 'package:zheeta/profile/domain/repository/user_bank_account_repository.dart'
    as _i78;
import 'package:zheeta/profile/domain/repository/user_interest_repository.dart'
    as _i82;
import 'package:zheeta/profile/domain/repository/user_profile_access_repository.dart'
    as _i112;
import 'package:zheeta/profile/domain/repository/user_profile_boost_repository.dart'
    as _i92;
import 'package:zheeta/profile/domain/repository/user_profile_repository.dart'
    as _i70;
import 'package:zheeta/profile/domain/repository/user_search_repository.dart'
    as _i63;
import 'package:zheeta/profile/domain/repository/user_transaction_repository.dart'
    as _i88;
import 'package:zheeta/profile/domain/usecase/access_restriction_usecase.dart'
    as _i133;
import 'package:zheeta/profile/domain/usecase/prod/access_restriction_usecase_impl.dart'
    as _i134;
import 'package:zheeta/profile/domain/usecase/ref_usecases/access_restriction_usecases.dart'
    as _i126;
import 'package:zheeta/profile/domain/usecase/ref_usecases/location_usecases.dart'
    as _i87;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_bank_usecases.dart'
    as _i80;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_interest_usecases.dart'
    as _i128;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_access_usecases.dart'
    as _i131;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_boost_usecases.dart'
    as _i137;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_usecases.dart'
    as _i121;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_search_usecases.dart'
    as _i69;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_transaction_usecases.dart'
    as _i115;
import 'package:zheeta/profile/presentation/bloc/profile_cubit/profile_cubit.dart'
    as _i143;
import 'package:zheeta/profile/presentation/bloc/profile_view_cubit/profile_view_cubit.dart'
    as _i130;
import 'package:zheeta/profile/presentation/viewmodel/about_screen_viewmodel.dart'
    as _i7;
import 'package:zheeta/profile/presentation/viewmodel/user_profile_viewmodel.dart'
    as _i8;

const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.DioModule>(() => _i3.DioModule());
    gh.factory<_i4.AppRouter>(() => _i4.AppRouter());
    gh.factory<_i5.Api>(
      () => _i5.Api(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i6.MatchCriteriaViewModel>(
      () => _i6.MatchCriteriaViewModel(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i7.AbountScreenViewModel>(
      () => _i7.AbountScreenViewModel(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i8.UserProfileViewModel>(
      () => _i8.UserProfileViewModel(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i9.UserOtpViewModel>(
      () => _i9.UserOtpViewModel(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i10.UserAuthViewModel>(
      () => _i10.UserAuthViewModel(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i11.IUserStorage>(
      () => _i12.UserStorage(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i13.ITokenStorage>(
      () => _i14.TokenStorage(),
      registerFor: {_prod},
    );
    gh.factory<_i15.ApiManager>(
      () => _i16.ApiManagerImpl(gh<_i3.DioModule>()),
      registerFor: {_prod},
    );
    gh.singleton<_i17.UserProfileDataSource>(
      () => _i18.UserProfileDataSourceImpl(gh<_i5.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i19.NearbyDataSource>(
      () => _i20.NearbyDataSourceImpl(gh<_i5.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i21.GiftDataSource>(
      () => _i22.GiftDataSourceImpl(gh<_i5.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i23.UserDownlineDataSource>(
      () => _i24.UserDownlineDataSourceImpl(gh<_i5.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i25.UserInterestDataSource>(
      () => _i26.UserInterestDataSourceImpl(
        gh<_i15.ApiManager>(),
        gh<_i5.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i27.UserAuthDataSource>(
      () => _i28.UserAuthDataSourceImpl(
        gh<_i15.ApiManager>(),
        gh<_i5.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i29.UserAuthRepository>(
      () => _i30.UserAuthRepositoryImpl(
        gh<_i27.UserAuthDataSource>(),
        gh<_i11.IUserStorage>(),
        gh<_i13.ITokenStorage>(),
      ),
      registerFor: {_prod},
    );
    gh.singleton<_i31.FriendsDataSource>(
      () => _i32.FriendsDataSourceImpl(
        gh<_i15.ApiManager>(),
        gh<_i5.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.singleton<_i33.AccessRestrictionDataSource>(
      () => _i34.AccessRestrictionDataSourceImpl(
        gh<_i15.ApiManager>(),
        gh<_i5.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.singleton<_i35.UserSearchDataSource>(
      () => _i36.UserSearchDataSourceImpl(
        gh<_i15.ApiManager>(),
        gh<_i5.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i37.CountryDataSource>(
      () => _i38.CountryDataSourceImpl(
        gh<_i15.ApiManager>(),
        gh<_i5.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.singleton<_i39.UserProfileBoostDataSource>(
      () => _i40.UserProfileBoostDataSourceImpl(
        gh<_i15.ApiManager>(),
        gh<_i5.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i41.GiftRepository>(
      () => _i42.GiftDataRepositoryImpl(gh<_i21.GiftDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i43.UserTransactionDataSource>(
      () => _i44.UserTransactionDataSourceImpl(
        gh<_i15.ApiManager>(),
        gh<_i5.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i45.RegisterUser>(
      () => _i45.RegisterUser(gh<_i29.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i45.LoginUser>(
      () => _i45.LoginUser(gh<_i29.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i45.RegisterStaff>(
      () => _i45.RegisterStaff(gh<_i29.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i45.ChangePassword>(
      () => _i45.ChangePassword(gh<_i29.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i45.ResetPassword>(
      () => _i45.ResetPassword(gh<_i29.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i45.LoginOAuth>(
      () => _i45.LoginOAuth(gh<_i29.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i46.IdentityRoleDataSource>(
      () => _i47.IdentityRoleDataSourceImpl(
        gh<_i15.ApiManager>(),
        gh<_i5.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.singleton<_i48.UserBankAccountDataSource>(
      () => _i49.UserBankAccountDataSourceImpl(
        gh<_i15.ApiManager>(),
        gh<_i5.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.singleton<_i50.MatchCriteriaDataSource>(
      () => _i51.MatchCriteriaDataSourceImpl(
        gh<_i15.ApiManager>(),
        gh<_i5.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.singleton<_i52.LocationDataSource>(
      () => _i53.LocationDataSourceImpl(
        gh<_i15.ApiManager>(),
        gh<_i5.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i54.UserOtpDataSource>(
      () => _i55.UserOtpDataSourceImpl(
        gh<_i15.ApiManager>(),
        gh<_i5.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.singleton<_i56.UserProfileAccessDataSource>(
      () => _i57.UserProfileAccessDataSourceImpl(
        gh<_i15.ApiManager>(),
        gh<_i5.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i58.MatchCriteriaRepository>(
      () =>
          _i59.MatchCriteriaRepositoryImpl(gh<_i50.MatchCriteriaDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i60.GetMatchCriteria>(
      () => _i60.GetMatchCriteria(gh<_i58.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i60.PopulateMatches>(
      () => _i60.PopulateMatches(gh<_i58.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i60.GetMatches>(
      () => _i60.GetMatches(gh<_i58.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i60.UpdateMatchCriteria>(
      () => _i60.UpdateMatchCriteria(gh<_i58.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i61.SubscriptionDataSource>(
      () => _i62.SubscriptionDatasourceImpl(gh<_i5.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i63.UserSearchRepository>(
      () => _i64.UserSearchRepositorImpl(gh<_i35.UserSearchDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i65.NotificationDataSource>(
      () => _i66.NotificationDataSourceImpl(gh<_i5.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i67.LocationRepository>(
      () => _i68.LocationRepositoryImpl(gh<_i52.LocationDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i69.FindUserByAdminEmail>(
      () => _i69.FindUserByAdminEmail(gh<_i63.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i69.FindUserByAdminUsername>(
      () => _i69.FindUserByAdminUsername(gh<_i63.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i69.SearchUserByCustomer>(
      () => _i69.SearchUserByCustomer(gh<_i63.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i70.UserProfileRepository>(
      () => _i71.UserProfileRepositoryImpl(gh<_i17.UserProfileDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i72.NearbyDataRepository>(
      () => _i73.NearbyDataRepositoryImpl(gh<_i19.NearbyDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i74.UserDownlineRepository>(
      () => _i75.UserDownlineRepositoryImpl(gh<_i23.UserDownlineDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i76.CountryRepository>(
      () => _i77.CountryRepositoryImpl(gh<_i37.CountryDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i78.UserBankAccountRepository>(
      () => _i79.UserBankAccountRepositoryImpl(
          gh<_i48.UserBankAccountDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i80.CreateUpdateBankAccount>(
      () => _i80.CreateUpdateBankAccount(gh<_i78.UserBankAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i80.GetUserBankAccount>(
      () => _i80.GetUserBankAccount(gh<_i78.UserBankAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i81.GetAllCountries>(
      () => _i81.GetAllCountries(gh<_i76.CountryRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i81.GetCountryDetails>(
      () => _i81.GetCountryDetails(gh<_i76.CountryRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i82.UserInterestRepository>(
      () => _i83.UserInterestRepositoryImpl(gh<_i25.UserInterestDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i84.MatchesCubit>(
      () => _i84.MatchesCubit(
        getMatchCriteria: gh<_i60.GetMatchCriteria>(),
        getMatches: gh<_i60.GetMatches>(),
        populateMatches: gh<_i60.PopulateMatches>(),
        updateMatchCriteria: gh<_i60.UpdateMatchCriteria>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i85.FriendsRepository>(
      () => _i86.FriendsRepositoryImpl(gh<_i31.FriendsDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i87.GetAddressFromLocationCoordinate>(
      () =>
          _i87.GetAddressFromLocationCoordinate(gh<_i67.LocationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i87.GetLocationCoordinateFromAddress>(
      () =>
          _i87.GetLocationCoordinateFromAddress(gh<_i67.LocationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i88.UserTransactionRepository>(
      () => _i89.UserTransactionRepositoryImpl(
          gh<_i43.UserTransactionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i90.SubscriptionRepository>(
      () => _i91.SubscriptionRepositoryImpl(gh<_i61.SubscriptionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i92.UserProfileBoostRepository>(
      () => _i93.UserProfileBoostRepositoryImpl(
          gh<_i39.UserProfileBoostDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i94.SendGiftUseCase>(
      () => _i94.SendGiftUseCase(gh<_i41.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i95.GetAllReceivedGifts>(
      () => _i95.GetAllReceivedGifts(gh<_i41.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i96.RedeemGift>(
      () => _i96.RedeemGift(gh<_i41.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i97.GetAllGifts>(
      () => _i97.GetAllGifts(gh<_i41.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i98.GetAllSentGifts>(
      () => _i98.GetAllSentGifts(gh<_i41.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i99.DeliverGift>(
      () => _i99.DeliverGift(gh<_i41.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i100.IdentityRoleRepository>(
      () => _i101.IdentityRoleRepositoryImpl(gh<_i46.IdentityRoleDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i102.UserOtpRepository>(
      () => _i103.UserOtpRepositoryImpl(gh<_i54.UserOtpDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i104.GetNearbySettings>(
      () => _i104.GetNearbySettings(gh<_i72.NearbyDataRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i105.GetNearbyProfiles>(
      () => _i105.GetNearbyProfiles(gh<_i72.NearbyDataRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i106.AccessRestrictionRepository>(
      () => _i107.AccessRestrictionRepositoryImpl(
          gh<_i33.AccessRestrictionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i108.MatchCriteriaUseCase>(
      () => _i109.MatchCriteriaUseCaseImpl(gh<_i58.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i110.NotificationRepository>(
      () => _i111.NotificationRepositoryImpl(gh<_i65.NotificationDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i112.UserProfileAccessRepository>(
      () => _i113.UserProfileAccessRepositoryImpl(
          gh<_i56.UserProfileAccessDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i114.GetUserDownlines>(
      () => _i114.GetUserDownlines(gh<_i74.UserDownlineRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i115.GetUserTransactions>(
      () => _i115.GetUserTransactions(gh<_i88.UserTransactionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i116.GetAllNotifications>(
      () => _i116.GetAllNotifications(gh<_i110.NotificationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i117.SendFriendRequest>(
      () => _i117.SendFriendRequest(gh<_i85.FriendsRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i118.GetPendingFriends>(
      () => _i118.GetPendingFriends(gh<_i85.FriendsRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i119.GetAllFriends>(
      () => _i119.GetAllFriends(gh<_i85.FriendsRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i120.ProcessFriendRequest>(
      () => _i120.ProcessFriendRequest(gh<_i85.FriendsRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i121.CreateProfile>(
      () => _i121.CreateProfile(gh<_i70.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i121.GetAllUsersProfile>(
      () => _i121.GetAllUsersProfile(gh<_i70.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i121.GetSingleUserProfile>(
      () => _i121.GetSingleUserProfile(gh<_i70.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i121.GetUserRecentActivity>(
      () => _i121.GetUserRecentActivity(gh<_i70.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i121.GetVisitedUserRecentActivity>(
      () =>
          _i121.GetVisitedUserRecentActivity(gh<_i70.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i121.UpdateUserProfilePicture>(
      () => _i121.UpdateUserProfilePicture(gh<_i70.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i121.UpdateUserProfile>(
      () => _i121.UpdateUserProfile(gh<_i70.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i121.VisitUserProfile>(
      () => _i121.VisitUserProfile(gh<_i70.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i122.GetAllCharges>(
      () => _i122.GetAllCharges(gh<_i90.SubscriptionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i123.GetAllSubscriptions>(
      () => _i123.GetAllSubscriptions(gh<_i90.SubscriptionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i124.DownlineCubit>(
      () => _i124.DownlineCubit(getUserDownlines: gh<_i114.GetUserDownlines>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i125.NearbyCubit>(
      () => _i125.NearbyCubit(
        getNearbyProfiles: gh<_i105.GetNearbyProfiles>(),
        getNearbySettings: gh<_i104.GetNearbySettings>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i126.DisableAccount>(
      () => _i126.DisableAccount(gh<_i106.AccessRestrictionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i126.EnableAccount>(
      () => _i126.EnableAccount(gh<_i106.AccessRestrictionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i127.SendEmailVerifyOtp>(
      () => _i127.SendEmailVerifyOtp(gh<_i102.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i127.SendPhoneVerifyOtp>(
      () => _i127.SendPhoneVerifyOtp(gh<_i102.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i127.SendPasswordResetOtp>(
      () => _i127.SendPasswordResetOtp(gh<_i102.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i127.VerifyPhoneOtp>(
      () => _i127.VerifyPhoneOtp(gh<_i102.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i127.VerifyEmailOtp>(
      () => _i127.VerifyEmailOtp(gh<_i102.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i128.GetInterests>(
      () => _i128.GetInterests(gh<_i82.UserInterestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i128.UpdateUserInterest>(
      () => _i128.UpdateUserInterest(gh<_i82.UserInterestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i129.FriendsCubit>(
      () => _i129.FriendsCubit(
        getAllFriends: gh<_i119.GetAllFriends>(),
        getPendingFriends: gh<_i118.GetPendingFriends>(),
        processFriendRequest: gh<_i120.ProcessFriendRequest>(),
        sendFriendRequest: gh<_i117.SendFriendRequest>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i130.ProfileViewCubit>(
      () => _i130.ProfileViewCubit(
        visitUserProfile: gh<_i121.VisitUserProfile>(),
        getVisitedUserRecentActivity: gh<_i121.GetVisitedUserRecentActivity>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i131.BlockAccount>(
      () => _i131.BlockAccount(gh<_i112.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i131.GetBlockedUsers>(
      () => _i131.GetBlockedUsers(gh<_i112.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i131.UnBlockAccount>(
      () => _i131.UnBlockAccount(gh<_i112.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i132.NotificationCubit>(
      () => _i132.NotificationCubit(
          getAllNotifications: gh<_i116.GetAllNotifications>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i133.AccessRestrictionUseCase>(
      () => _i134.AccessRestrictionUseCaseImpl(
          gh<_i106.AccessRestrictionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i135.GiftCubit>(
      () => _i135.GiftCubit(
        getAllGifts: gh<_i97.GetAllGifts>(),
        getAllReceivedGifts: gh<_i95.GetAllReceivedGifts>(),
        redeemGift: gh<_i96.RedeemGift>(),
        deliverGift: gh<_i99.DeliverGift>(),
        sendGiftUseCase: gh<_i94.SendGiftUseCase>(),
        getAllSentGifts: gh<_i98.GetAllSentGifts>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i136.UpgradeUserRole>(
      () => _i136.UpgradeUserRole(gh<_i100.IdentityRoleRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i136.DowngradeUserRole>(
      () => _i136.DowngradeUserRole(gh<_i100.IdentityRoleRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i137.CreateProfileBoost>(
      () => _i137.CreateProfileBoost(gh<_i92.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i137.GetBoostedProfileByAdmin>(
      () =>
          _i137.GetBoostedProfileByAdmin(gh<_i92.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i137.GetMatchedProfileBoost>(
      () => _i137.GetMatchedProfileBoost(gh<_i92.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i137.GetTotalMatchCount>(
      () => _i137.GetTotalMatchCount(gh<_i92.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i138.ChargesCubit>(
      () => _i138.ChargesCubit(getAllCharges: gh<_i122.GetAllCharges>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i139.ChargesViewModel>(
      () => _i139.ChargesViewModel(gh<_i138.ChargesCubit>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i140.AuthenticationCubit>(
      () => _i140.AuthenticationCubit(
        getAllCountries: gh<_i81.GetAllCountries>(),
        getCountryDetails: gh<_i81.GetCountryDetails>(),
        upgradeUserRole: gh<_i136.UpgradeUserRole>(),
        downgradeUserRole: gh<_i136.DowngradeUserRole>(),
        registerUser: gh<_i45.RegisterUser>(),
        loginUser: gh<_i45.LoginUser>(),
        registerStaff: gh<_i45.RegisterStaff>(),
        changePassword: gh<_i45.ChangePassword>(),
        resetPassword: gh<_i45.ResetPassword>(),
        loginOAuth: gh<_i45.LoginOAuth>(),
        sendPasswordResetOtp: gh<_i127.SendPasswordResetOtp>(),
        sendEmailVerifyOtp: gh<_i127.SendEmailVerifyOtp>(),
        sendPhoneVerifyOtp: gh<_i127.SendPhoneVerifyOtp>(),
        verifyPhoneOtp: gh<_i127.VerifyPhoneOtp>(),
        verifyEmailOtp: gh<_i127.VerifyEmailOtp>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i141.SubscriptionCubit>(
      () => _i141.SubscriptionCubit(
          getAllSubscriptions: gh<_i123.GetAllSubscriptions>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i142.FeedsCubit>(
      () => _i142.FeedsCubit(
          getMatchedProfileBoost: gh<_i137.GetMatchedProfileBoost>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i143.ProfileCubit>(
      () => _i143.ProfileCubit(
        disableAccount: gh<_i126.DisableAccount>(),
        enableAccount: gh<_i126.EnableAccount>(),
        getAddressFromLocationCoordinate:
            gh<_i87.GetAddressFromLocationCoordinate>(),
        getLocationCoordinateFromAddress:
            gh<_i87.GetLocationCoordinateFromAddress>(),
        createUpdateBankAccount: gh<_i80.CreateUpdateBankAccount>(),
        getUserBankAccount: gh<_i80.GetUserBankAccount>(),
        getInterests: gh<_i128.GetInterests>(),
        updateUserInterest: gh<_i128.UpdateUserInterest>(),
        blockAccount: gh<_i131.BlockAccount>(),
        getBlockedUsers: gh<_i131.GetBlockedUsers>(),
        unBlockAccount: gh<_i131.UnBlockAccount>(),
        createProfileBoost: gh<_i137.CreateProfileBoost>(),
        getBoostedProfileByAdmin: gh<_i137.GetBoostedProfileByAdmin>(),
        getTotalMatchCount: gh<_i137.GetTotalMatchCount>(),
        createProfile: gh<_i121.CreateProfile>(),
        getAllUsersProfile: gh<_i121.GetAllUsersProfile>(),
        getSingleUserProfile: gh<_i121.GetSingleUserProfile>(),
        getUserRecentActivity: gh<_i121.GetUserRecentActivity>(),
        updateUserProfilePicture: gh<_i121.UpdateUserProfilePicture>(),
        updateUserProfile: gh<_i121.UpdateUserProfile>(),
        findUserByAdminEmail: gh<_i69.FindUserByAdminEmail>(),
        findUserByAdminUsername: gh<_i69.FindUserByAdminUsername>(),
        searchUserByCustomer: gh<_i69.SearchUserByCustomer>(),
        getUserTransactions: gh<_i115.GetUserTransactions>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i144.FeedsViewModel>(
      () => _i144.FeedsViewModel(gh<_i142.FeedsCubit>()),
      registerFor: {_prod},
    );
    return this;
  }
}
