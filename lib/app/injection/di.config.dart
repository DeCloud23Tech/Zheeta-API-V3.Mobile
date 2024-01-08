// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:zheeta/app/api/api_manager.dart' as _i8;
import 'package:zheeta/app/api/dio_module.dart' as _i4;
import 'package:zheeta/app/api/prod/api_manager_impl.dart' as _i9;
import 'package:zheeta/app/router/app_router.dart' as _i3;
import 'package:zheeta/authentication/data/datasource/country_datasource.dart'
    as _i10;
import 'package:zheeta/authentication/data/datasource/identity_role_datasource.dart'
    as _i16;
import 'package:zheeta/authentication/data/datasource/prod/country_datasource_impl.dart'
    as _i11;
import 'package:zheeta/authentication/data/datasource/prod/identity_role_datasource_impl.dart'
    as _i17;
import 'package:zheeta/authentication/data/datasource/prod/user_auth_datasource_impl.dart'
    as _i29;
import 'package:zheeta/authentication/data/datasource/prod/user_otp_datasource_impl.dart'
    as _i43;
import 'package:zheeta/authentication/data/datasource/user_auth_datasource.dart'
    as _i28;
import 'package:zheeta/authentication/data/datasource/user_otp_datasource.dart'
    as _i42;
import 'package:zheeta/authentication/data/repository/prod/country_repository_impl.dart'
    as _i13;
import 'package:zheeta/authentication/data/repository/prod/identity_role_repository_impl.dart'
    as _i19;
import 'package:zheeta/authentication/data/repository/prod/user_auth_repository_impl.dart'
    as _i31;
import 'package:zheeta/authentication/data/repository/prod/user_otp_repository_impl.dart'
    as _i45;
import 'package:zheeta/authentication/domain/repository/country_repository.dart'
    as _i12;
import 'package:zheeta/authentication/domain/repository/identity_role_repository.dart'
    as _i18;
import 'package:zheeta/authentication/domain/repository/user_auth_repository.dart'
    as _i30;
import 'package:zheeta/authentication/domain/repository/user_otp_repository.dart'
    as _i44;
import 'package:zheeta/authentication/domain/usecase/country_usecase.dart'
    as _i14;
import 'package:zheeta/authentication/domain/usecase/identity_role_usecase.dart'
    as _i20;
import 'package:zheeta/authentication/domain/usecase/prod/country_usecase_impl.dart'
    as _i15;
import 'package:zheeta/authentication/domain/usecase/prod/identity_role_usecase_impl.dart'
    as _i21;
import 'package:zheeta/authentication/domain/usecase/prod/user_auth_usecase_impl.dart'
    as _i33;
import 'package:zheeta/authentication/domain/usecase/prod/user_otp_usecase_impl.dart'
    as _i47;
import 'package:zheeta/authentication/domain/usecase/user_auth_usecase.dart'
    as _i32;
import 'package:zheeta/authentication/domain/usecase/user_otp_usecase.dart'
    as _i46;
import 'package:zheeta/profile/data/datasource/access_restriction_datasource.dart'
    as _i78;
import 'package:zheeta/profile/data/datasource/location_datasource.dart'
    as _i22;
import 'package:zheeta/profile/data/datasource/prod/access_restriction_datasource_impl.dart'
    as _i79;
import 'package:zheeta/profile/data/datasource/prod/location_datasource_impl.dart'
    as _i23;
import 'package:zheeta/profile/data/datasource/prod/user_bank_account_datasource_impl.dart'
    as _i35;
import 'package:zheeta/profile/data/datasource/prod/user_interest_datasource_impl.dart'
    as _i37;
import 'package:zheeta/profile/data/datasource/prod/user_profile_access_datasource_impl.dart'
    as _i49;
import 'package:zheeta/profile/data/datasource/prod/user_profile_boost_datasource_impl.dart'
    as _i55;
import 'package:zheeta/profile/data/datasource/prod/user_profile_datasource_impl.dart'
    as _i61;
import 'package:zheeta/profile/data/datasource/prod/user_search_datasource_impl.dart'
    as _i67;
import 'package:zheeta/profile/data/datasource/prod/user_transaction_datasource_impl.dart'
    as _i73;
import 'package:zheeta/profile/data/datasource/user_bank_account_datasource.dart'
    as _i34;
import 'package:zheeta/profile/data/datasource/user_interest_datasource.dart'
    as _i36;
import 'package:zheeta/profile/data/datasource/user_profile_access_datasource.dart'
    as _i48;
import 'package:zheeta/profile/data/datasource/user_profile_boost_datasource.dart'
    as _i54;
import 'package:zheeta/profile/data/datasource/user_profile_datasource.dart'
    as _i60;
import 'package:zheeta/profile/data/datasource/user_search_datasource.dart'
    as _i66;
import 'package:zheeta/profile/data/datasource/user_transaction_datasource.dart'
    as _i72;
import 'package:zheeta/profile/data/repository/prod/access_restriction_repository_impl.dart'
    as _i81;
import 'package:zheeta/profile/data/repository/prod/location_repository_impl.dart'
    as _i25;
import 'package:zheeta/profile/data/repository/prod/user_interest_repository_impl.dart'
    as _i39;
import 'package:zheeta/profile/data/repository/prod/user_profile_access_repository_impl.dart'
    as _i51;
import 'package:zheeta/profile/data/repository/prod/user_profile_boost_repository_impl.dart'
    as _i57;
import 'package:zheeta/profile/data/repository/prod/user_profile_repository_impl.dart'
    as _i63;
import 'package:zheeta/profile/data/repository/prod/user_search_repository_impl.dart'
    as _i69;
import 'package:zheeta/profile/data/repository/prod/user_transaction_repository_impl.dart'
    as _i75;
import 'package:zheeta/profile/domain/repository/access_restriction_repository.dart'
    as _i80;
import 'package:zheeta/profile/domain/repository/location_repository.dart'
    as _i24;
import 'package:zheeta/profile/domain/repository/user_bank_account_repository.dart'
    as _i7;
import 'package:zheeta/profile/domain/repository/user_interest_repository.dart'
    as _i38;
import 'package:zheeta/profile/domain/repository/user_profile_access_repository.dart'
    as _i50;
import 'package:zheeta/profile/domain/repository/user_profile_boost_repository.dart'
    as _i56;
import 'package:zheeta/profile/domain/repository/user_profile_repository.dart'
    as _i62;
import 'package:zheeta/profile/domain/repository/user_search_repository.dart'
    as _i68;
import 'package:zheeta/profile/domain/repository/user_transaction_repository.dart'
    as _i74;
import 'package:zheeta/profile/domain/usecase/access_restriction_usecase.dart'
    as _i82;
import 'package:zheeta/profile/domain/usecase/location_usecase.dart' as _i26;
import 'package:zheeta/profile/domain/usecase/prod/access_restriction_usecase_impl.dart'
    as _i83;
import 'package:zheeta/profile/domain/usecase/prod/location_usecase_impl.dart'
    as _i27;
import 'package:zheeta/profile/domain/usecase/prod/user_bank_account_usecase_impl.dart'
    as _i6;
import 'package:zheeta/profile/domain/usecase/prod/user_interest_usecase_impl.dart'
    as _i41;
import 'package:zheeta/profile/domain/usecase/prod/user_profile_access_usecase_impl.dart'
    as _i53;
import 'package:zheeta/profile/domain/usecase/prod/user_profile_boost_usecase_impl.dart'
    as _i59;
import 'package:zheeta/profile/domain/usecase/prod/user_profile_usecase_impl.dart'
    as _i65;
import 'package:zheeta/profile/domain/usecase/prod/user_search_usecase_impl.dart'
    as _i71;
import 'package:zheeta/profile/domain/usecase/prod/user_transaction_usecase_impl.dart'
    as _i77;
import 'package:zheeta/profile/domain/usecase/user_bank_account_usecase.dart'
    as _i5;
import 'package:zheeta/profile/domain/usecase/user_interest_usecase.dart'
    as _i40;
import 'package:zheeta/profile/domain/usecase/user_profile_access_usecase.dart'
    as _i52;
import 'package:zheeta/profile/domain/usecase/user_profile_boost_usecase.dart'
    as _i58;
import 'package:zheeta/profile/domain/usecase/user_profile_usecase.dart'
    as _i64;
import 'package:zheeta/profile/domain/usecase/user_search_usecase.dart' as _i70;
import 'package:zheeta/profile/domain/usecase/user_transaction_usecase.dart'
    as _i76;

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
    gh.lazySingleton<_i5.UserBankAccountUseCase>(
      () => _i6.UserBankAccountUseCaseImpl(gh<_i7.UserBankAccountRepository>()),
      registerFor: {_prod},
    );
    gh.factory<_i8.ApiManager>(
      () => _i9.ApiManagerImpl(gh<_i4.DioModule>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i10.CountryDataSource>(
      () => _i11.CountryDatasourceImpl(gh<_i8.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i12.CountryRepository>(
      () => _i13.CountryRepositoryImpl(gh<_i10.CountryDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i14.CountryUseCase>(
      () => _i15.CountryUseCaseImpl(gh<_i12.CountryRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i16.IdentityRoleDataSource>(
      () => _i17.IdentityRoleDataSourceImpl(gh<_i8.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i18.IdentityRoleRepository>(
      () => _i19.IdentityRoleRepositoryImpl(gh<_i16.IdentityRoleDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i20.IdentityRoleUseCase>(
      () => _i21.IdentityRoleUseCaseImpl(gh<_i18.IdentityRoleRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i22.LocationDataSource>(
      () => _i23.LocationDataSourceImpl(gh<_i8.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i24.LocationRepository>(
      () => _i25.LocationRepositoryImpl(gh<_i22.LocationDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i26.LocationUseCase>(
      () => _i27.LocationUseCaseImpl(gh<_i24.LocationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i28.UserAuthDataSource>(
      () => _i29.UserAuthDataSourceImpl(gh<_i8.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i30.UserAuthRepository>(
      () => _i31.UserAuthRepositoryImpl(gh<_i28.UserAuthDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i32.UserAuthUseCase>(
      () => _i33.UserAuthUseCaseImpl(gh<_i30.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i34.UserBankAccountDataSource>(
      () => _i35.UserBankAccountDataSourceImpl(gh<_i8.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i36.UserInterestDataSource>(
      () => _i37.UserInterestDataSourceImpl(gh<_i8.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i38.UserInterestRepository>(
      () => _i39.UserInterestRepositoryImpl(gh<_i36.UserInterestDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i40.UserInterestUseCase>(
      () => _i41.UserInterestUseCaseImpl(gh<_i38.UserInterestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i42.UserOtpDataSource>(
      () => _i43.UserOtpDataSourceImpl(gh<_i8.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i44.UserOtpRepository>(
      () => _i45.UserOtpRepositoryImpl(gh<_i42.UserOtpDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i46.UserOtpUseCase>(
      () => _i47.UserOtpUseCaseImpl(gh<_i44.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i48.UserProfileAccessDataSource>(
      () => _i49.UserProfileAccessDataSourceImpl(gh<_i8.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i50.UserProfileAccessRepository>(
      () => _i51.UserProfileAccessRepositoryImpl(
          gh<_i48.UserProfileAccessDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i52.UserProfileAccessUseCase>(
      () => _i53.UserProfileAccessUseCaseImpl(
          gh<_i50.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i54.UserProfileBoostDataSource>(
      () => _i55.UserProfileBoostDataSourceImpl(gh<_i8.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i56.UserProfileBoostRepository>(
      () => _i57.UserProfileBoostRepositoryImpl(
          gh<_i54.UserProfileBoostDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i58.UserProfileBoostUseCase>(
      () => _i59.UserProfileBoostUseCaseImpl(
          gh<_i56.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i60.UserProfileDataSource>(
      () => _i61.UserProfileDataSourceImpl(gh<_i8.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i62.UserProfileRepository>(
      () => _i63.UserProfileRepositoryImpl(gh<_i60.UserProfileDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i64.UserProfileUseCase>(
      () => _i65.UserProfileUseCaseImpl(gh<_i62.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i66.UserSearchDataSource>(
      () => _i67.UserSearchDataSourceImpl(gh<_i8.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i68.UserSearchRepository>(
      () => _i69.UserSearchRepositorImpl(gh<_i66.UserSearchDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i70.UserSearchUseCase>(
      () => _i71.UserSearchUseCaseImpl(gh<_i68.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i72.UserTransactionDataSource>(
      () => _i73.UserTransactionDataSourceImpl(gh<_i8.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i74.UserTransactionRepository>(
      () => _i75.UserTransactionRepositoryImpl(
          gh<_i72.UserTransactionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i76.UserTransactionUseCase>(
      () =>
          _i77.UserTransactionUseCaseImpl(gh<_i74.UserTransactionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i78.AccessRestrictionDataSource>(
      () => _i79.AccessRestrictionDataSourceImpl(gh<_i8.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i80.AccessRestrictionRepository>(
      () => _i81.AccessRestrictionRepositoryImpl(
          gh<_i78.AccessRestrictionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i82.AccessRestrictionUseCase>(
      () => _i83.AccessRestrictionUseCaseImpl(
          gh<_i80.AccessRestrictionRepository>()),
      registerFor: {_prod},
    );
    return this;
  }
}
