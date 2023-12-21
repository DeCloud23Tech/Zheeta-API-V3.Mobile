// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:zheeta/app/api/api_manager.dart' as _i3;
import 'package:zheeta/app/api/api_manager_impl.dart' as _i4;
import 'package:zheeta/app/router/app_router.dart' as _i6;
import 'package:zheeta/authentication/data/datasource/identity_role_datasource.dart'
    as _i7;
import 'package:zheeta/authentication/data/datasource/identity_role_datasource_impl.dart'
    as _i8;
import 'package:zheeta/authentication/data/datasource/user_auth_datasource.dart'
    as _i13;
import 'package:zheeta/authentication/data/datasource/user_auth_datasource_impl.dart'
    as _i14;
import 'package:zheeta/authentication/data/datasource/user_otp_datasource.dart'
    as _i19;
import 'package:zheeta/authentication/data/datasource/user_otp_datasource_impl.dart'
    as _i20;
import 'package:zheeta/authentication/data/repository/identity_role_repository_impl.dart'
    as _i10;
import 'package:zheeta/authentication/data/repository/user_auth_repository_impl.dart'
    as _i16;
import 'package:zheeta/authentication/data/repository/user_otp_repository_impl.dart'
    as _i22;
import 'package:zheeta/authentication/domain/repository/identity_role_repository.dart'
    as _i9;
import 'package:zheeta/authentication/domain/repository/user_auth_repository.dart'
    as _i15;
import 'package:zheeta/authentication/domain/repository/user_otp_repository.dart'
    as _i21;
import 'package:zheeta/authentication/domain/usecase/identity_role_usecase.dart'
    as _i11;
import 'package:zheeta/authentication/domain/usecase/identity_role_usecase_impl.dart'
    as _i12;
import 'package:zheeta/authentication/domain/usecase/user_auth_usecase.dart'
    as _i17;
import 'package:zheeta/authentication/domain/usecase/user_auth_usecase_impl.dart'
    as _i18;
import 'package:zheeta/authentication/domain/usecase/user_otp_usecase.dart'
    as _i23;
import 'package:zheeta/authentication/domain/usecase/user_otp_usecase_impl.dart'
    as _i24;

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
    gh.factory<_i3.ApiManager>(
      () => _i4.ApiManagerImpl(gh<_i5.Dio>()),
      registerFor: {_prod},
    );
    gh.factory<_i6.AppRouter>(() => _i6.AppRouter());
    gh.lazySingleton<_i7.IdentityRoleDatasource>(
      () => _i8.IdentityRoleDatasourceImpl(gh<_i3.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i9.IdentityRoleRepository>(
      () => _i10.IdentityRoleRepositoryImpl(gh<_i7.IdentityRoleDatasource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i11.IdentityRoleUsecase>(
      () => _i12.IdentityRoleUsecaseImpl(gh<_i9.IdentityRoleRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i13.UserAuthDatasource>(
      () => _i14.UserAuthDatasourceImpl(gh<_i3.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i15.UserAuthRepository>(
      () => _i16.UserAuthRepositoryImpl(gh<_i13.UserAuthDatasource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i17.UserAuthUsecase>(
      () => _i18.UserAuthUsecaseImpl(gh<_i15.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i19.UserOtpDatasource>(
      () => _i20.UserOtpDatasourceImpl(gh<_i3.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i21.UserOtpRepository>(
      () => _i22.UserOtpRepositoryImpl(gh<_i19.UserOtpDatasource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i23.UserOtpUsecase>(
      () => _i24.UserOtpUsecaseImpl(gh<_i21.UserOtpRepository>()),
      registerFor: {_prod},
    );
    return this;
  }
}
