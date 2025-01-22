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
import 'package:zheeta/features/authentication/data/datasource/prod/user_otp_datasource_impl.dart'
    as _i6;
import 'package:zheeta/features/authentication/data/datasource/user_auth_datasource.dart'
    as _i84;
import 'package:zheeta/features/authentication/data/datasource/user_otp_datasource.dart'
    as _i949;
import 'package:zheeta/features/authentication/data/repository/user_auth_repository_impl.dart'
    as _i213;
import 'package:zheeta/features/authentication/data/repository/user_otp_repository_impl.dart'
    as _i193;
import 'package:zheeta/features/authentication/domain/repository/user_auth_repository.dart'
    as _i561;
import 'package:zheeta/features/authentication/domain/repository/user_otp_repository.dart'
    as _i315;
import 'package:zheeta/features/authentication/domain/usecase/user_auth/user_auth_usecases.dart'
    as _i99;
import 'package:zheeta/features/authentication/domain/usecase/user_otp/user_otp_usecases.dart'
    as _i274;
import 'package:zheeta/features/authentication/presentation/bloc/authentication_cubit.dart'
    as _i270;
import 'package:zheeta/features/homepage/presentation/views/bloc/app_cubit.dart'
    as _i798;
import 'package:zheeta/features/profile/data/datasource/prod/user_profile_datasource_impl.dart'
    as _i726;
import 'package:zheeta/features/profile/data/datasource/user_profile_datasource.dart'
    as _i710;
import 'package:zheeta/features/profile/data/repository/prod/user_profile_repository_impl.dart'
    as _i760;
import 'package:zheeta/features/profile/domain/repository/user_profile_repository.dart'
    as _i273;
import 'package:zheeta/features/profile/domain/usecase/user_profile_usecases.dart'
    as _i94;
import 'package:zheeta/features/profile/presentation/bloc/profile_cubit/profile_cubit.dart'
    as _i137;
import 'package:zheeta/features/splash_screen/presentation/cubit/maintenance_mode_cubit.dart'
    as _i848;

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
    gh.lazySingleton<_i848.MaintenanceModeCubit>(
      () => _i848.MaintenanceModeCubit(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i888.PushNotificationService>(
      () => _i888.PushNotificationService(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i625.DeepLinkService>(
      () => _i625.DeepLinkService(),
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
    gh.lazySingleton<_i561.UserAuthRepository>(
      () => _i213.UserAuthRepositoryImpl(
        gh<_i84.UserAuthDataSource>(),
        gh<_i734.IUserStorage>(),
        gh<_i573.ITokenStorage>(),
      ),
      registerFor: {_prod},
    );
    gh.singleton<_i710.UserProfileDataSource>(
      () => _i726.UserProfileDataSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i949.UserOtpDataSource>(
      () => _i6.UserOtpDataSourceImpl(gh<_i150.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i273.UserProfileRepository>(
      () => _i760.UserProfileRepositoryImpl(gh<_i710.UserProfileDataSource>()),
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
    gh.lazySingleton<_i315.UserOtpRepository>(
      () => _i193.UserOtpRepositoryImpl(gh<_i949.UserOtpDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i94.GetSingleUserProfile>(
      () => _i94.GetSingleUserProfile(gh<_i273.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i137.ProfileCubit>(
      () => _i137.ProfileCubit(
          getSingleUserProfile: gh<_i94.GetSingleUserProfile>()),
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
    gh.lazySingleton<_i270.AuthenticationCubit>(
      () => _i270.AuthenticationCubit(loginUser: gh<_i99.LoginUser>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i798.AppCubit>(
      () => _i798.AppCubit(profileCubit: gh<_i137.ProfileCubit>()),
      registerFor: {_prod},
    );
    return this;
  }
}
