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
import 'package:zheeta/authentication/data/datasource/user_auth_datasource.dart'
    as _i6;
import 'package:zheeta/authentication/data/datasource/user_auth_datasource_impl.dart'
    as _i7;
import 'package:zheeta/authentication/data/datasource/user_otp_datasource.dart'
    as _i8;
import 'package:zheeta/authentication/data/datasource/user_otp_datasource_impl.dart'
    as _i9;

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
    gh.factory<_i6.UserAuthDatasource>(
      () => _i7.UserAuthDatasourceImpl(gh<_i3.ApiManager>()),
      registerFor: {_prod},
    );
    gh.factory<_i8.UserOtpDatasource>(
      () => _i9.UserOtpDatasourceImpl(gh<_i3.ApiManager>()),
      registerFor: {_prod},
    );
    return this;
  }
}
