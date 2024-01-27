// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:zheeta/app/api/api_manager.dart' as _i5;
import 'package:zheeta/app/api/dio_module.dart' as _i4;
import 'package:zheeta/app/api/prod/api_manager_impl.dart' as _i6;
import 'package:zheeta/app/router/app_router.dart' as _i3;
import 'package:zheeta/authentication/data/datasource/country_datasource.dart'
    as _i7;
import 'package:zheeta/authentication/data/datasource/identity_role_datasource.dart'
    as _i19;
import 'package:zheeta/authentication/data/datasource/prod/country_datasource_impl.dart'
    as _i8;
import 'package:zheeta/authentication/data/datasource/prod/identity_role_datasource_impl.dart'
    as _i20;
import 'package:zheeta/authentication/data/datasource/prod/user_auth_datasource_impl.dart'
    as _i44;
import 'package:zheeta/authentication/data/datasource/prod/user_otp_datasource_impl.dart'
    as _i62;
import 'package:zheeta/authentication/data/datasource/user_auth_datasource.dart'
    as _i43;
import 'package:zheeta/authentication/data/datasource/user_otp_datasource.dart'
    as _i61;
import 'package:zheeta/authentication/data/repository/prod/country_repository_impl.dart'
    as _i10;
import 'package:zheeta/authentication/data/repository/prod/identity_role_repository_impl.dart'
    as _i22;
import 'package:zheeta/authentication/data/repository/prod/user_auth_repository_impl.dart'
    as _i46;
import 'package:zheeta/authentication/data/repository/prod/user_otp_repository_impl.dart'
    as _i64;
import 'package:zheeta/authentication/domain/repository/country_repository.dart'
    as _i9;
import 'package:zheeta/authentication/domain/repository/identity_role_repository.dart'
    as _i21;
import 'package:zheeta/authentication/domain/repository/user_auth_repository.dart'
    as _i45;
import 'package:zheeta/authentication/domain/repository/user_otp_repository.dart'
    as _i63;
import 'package:zheeta/authentication/domain/usecase/country_usecase.dart'
    as _i11;
import 'package:zheeta/authentication/domain/usecase/identity_role_usecase.dart'
    as _i23;
import 'package:zheeta/authentication/domain/usecase/prod/country_usecase_impl.dart'
    as _i12;
import 'package:zheeta/authentication/domain/usecase/prod/identity_role_usecase_impl.dart'
    as _i24;
import 'package:zheeta/authentication/domain/usecase/prod/user_auth_usecase_impl.dart'
    as _i48;
import 'package:zheeta/authentication/domain/usecase/prod/user_otp_usecase_impl.dart'
    as _i66;
import 'package:zheeta/authentication/domain/usecase/user_auth_usecase.dart'
    as _i47;
import 'package:zheeta/authentication/domain/usecase/user_otp_usecase.dart'
    as _i65;
import 'package:zheeta/discover/data/datasource/friend_request_datasource.dart'
    as _i13;
import 'package:zheeta/discover/data/datasource/match_criteria_datasource.dart'
    as _i31;
import 'package:zheeta/discover/data/datasource/prod/friend_request_datasource_impl.dart'
    as _i14;
import 'package:zheeta/discover/data/datasource/prod/match_criteria_datasource_impl.dart'
    as _i32;
import 'package:zheeta/discover/data/repository/prod/friend_request_repository_impl.dart'
    as _i16;
import 'package:zheeta/discover/data/repository/prod/match_criteria_repository_impl.dart'
    as _i34;
import 'package:zheeta/discover/domain/repository/friend_request_repository.dart'
    as _i15;
import 'package:zheeta/discover/domain/repository/match_criteria_repository.dart'
    as _i33;
import 'package:zheeta/discover/domain/usecase/friend_request_usecase.dart'
    as _i17;
import 'package:zheeta/discover/domain/usecase/match_criteria_usecase.dart'
    as _i35;
import 'package:zheeta/discover/domain/usecase/prod/friend_request_usecase_impl.dart'
    as _i18;
import 'package:zheeta/discover/domain/usecase/prod/match_criteria_usecase_impl.dart'
    as _i36;
import 'package:zheeta/notification/data/datasource/notification_datasource.dart'
    as _i37;
import 'package:zheeta/notification/data/datasource/prod/notification_datasource_impl.dart'
    as _i38;
import 'package:zheeta/notification/data/repository/prod/notification_repository_impl.dart'
    as _i40;
import 'package:zheeta/notification/domain/repository/notification_repository.dart'
    as _i39;
import 'package:zheeta/notification/domain/usecase/notification_usecase.dart'
    as _i41;
import 'package:zheeta/notification/domain/usecase/prod/notification_usecase_impl.dart'
    as _i42;
import 'package:zheeta/profile/data/datasource/access_restriction_datasource.dart'
    as _i97;
import 'package:zheeta/profile/data/datasource/location_datasource.dart'
    as _i25;
import 'package:zheeta/profile/data/datasource/prod/access_restriction_datasource_impl.dart'
    as _i98;
import 'package:zheeta/profile/data/datasource/prod/location_datasource_impl.dart'
    as _i26;
import 'package:zheeta/profile/data/datasource/prod/user_bank_account_datasource_impl.dart'
    as _i50;
import 'package:zheeta/profile/data/datasource/prod/user_interest_datasource_impl.dart'
    as _i56;
import 'package:zheeta/profile/data/datasource/prod/user_profile_access_datasource_impl.dart'
    as _i68;
import 'package:zheeta/profile/data/datasource/prod/user_profile_boost_datasource_impl.dart'
    as _i74;
import 'package:zheeta/profile/data/datasource/prod/user_profile_datasource_impl.dart'
    as _i80;
import 'package:zheeta/profile/data/datasource/prod/user_search_datasource_impl.dart'
    as _i86;
import 'package:zheeta/profile/data/datasource/prod/user_transaction_datasource_impl.dart'
    as _i92;
import 'package:zheeta/profile/data/datasource/user_bank_account_datasource.dart'
    as _i49;
import 'package:zheeta/profile/data/datasource/user_interest_datasource.dart'
    as _i55;
import 'package:zheeta/profile/data/datasource/user_profile_access_datasource.dart'
    as _i67;
import 'package:zheeta/profile/data/datasource/user_profile_boost_datasource.dart'
    as _i73;
import 'package:zheeta/profile/data/datasource/user_profile_datasource.dart'
    as _i79;
import 'package:zheeta/profile/data/datasource/user_search_datasource.dart'
    as _i85;
import 'package:zheeta/profile/data/datasource/user_transaction_datasource.dart'
    as _i91;
import 'package:zheeta/profile/data/repository/prod/access_restriction_repository_impl.dart'
    as _i100;
import 'package:zheeta/profile/data/repository/prod/location_repository_impl.dart'
    as _i28;
import 'package:zheeta/profile/data/repository/prod/user_bank_account_repository_impl.dart'
    as _i52;
import 'package:zheeta/profile/data/repository/prod/user_interest_repository_impl.dart'
    as _i58;
import 'package:zheeta/profile/data/repository/prod/user_profile_access_repository_impl.dart'
    as _i70;
import 'package:zheeta/profile/data/repository/prod/user_profile_boost_repository_impl.dart'
    as _i76;
import 'package:zheeta/profile/data/repository/prod/user_profile_repository_impl.dart'
    as _i82;
import 'package:zheeta/profile/data/repository/prod/user_search_repository_impl.dart'
    as _i88;
import 'package:zheeta/profile/data/repository/prod/user_transaction_repository_impl.dart'
    as _i94;
import 'package:zheeta/profile/domain/repository/access_restriction_repository.dart'
    as _i99;
import 'package:zheeta/profile/domain/repository/location_repository.dart'
    as _i27;
import 'package:zheeta/profile/domain/repository/user_bank_account_repository.dart'
    as _i51;
import 'package:zheeta/profile/domain/repository/user_interest_repository.dart'
    as _i57;
import 'package:zheeta/profile/domain/repository/user_profile_access_repository.dart'
    as _i69;
import 'package:zheeta/profile/domain/repository/user_profile_boost_repository.dart'
    as _i75;
import 'package:zheeta/profile/domain/repository/user_profile_repository.dart'
    as _i81;
import 'package:zheeta/profile/domain/repository/user_search_repository.dart'
    as _i87;
import 'package:zheeta/profile/domain/repository/user_transaction_repository.dart'
    as _i93;
import 'package:zheeta/profile/domain/usecase/access_restriction_usecase.dart'
    as _i101;
import 'package:zheeta/profile/domain/usecase/location_usecase.dart' as _i29;
import 'package:zheeta/profile/domain/usecase/prod/access_restriction_usecase_impl.dart'
    as _i102;
import 'package:zheeta/profile/domain/usecase/prod/location_usecase_impl.dart'
    as _i30;
import 'package:zheeta/profile/domain/usecase/prod/user_bank_account_usecase_impl.dart'
    as _i54;
import 'package:zheeta/profile/domain/usecase/prod/user_interest_usecase_impl.dart'
    as _i60;
import 'package:zheeta/profile/domain/usecase/prod/user_profile_access_usecase_impl.dart'
    as _i72;
import 'package:zheeta/profile/domain/usecase/prod/user_profile_boost_usecase_impl.dart'
    as _i78;
import 'package:zheeta/profile/domain/usecase/prod/user_profile_usecase_impl.dart'
    as _i84;
import 'package:zheeta/profile/domain/usecase/prod/user_search_usecase_impl.dart'
    as _i90;
import 'package:zheeta/profile/domain/usecase/prod/user_transaction_usecase_impl.dart'
    as _i96;
import 'package:zheeta/profile/domain/usecase/user_bank_account_usecase.dart'
    as _i53;
import 'package:zheeta/profile/domain/usecase/user_interest_usecase.dart'
    as _i59;
import 'package:zheeta/profile/domain/usecase/user_profile_access_usecase.dart'
    as _i71;
import 'package:zheeta/profile/domain/usecase/user_profile_boost_usecase.dart'
    as _i77;
import 'package:zheeta/profile/domain/usecase/user_profile_usecase.dart'
    as _i83;
import 'package:zheeta/profile/domain/usecase/user_search_usecase.dart' as _i89;
import 'package:zheeta/profile/domain/usecase/user_transaction_usecase.dart'
    as _i95;

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
    gh.factory<_i3.AppRouter>(() => _i3.AppRouter());
    gh.factory<_i4.DioModule>(() => _i4.DioModule());
    gh.factory<_i5.ApiManager>(
      () => _i6.ApiManagerImpl(gh<_i4.DioModule>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i7.CountryDataSource>(
      () => _i8.CountryDatasourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i9.CountryRepository>(
      () => _i10.CountryRepositoryImpl(gh<_i7.CountryDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i11.CountryUseCase>(
      () => _i12.CountryUseCaseImpl(gh<_i9.CountryRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i13.FriendRequestDataSource>(
      _i14.FriendRequestDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i15.FriendRequestRepository>(
      () =>
          _i16.FriendRequestRepositoryImpl(gh<_i13.FriendRequestDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i17.FriendRequestUseCase>(
      () => _i18.FriendRequestUseCaseImpl(gh<_i15.FriendRequestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i19.IdentityRoleDataSource>(
      () => _i20.IdentityRoleDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i21.IdentityRoleRepository>(
      () => _i22.IdentityRoleRepositoryImpl(gh<_i19.IdentityRoleDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i23.IdentityRoleUseCase>(
      () => _i24.IdentityRoleUseCaseImpl(gh<_i21.IdentityRoleRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i25.LocationDataSource>(
      _i26.LocationDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i27.LocationRepository>(
      () => _i28.LocationRepositoryImpl(gh<_i25.LocationDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i29.LocationUseCase>(
      () => _i30.LocationUseCaseImpl(gh<_i27.LocationRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i31.MatchCriteriaDataSource>(
      _i32.MatchCriteriaDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i33.MatchCriteriaRepository>(
      () =>
          _i34.MatchCriteriaRepositoryImpl(gh<_i31.MatchCriteriaDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i35.MatchCriteriaUseCase>(
      () => _i36.MatchCriteriaUseCaseImpl(gh<_i33.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i37.NotificationDataSource>(
      _i38.NotificationDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i39.NotificationRepository>(
      () => _i40.NotificationRepositoryImpl(gh<_i37.NotificationDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i41.NotificationUseCase>(
      () => _i42.NotificationUseCaseImpl(gh<_i39.NotificationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i43.UserAuthDataSource>(
      () => _i44.UserAuthDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i45.UserAuthRepository>(
      () => _i46.UserAuthRepositoryImpl(gh<_i43.UserAuthDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i47.UserAuthUseCase>(
      () => _i48.UserAuthUseCaseImpl(gh<_i45.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i49.UserBankAccountDataSource>(
      _i50.UserBankAccountDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i51.UserBankAccountRepository>(
      () => _i52.UserBankAccountRepositoryImpl(
          gh<_i49.UserBankAccountDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i53.UserBankAccountUseCase>(
      () =>
          _i54.UserBankAccountUseCaseImpl(gh<_i51.UserBankAccountRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i55.UserInterestDataSource>(
      _i56.UserInterestDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i57.UserInterestRepository>(
      () => _i58.UserInterestRepositoryImpl(gh<_i55.UserInterestDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i59.UserInterestUseCase>(
      () => _i60.UserInterestUseCaseImpl(gh<_i57.UserInterestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i61.UserOtpDataSource>(
      () => _i62.UserOtpDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i63.UserOtpRepository>(
      () => _i64.UserOtpRepositoryImpl(gh<_i61.UserOtpDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i65.UserOtpUseCase>(
      () => _i66.UserOtpUseCaseImpl(gh<_i63.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i67.UserProfileAccessDataSource>(
      _i68.UserProfileAccessDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i69.UserProfileAccessRepository>(
      () => _i70.UserProfileAccessRepositoryImpl(
          gh<_i67.UserProfileAccessDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i71.UserProfileAccessUseCase>(
      () => _i72.UserProfileAccessUseCaseImpl(
          gh<_i69.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i73.UserProfileBoostDataSource>(
      _i74.UserProfileBoostDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i75.UserProfileBoostRepository>(
      () => _i76.UserProfileBoostRepositoryImpl(
          gh<_i73.UserProfileBoostDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i77.UserProfileBoostUseCase>(
      () => _i78.UserProfileBoostUseCaseImpl(
          gh<_i75.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i79.UserProfileDataSource>(
      _i80.UserProfileDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i81.UserProfileRepository>(
      () => _i82.UserProfileRepositoryImpl(gh<_i79.UserProfileDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i83.UserProfileUseCase>(
      () => _i84.UserProfileUseCaseImpl(gh<_i81.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i85.UserSearchDataSource>(
      _i86.UserSearchDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i87.UserSearchRepository>(
      () => _i88.UserSearchRepositorImpl(gh<_i85.UserSearchDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i89.UserSearchUseCase>(
      () => _i90.UserSearchUseCaseImpl(gh<_i87.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i91.UserTransactionDataSource>(
      _i92.UserTransactionDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i93.UserTransactionRepository>(
      () => _i94.UserTransactionRepositoryImpl(
          gh<_i91.UserTransactionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i95.UserTransactionUseCase>(
      () =>
          _i96.UserTransactionUseCaseImpl(gh<_i93.UserTransactionRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i97.AccessRestrictionDataSource>(
      _i98.AccessRestrictionDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i99.AccessRestrictionRepository>(
      () => _i100.AccessRestrictionRepositoryImpl(
          gh<_i97.AccessRestrictionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i101.AccessRestrictionUseCase>(
      () => _i102.AccessRestrictionUseCaseImpl(
          gh<_i99.AccessRestrictionRepository>()),
      registerFor: {_prod},
    );
    return this;
  }
}
