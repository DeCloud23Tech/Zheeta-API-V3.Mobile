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
    as _i13;
import 'package:zheeta/authentication/data/datasource/prod/country_datasource_impl.dart'
    as _i8;
import 'package:zheeta/authentication/data/datasource/prod/identity_role_datasource_impl.dart'
    as _i14;
import 'package:zheeta/authentication/data/datasource/prod/user_auth_datasource_impl.dart'
    as _i32;
import 'package:zheeta/authentication/data/datasource/prod/user_otp_datasource_impl.dart'
    as _i50;
import 'package:zheeta/authentication/data/datasource/user_auth_datasource.dart'
    as _i31;
import 'package:zheeta/authentication/data/datasource/user_otp_datasource.dart'
    as _i49;
import 'package:zheeta/authentication/data/repository/prod/country_repository_impl.dart'
    as _i10;
import 'package:zheeta/authentication/data/repository/prod/identity_role_repository_impl.dart'
    as _i16;
import 'package:zheeta/authentication/data/repository/prod/user_auth_repository_impl.dart'
    as _i34;
import 'package:zheeta/authentication/data/repository/prod/user_otp_repository_impl.dart'
    as _i52;
import 'package:zheeta/authentication/domain/repository/country_repository.dart'
    as _i9;
import 'package:zheeta/authentication/domain/repository/identity_role_repository.dart'
    as _i15;
import 'package:zheeta/authentication/domain/repository/user_auth_repository.dart'
    as _i33;
import 'package:zheeta/authentication/domain/repository/user_otp_repository.dart'
    as _i51;
import 'package:zheeta/authentication/domain/usecase/country_usecase.dart'
    as _i11;
import 'package:zheeta/authentication/domain/usecase/identity_role_usecase.dart'
    as _i17;
import 'package:zheeta/authentication/domain/usecase/prod/country_usecase_impl.dart'
    as _i12;
import 'package:zheeta/authentication/domain/usecase/prod/identity_role_usecase_impl.dart'
    as _i18;
import 'package:zheeta/authentication/domain/usecase/prod/user_auth_usecase_impl.dart'
    as _i36;
import 'package:zheeta/authentication/domain/usecase/prod/user_otp_usecase_impl.dart'
    as _i54;
import 'package:zheeta/authentication/domain/usecase/user_auth_usecase.dart'
    as _i35;
import 'package:zheeta/authentication/domain/usecase/user_otp_usecase.dart'
    as _i53;
import 'package:zheeta/discover/data/datasource/match_criteria_datasource.dart'
    as _i25;
import 'package:zheeta/discover/data/datasource/prod/match_criteria_datasource_impl.dart'
    as _i26;
import 'package:zheeta/discover/data/repository/prod/match_criteria_repository_impl.dart'
    as _i28;
import 'package:zheeta/discover/domain/repository/match_criteria_repository.dart'
    as _i27;
import 'package:zheeta/discover/domain/usecase/match_criteria_usecase.dart'
    as _i29;
import 'package:zheeta/discover/domain/usecase/prod/match_criteria_usecase_impl.dart'
    as _i30;
import 'package:zheeta/profile/data/datasource/access_restriction_datasource.dart'
    as _i85;
import 'package:zheeta/profile/data/datasource/location_datasource.dart'
    as _i19;
import 'package:zheeta/profile/data/datasource/prod/access_restriction_datasource_impl.dart'
    as _i86;
import 'package:zheeta/profile/data/datasource/prod/location_datasource_impl.dart'
    as _i20;
import 'package:zheeta/profile/data/datasource/prod/user_bank_account_datasource_impl.dart'
    as _i38;
import 'package:zheeta/profile/data/datasource/prod/user_interest_datasource_impl.dart'
    as _i44;
import 'package:zheeta/profile/data/datasource/prod/user_profile_access_datasource_impl.dart'
    as _i56;
import 'package:zheeta/profile/data/datasource/prod/user_profile_boost_datasource_impl.dart'
    as _i62;
import 'package:zheeta/profile/data/datasource/prod/user_profile_datasource_impl.dart'
    as _i68;
import 'package:zheeta/profile/data/datasource/prod/user_search_datasource_impl.dart'
    as _i74;
import 'package:zheeta/profile/data/datasource/prod/user_transaction_datasource_impl.dart'
    as _i80;
import 'package:zheeta/profile/data/datasource/user_bank_account_datasource.dart'
    as _i37;
import 'package:zheeta/profile/data/datasource/user_interest_datasource.dart'
    as _i43;
import 'package:zheeta/profile/data/datasource/user_profile_access_datasource.dart'
    as _i55;
import 'package:zheeta/profile/data/datasource/user_profile_boost_datasource.dart'
    as _i61;
import 'package:zheeta/profile/data/datasource/user_profile_datasource.dart'
    as _i67;
import 'package:zheeta/profile/data/datasource/user_search_datasource.dart'
    as _i73;
import 'package:zheeta/profile/data/datasource/user_transaction_datasource.dart'
    as _i79;
import 'package:zheeta/profile/data/repository/prod/access_restriction_repository_impl.dart'
    as _i88;
import 'package:zheeta/profile/data/repository/prod/location_repository_impl.dart'
    as _i22;
import 'package:zheeta/profile/data/repository/prod/user_bank_account_repository_impl.dart'
    as _i40;
import 'package:zheeta/profile/data/repository/prod/user_interest_repository_impl.dart'
    as _i46;
import 'package:zheeta/profile/data/repository/prod/user_profile_access_repository_impl.dart'
    as _i58;
import 'package:zheeta/profile/data/repository/prod/user_profile_boost_repository_impl.dart'
    as _i64;
import 'package:zheeta/profile/data/repository/prod/user_profile_repository_impl.dart'
    as _i70;
import 'package:zheeta/profile/data/repository/prod/user_search_repository_impl.dart'
    as _i76;
import 'package:zheeta/profile/data/repository/prod/user_transaction_repository_impl.dart'
    as _i82;
import 'package:zheeta/profile/domain/repository/access_restriction_repository.dart'
    as _i87;
import 'package:zheeta/profile/domain/repository/location_repository.dart'
    as _i21;
import 'package:zheeta/profile/domain/repository/user_bank_account_repository.dart'
    as _i39;
import 'package:zheeta/profile/domain/repository/user_interest_repository.dart'
    as _i45;
import 'package:zheeta/profile/domain/repository/user_profile_access_repository.dart'
    as _i57;
import 'package:zheeta/profile/domain/repository/user_profile_boost_repository.dart'
    as _i63;
import 'package:zheeta/profile/domain/repository/user_profile_repository.dart'
    as _i69;
import 'package:zheeta/profile/domain/repository/user_search_repository.dart'
    as _i75;
import 'package:zheeta/profile/domain/repository/user_transaction_repository.dart'
    as _i81;
import 'package:zheeta/profile/domain/usecase/access_restriction_usecase.dart'
    as _i89;
import 'package:zheeta/profile/domain/usecase/location_usecase.dart' as _i23;
import 'package:zheeta/profile/domain/usecase/prod/access_restriction_usecase_impl.dart'
    as _i90;
import 'package:zheeta/profile/domain/usecase/prod/location_usecase_impl.dart'
    as _i24;
import 'package:zheeta/profile/domain/usecase/prod/user_bank_account_usecase_impl.dart'
    as _i42;
import 'package:zheeta/profile/domain/usecase/prod/user_interest_usecase_impl.dart'
    as _i48;
import 'package:zheeta/profile/domain/usecase/prod/user_profile_access_usecase_impl.dart'
    as _i60;
import 'package:zheeta/profile/domain/usecase/prod/user_profile_boost_usecase_impl.dart'
    as _i66;
import 'package:zheeta/profile/domain/usecase/prod/user_profile_usecase_impl.dart'
    as _i72;
import 'package:zheeta/profile/domain/usecase/prod/user_search_usecase_impl.dart'
    as _i78;
import 'package:zheeta/profile/domain/usecase/prod/user_transaction_usecase_impl.dart'
    as _i84;
import 'package:zheeta/profile/domain/usecase/user_bank_account_usecase.dart'
    as _i41;
import 'package:zheeta/profile/domain/usecase/user_interest_usecase.dart'
    as _i47;
import 'package:zheeta/profile/domain/usecase/user_profile_access_usecase.dart'
    as _i59;
import 'package:zheeta/profile/domain/usecase/user_profile_boost_usecase.dart'
    as _i65;
import 'package:zheeta/profile/domain/usecase/user_profile_usecase.dart'
    as _i71;
import 'package:zheeta/profile/domain/usecase/user_search_usecase.dart' as _i77;
import 'package:zheeta/profile/domain/usecase/user_transaction_usecase.dart'
    as _i83;

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
    gh.lazySingleton<_i13.IdentityRoleDataSource>(
      () => _i14.IdentityRoleDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i15.IdentityRoleRepository>(
      () => _i16.IdentityRoleRepositoryImpl(gh<_i13.IdentityRoleDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i17.IdentityRoleUseCase>(
      () => _i18.IdentityRoleUseCaseImpl(gh<_i15.IdentityRoleRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i19.LocationDataSource>(
      _i20.LocationDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i21.LocationRepository>(
      () => _i22.LocationRepositoryImpl(gh<_i19.LocationDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i23.LocationUseCase>(
      () => _i24.LocationUseCaseImpl(gh<_i21.LocationRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i25.MatchCriteriaDataSource>(
      _i26.MatchCriteriaDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i27.MatchCriteriaRepository>(
      () =>
          _i28.MatchCriteriaRepositoryImpl(gh<_i25.MatchCriteriaDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i29.MatchCriteriaUseCase>(
      () => _i30.MatchCriteriaUseCaseImpl(gh<_i27.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i31.UserAuthDataSource>(
      () => _i32.UserAuthDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i33.UserAuthRepository>(
      () => _i34.UserAuthRepositoryImpl(gh<_i31.UserAuthDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i35.UserAuthUseCase>(
      () => _i36.UserAuthUseCaseImpl(gh<_i33.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i37.UserBankAccountDataSource>(
      _i38.UserBankAccountDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i39.UserBankAccountRepository>(
      () => _i40.UserBankAccountRepositoryImpl(
          gh<_i37.UserBankAccountDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i41.UserBankAccountUseCase>(
      () =>
          _i42.UserBankAccountUseCaseImpl(gh<_i39.UserBankAccountRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i43.UserInterestDataSource>(
      _i44.UserInterestDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i45.UserInterestRepository>(
      () => _i46.UserInterestRepositoryImpl(gh<_i43.UserInterestDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i47.UserInterestUseCase>(
      () => _i48.UserInterestUseCaseImpl(gh<_i45.UserInterestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i49.UserOtpDataSource>(
      () => _i50.UserOtpDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i51.UserOtpRepository>(
      () => _i52.UserOtpRepositoryImpl(gh<_i49.UserOtpDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i53.UserOtpUseCase>(
      () => _i54.UserOtpUseCaseImpl(gh<_i51.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i55.UserProfileAccessDataSource>(
      _i56.UserProfileAccessDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i57.UserProfileAccessRepository>(
      () => _i58.UserProfileAccessRepositoryImpl(
          gh<_i55.UserProfileAccessDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i59.UserProfileAccessUseCase>(
      () => _i60.UserProfileAccessUseCaseImpl(
          gh<_i57.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i61.UserProfileBoostDataSource>(
      _i62.UserProfileBoostDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i63.UserProfileBoostRepository>(
      () => _i64.UserProfileBoostRepositoryImpl(
          gh<_i61.UserProfileBoostDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i65.UserProfileBoostUseCase>(
      () => _i66.UserProfileBoostUseCaseImpl(
          gh<_i63.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i67.UserProfileDataSource>(
      _i68.UserProfileDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i69.UserProfileRepository>(
      () => _i70.UserProfileRepositoryImpl(gh<_i67.UserProfileDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i71.UserProfileUseCase>(
      () => _i72.UserProfileUseCaseImpl(gh<_i69.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i73.UserSearchDataSource>(
      _i74.UserSearchDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i75.UserSearchRepository>(
      () => _i76.UserSearchRepositorImpl(gh<_i73.UserSearchDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i77.UserSearchUseCase>(
      () => _i78.UserSearchUseCaseImpl(gh<_i75.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i79.UserTransactionDataSource>(
      _i80.UserTransactionDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i81.UserTransactionRepository>(
      () => _i82.UserTransactionRepositoryImpl(
          gh<_i79.UserTransactionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i83.UserTransactionUseCase>(
      () =>
          _i84.UserTransactionUseCaseImpl(gh<_i81.UserTransactionRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i85.AccessRestrictionDataSource>(
      _i86.AccessRestrictionDataSourceImpl(gh<_i5.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i87.AccessRestrictionRepository>(
      () => _i88.AccessRestrictionRepositoryImpl(
          gh<_i85.AccessRestrictionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i89.AccessRestrictionUseCase>(
      () => _i90.AccessRestrictionUseCaseImpl(
          gh<_i87.AccessRestrictionRepository>()),
      registerFor: {_prod},
    );
    return this;
  }
}
