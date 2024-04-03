// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:zheeta/app/api/api_manager.dart' as _i6;
import 'package:zheeta/app/api/api_manager_refactored.dart' as _i3;
import 'package:zheeta/app/api/dio_module.dart' as _i5;
import 'package:zheeta/app/api/prod/api_manager_impl.dart' as _i7;
import 'package:zheeta/app/router/app_router.dart' as _i4;
import 'package:zheeta/authentication/data/datasource/country_datasource.dart'
    as _i8;
import 'package:zheeta/authentication/data/datasource/identity_role_datasource.dart'
    as _i19;
import 'package:zheeta/authentication/data/datasource/prod/country_datasource_impl.dart'
    as _i9;
import 'package:zheeta/authentication/data/datasource/prod/identity_role_datasource_impl.dart'
    as _i20;
import 'package:zheeta/authentication/data/datasource/prod/user_auth_datasource_impl.dart'
    as _i41;
import 'package:zheeta/authentication/data/datasource/prod/user_otp_datasource_impl.dart'
    as _i53;
import 'package:zheeta/authentication/data/datasource/user_auth_datasource.dart'
    as _i40;
import 'package:zheeta/authentication/data/datasource/user_otp_datasource.dart'
    as _i52;
import 'package:zheeta/authentication/data/repository/prod/country_repository_impl.dart'
    as _i11;
import 'package:zheeta/authentication/data/repository/prod/identity_role_repository_impl.dart'
    as _i22;
import 'package:zheeta/authentication/data/repository/prod/user_auth_repository_impl.dart'
    as _i43;
import 'package:zheeta/authentication/data/repository/prod/user_otp_repository_impl.dart'
    as _i55;
import 'package:zheeta/authentication/domain/repository/country_repository.dart'
    as _i10;
import 'package:zheeta/authentication/domain/repository/identity_role_repository.dart'
    as _i21;
import 'package:zheeta/authentication/domain/repository/user_auth_repository.dart'
    as _i42;
import 'package:zheeta/authentication/domain/repository/user_otp_repository.dart'
    as _i54;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/country/country_usecases.dart'
    as _i18;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/identity/identity_usecases.dart'
    as _i39;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/user_auth/user_auth_usecases.dart'
    as _i83;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/user_otp/user_otp_usecases.dart'
    as _i76;
import 'package:zheeta/authentication/presentation/bloc/authentication_bloc.dart'
    as _i84;
import 'package:zheeta/discover/data/datasource/friend_request_datasource.dart'
    as _i12;
import 'package:zheeta/discover/data/datasource/match_criteria_datasource.dart'
    as _i27;
import 'package:zheeta/discover/data/datasource/prod/friend_request_datasource_impl.dart'
    as _i13;
import 'package:zheeta/discover/data/datasource/prod/match_criteria_datasource_impl.dart'
    as _i28;
import 'package:zheeta/discover/data/repository/prod/friend_request_repository_impl.dart'
    as _i15;
import 'package:zheeta/discover/data/repository/prod/match_criteria_repository_impl.dart'
    as _i30;
import 'package:zheeta/discover/domain/repository/friend_request_repository.dart'
    as _i14;
import 'package:zheeta/discover/domain/repository/match_criteria_repository.dart'
    as _i29;
import 'package:zheeta/discover/domain/usecase/friend_request_usecase.dart'
    as _i16;
import 'package:zheeta/discover/domain/usecase/match_criteria_usecase.dart'
    as _i31;
import 'package:zheeta/discover/domain/usecase/prod/friend_request_usecase_impl.dart'
    as _i17;
import 'package:zheeta/discover/domain/usecase/prod/match_criteria_usecase_impl.dart'
    as _i32;
import 'package:zheeta/notification/data/datasource/notification_datasource.dart'
    as _i33;
import 'package:zheeta/notification/data/datasource/prod/notification_datasource_impl.dart'
    as _i34;
import 'package:zheeta/notification/data/repository/prod/notification_repository_impl.dart'
    as _i36;
import 'package:zheeta/notification/domain/repository/notification_repository.dart'
    as _i35;
import 'package:zheeta/notification/domain/usecase/notification_usecase.dart'
    as _i37;
import 'package:zheeta/notification/domain/usecase/prod/notification_usecase_impl.dart'
    as _i38;
import 'package:zheeta/profile/data/datasource/access_restriction_datasource.dart'
    as _i77;
import 'package:zheeta/profile/data/datasource/location_datasource.dart'
    as _i23;
import 'package:zheeta/profile/data/datasource/prod/access_restriction_datasource_impl.dart'
    as _i78;
import 'package:zheeta/profile/data/datasource/prod/location_datasource_impl.dart'
    as _i24;
import 'package:zheeta/profile/data/datasource/prod/user_bank_account_datasource_impl.dart'
    as _i45;
import 'package:zheeta/profile/data/datasource/prod/user_interest_datasource_impl.dart'
    as _i49;
import 'package:zheeta/profile/data/datasource/prod/user_profile_access_datasource_impl.dart'
    as _i57;
import 'package:zheeta/profile/data/datasource/prod/user_profile_boost_datasource_impl.dart'
    as _i61;
import 'package:zheeta/profile/data/datasource/prod/user_profile_datasource_impl.dart'
    as _i65;
import 'package:zheeta/profile/data/datasource/prod/user_search_datasource_impl.dart'
    as _i69;
import 'package:zheeta/profile/data/datasource/prod/user_transaction_datasource_impl.dart'
    as _i73;
import 'package:zheeta/profile/data/datasource/user_bank_account_datasource.dart'
    as _i44;
import 'package:zheeta/profile/data/datasource/user_interest_datasource.dart'
    as _i48;
import 'package:zheeta/profile/data/datasource/user_profile_access_datasource.dart'
    as _i56;
import 'package:zheeta/profile/data/datasource/user_profile_boost_datasource.dart'
    as _i60;
import 'package:zheeta/profile/data/datasource/user_profile_datasource.dart'
    as _i64;
import 'package:zheeta/profile/data/datasource/user_search_datasource.dart'
    as _i68;
import 'package:zheeta/profile/data/datasource/user_transaction_datasource.dart'
    as _i72;
import 'package:zheeta/profile/data/repository/prod/access_restriction_repository_impl.dart'
    as _i80;
import 'package:zheeta/profile/data/repository/prod/location_repository_impl.dart'
    as _i26;
import 'package:zheeta/profile/data/repository/prod/user_bank_account_repository_impl.dart'
    as _i47;
import 'package:zheeta/profile/data/repository/prod/user_interest_repository_impl.dart'
    as _i51;
import 'package:zheeta/profile/data/repository/prod/user_profile_access_repository_impl.dart'
    as _i59;
import 'package:zheeta/profile/data/repository/prod/user_profile_boost_repository_impl.dart'
    as _i63;
import 'package:zheeta/profile/data/repository/prod/user_profile_repository_impl.dart'
    as _i67;
import 'package:zheeta/profile/data/repository/prod/user_search_repository_impl.dart'
    as _i71;
import 'package:zheeta/profile/data/repository/prod/user_transaction_repository_impl.dart'
    as _i75;
import 'package:zheeta/profile/domain/repository/access_restriction_repository.dart'
    as _i79;
import 'package:zheeta/profile/domain/repository/location_repository.dart'
    as _i25;
import 'package:zheeta/profile/domain/repository/user_bank_account_repository.dart'
    as _i46;
import 'package:zheeta/profile/domain/repository/user_interest_repository.dart'
    as _i50;
import 'package:zheeta/profile/domain/repository/user_profile_access_repository.dart'
    as _i58;
import 'package:zheeta/profile/domain/repository/user_profile_boost_repository.dart'
    as _i62;
import 'package:zheeta/profile/domain/repository/user_profile_repository.dart'
    as _i66;
import 'package:zheeta/profile/domain/repository/user_search_repository.dart'
    as _i70;
import 'package:zheeta/profile/domain/repository/user_transaction_repository.dart'
    as _i74;
import 'package:zheeta/profile/domain/usecase/access_restriction_usecase.dart'
    as _i81;
import 'package:zheeta/profile/domain/usecase/prod/access_restriction_usecase_impl.dart'
    as _i82;

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
    gh.factory<_i3.Api>(
      () => _i3.Api(),
      registerFor: {_prod},
    );
    gh.factory<_i4.AppRouter>(() => _i4.AppRouter());
    gh.factory<_i5.DioModule>(() => _i5.DioModule());
    gh.factory<_i6.ApiManager>(
      () => _i7.ApiManagerImpl(gh<_i5.DioModule>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i8.CountryDataSource>(
      () => _i9.CountryDataSourceImpl(
        gh<_i6.ApiManager>(),
        gh<_i3.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i10.CountryRepository>(
      () => _i11.CountryRepositoryImpl(gh<_i8.CountryDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i12.FriendRequestDataSource>(
      _i13.FriendRequestDataSourceImpl(
        gh<_i6.ApiManager>(),
        gh<_i3.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i14.FriendRequestRepository>(
      () =>
          _i15.FriendRequestRepositoryImpl(gh<_i12.FriendRequestDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i16.FriendRequestUseCase>(
      () => _i17.FriendRequestUseCaseImpl(gh<_i14.FriendRequestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i18.GetAllCountries>(
      () => _i18.GetAllCountries(gh<_i10.CountryRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i18.GetCountryDetails>(
      () => _i18.GetCountryDetails(gh<_i10.CountryRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i19.IdentityRoleDataSource>(
      () => _i20.IdentityRoleDataSourceImpl(
        gh<_i6.ApiManager>(),
        gh<_i3.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i21.IdentityRoleRepository>(
      () => _i22.IdentityRoleRepositoryImpl(gh<_i19.IdentityRoleDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i23.LocationDataSource>(
      _i24.LocationDataSourceImpl(
        gh<_i6.ApiManager>(),
        gh<_i3.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i25.LocationRepository>(
      () => _i26.LocationRepositoryImpl(gh<_i23.LocationDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i27.MatchCriteriaDataSource>(
      _i28.MatchCriteriaDataSourceImpl(
        gh<_i6.ApiManager>(),
        gh<_i3.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i29.MatchCriteriaRepository>(
      () =>
          _i30.MatchCriteriaRepositoryImpl(gh<_i27.MatchCriteriaDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i31.MatchCriteriaUseCase>(
      () => _i32.MatchCriteriaUseCaseImpl(gh<_i29.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i33.NotificationDataSource>(
      _i34.NotificationDataSourceImpl(gh<_i6.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i35.NotificationRepository>(
      () => _i36.NotificationRepositoryImpl(gh<_i33.NotificationDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i37.NotificationUseCase>(
      () => _i38.NotificationUseCaseImpl(gh<_i35.NotificationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i39.UpgradeUserRole>(
      () => _i39.UpgradeUserRole(gh<_i21.IdentityRoleRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i40.UserAuthDataSource>(
      () => _i41.UserAuthDataSourceImpl(
        gh<_i6.ApiManager>(),
        gh<_i3.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i42.UserAuthRepository>(
      () => _i43.UserAuthRepositoryImpl(gh<_i40.UserAuthDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i44.UserBankAccountDataSource>(
      _i45.UserBankAccountDataSourceImpl(
        gh<_i6.ApiManager>(),
        gh<_i3.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i46.UserBankAccountRepository>(
      () => _i47.UserBankAccountRepositoryImpl(
          gh<_i44.UserBankAccountDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i48.UserInterestDataSource>(
      _i49.UserInterestDataSourceImpl(
        gh<_i6.ApiManager>(),
        gh<_i3.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i50.UserInterestRepository>(
      () => _i51.UserInterestRepositoryImpl(gh<_i48.UserInterestDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i52.UserOtpDataSource>(
      () => _i53.UserOtpDataSourceImpl(
        gh<_i6.ApiManager>(),
        gh<_i3.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i54.UserOtpRepository>(
      () => _i55.UserOtpRepositoryImpl(gh<_i52.UserOtpDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i56.UserProfileAccessDataSource>(
      _i57.UserProfileAccessDataSourceImpl(
        gh<_i6.ApiManager>(),
        gh<_i3.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i58.UserProfileAccessRepository>(
      () => _i59.UserProfileAccessRepositoryImpl(
          gh<_i56.UserProfileAccessDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i60.UserProfileBoostDataSource>(
      _i61.UserProfileBoostDataSourceImpl(
        gh<_i6.ApiManager>(),
        gh<_i3.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i62.UserProfileBoostRepository>(
      () => _i63.UserProfileBoostRepositoryImpl(
          gh<_i60.UserProfileBoostDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i64.UserProfileDataSource>(
      _i65.UserProfileDataSourceImpl(
        gh<_i6.ApiManager>(),
        gh<_i3.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i66.UserProfileRepository>(
      () => _i67.UserProfileRepositoryImpl(gh<_i64.UserProfileDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i68.UserSearchDataSource>(
      _i69.UserSearchDataSourceImpl(
        gh<_i6.ApiManager>(),
        gh<_i3.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i70.UserSearchRepository>(
      () => _i71.UserSearchRepositorImpl(gh<_i68.UserSearchDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i72.UserTransactionDataSource>(
      _i73.UserTransactionDataSourceImpl(
        gh<_i6.ApiManager>(),
        gh<_i3.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i74.UserTransactionRepository>(
      () => _i75.UserTransactionRepositoryImpl(
          gh<_i72.UserTransactionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i76.VerifyEmailOtp>(
      () => _i76.VerifyEmailOtp(gh<_i54.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i76.VerifyPhoneOtp>(
      () => _i76.VerifyPhoneOtp(gh<_i54.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i77.AccessRestrictionDataSource>(
      _i78.AccessRestrictionDataSourceImpl(
        gh<_i6.ApiManager>(),
        gh<_i3.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i79.AccessRestrictionRepository>(
      () => _i80.AccessRestrictionRepositoryImpl(
          gh<_i77.AccessRestrictionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i81.AccessRestrictionUseCase>(
      () => _i82.AccessRestrictionUseCaseImpl(
          gh<_i79.AccessRestrictionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i83.ChangePassword>(
      () => _i83.ChangePassword(gh<_i42.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i39.DowngradeUserRole>(
      () => _i39.DowngradeUserRole(gh<_i21.IdentityRoleRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i83.LoginOAuth>(
      () => _i83.LoginOAuth(gh<_i42.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i83.LoginUser>(
      () => _i83.LoginUser(gh<_i42.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i83.RegisterStaff>(
      () => _i83.RegisterStaff(gh<_i42.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i83.RegisterUser>(
      () => _i83.RegisterUser(gh<_i42.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i83.ResetPassword>(
      () => _i83.ResetPassword(gh<_i42.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i76.SendEmailVerifyOtp>(
      () => _i76.SendEmailVerifyOtp(gh<_i54.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i76.SendPasswordResetOtp>(
      () => _i76.SendPasswordResetOtp(gh<_i54.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i76.SendPhoneVerifyOtp>(
      () => _i76.SendPhoneVerifyOtp(gh<_i54.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i84.AuthenticationCubit>(
      () => _i84.AuthenticationCubit(
        getAllCountries: gh<_i18.GetAllCountries>(),
        getCountryDetails: gh<_i18.GetCountryDetails>(),
        upgradeUserRole: gh<_i39.UpgradeUserRole>(),
        downgradeUserRole: gh<_i39.DowngradeUserRole>(),
        registerUser: gh<_i83.RegisterUser>(),
        loginUser: gh<_i83.LoginUser>(),
        registerStaff: gh<_i83.RegisterStaff>(),
        changePassword: gh<_i83.ChangePassword>(),
        resetPassword: gh<_i83.ResetPassword>(),
        loginOAuth: gh<_i83.LoginOAuth>(),
        sendPasswordResetOtp: gh<_i76.SendPasswordResetOtp>(),
      ),
      registerFor: {_prod},
    );
    return this;
  }
}
