// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:zheeta/app/api/api_manager.dart' as _i16;
import 'package:zheeta/app/api/api_manager_refactored.dart' as _i4;
import 'package:zheeta/app/api/dio_module.dart' as _i6;
import 'package:zheeta/app/api/prod/api_manager_impl.dart' as _i17;
import 'package:zheeta/app/common/storage/token_storage/i_token_storage.dart'
    as _i8;
import 'package:zheeta/app/common/storage/token_storage/token_storage.dart'
    as _i9;
import 'package:zheeta/app/common/storage/user_storage/i_user_storage.dart'
    as _i10;
import 'package:zheeta/app/common/storage/user_storage/user_storage.dart'
    as _i11;
import 'package:zheeta/app/router/app_router.dart' as _i5;
import 'package:zheeta/authentication/data/datasource/country_datasource.dart'
    as _i18;
import 'package:zheeta/authentication/data/datasource/identity_role_datasource.dart'
    as _i29;
import 'package:zheeta/authentication/data/datasource/prod/country_datasource_impl.dart'
    as _i19;
import 'package:zheeta/authentication/data/datasource/prod/identity_role_datasource_impl.dart'
    as _i30;
import 'package:zheeta/authentication/data/datasource/prod/user_auth_datasource_impl.dart'
    as _i53;
import 'package:zheeta/authentication/data/datasource/prod/user_otp_datasource_impl.dart'
    as _i65;
import 'package:zheeta/authentication/data/datasource/user_auth_datasource.dart'
    as _i52;
import 'package:zheeta/authentication/data/datasource/user_otp_datasource.dart'
    as _i64;
import 'package:zheeta/authentication/data/repository/prod/country_repository_impl.dart'
    as _i21;
import 'package:zheeta/authentication/data/repository/prod/identity_role_repository_impl.dart'
    as _i32;
import 'package:zheeta/authentication/data/repository/prod/user_auth_repository_impl.dart'
    as _i55;
import 'package:zheeta/authentication/data/repository/prod/user_otp_repository_impl.dart'
    as _i67;
import 'package:zheeta/authentication/domain/repository/country_repository.dart'
    as _i20;
import 'package:zheeta/authentication/domain/repository/identity_role_repository.dart'
    as _i31;
import 'package:zheeta/authentication/domain/repository/user_auth_repository.dart'
    as _i54;
import 'package:zheeta/authentication/domain/repository/user_otp_repository.dart'
    as _i66;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/country/country_usecases.dart'
    as _i28;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/identity/identity_usecases.dart'
    as _i51;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/user_auth/user_auth_usecases.dart'
    as _i97;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/user_otp/user_otp_usecases.dart'
    as _i88;
import 'package:zheeta/authentication/presentation/bloc/authentication_bloc.dart'
    as _i106;
import 'package:zheeta/authentication/presentation/viewmodel/user_auth_viewmodel.dart'
    as _i13;
import 'package:zheeta/authentication/presentation/viewmodel/user_otp_viewmodel.dart'
    as _i14;
import 'package:zheeta/discover/data/datasource/friend_request_datasource.dart'
    as _i22;
import 'package:zheeta/discover/data/datasource/match_criteria_datasource.dart'
    as _i37;
import 'package:zheeta/discover/data/datasource/prod/friend_request_datasource_impl.dart'
    as _i23;
import 'package:zheeta/discover/data/datasource/prod/match_criteria_datasource_impl.dart'
    as _i38;
import 'package:zheeta/discover/data/repository/prod/friend_request_repository_impl.dart'
    as _i25;
import 'package:zheeta/discover/data/repository/prod/match_criteria_repository_impl.dart'
    as _i40;
import 'package:zheeta/discover/domain/repository/friend_request_repository.dart'
    as _i24;
import 'package:zheeta/discover/domain/repository/match_criteria_repository.dart'
    as _i39;
import 'package:zheeta/discover/domain/usecase/friend_request_usecase.dart'
    as _i26;
import 'package:zheeta/discover/domain/usecase/match_criteria_usecase.dart'
    as _i41;
import 'package:zheeta/discover/domain/usecase/prod/friend_request_usecase_impl.dart'
    as _i27;
import 'package:zheeta/discover/domain/usecase/prod/match_criteria_usecase_impl.dart'
    as _i42;
import 'package:zheeta/discover/domain/usecase/ref/friend_usecases.dart'
    as _i50;
import 'package:zheeta/discover/domain/usecase/ref/match_criteria_usecases.dart'
    as _i49;
import 'package:zheeta/discover/presentation/bloc/matches_cubit.dart' as _i105;
import 'package:zheeta/discover/presentation/viewmodel/friend_request_viewmodel.dart'
    as _i7;
import 'package:zheeta/discover/presentation/viewmodel/match_criteria_viewmodel.dart'
    as _i12;
import 'package:zheeta/notification/data/datasource/notification_datasource.dart'
    as _i43;
import 'package:zheeta/notification/data/datasource/prod/notification_datasource_impl.dart'
    as _i44;
import 'package:zheeta/notification/data/repository/prod/notification_repository_impl.dart'
    as _i46;
import 'package:zheeta/notification/domain/repository/notification_repository.dart'
    as _i45;
import 'package:zheeta/notification/domain/usecase/notification_usecase.dart'
    as _i47;
import 'package:zheeta/notification/domain/usecase/prod/notification_usecase_impl.dart'
    as _i48;
import 'package:zheeta/profile/data/datasource/access_restriction_datasource.dart'
    as _i90;
import 'package:zheeta/profile/data/datasource/location_datasource.dart'
    as _i33;
import 'package:zheeta/profile/data/datasource/prod/access_restriction_datasource_impl.dart'
    as _i91;
import 'package:zheeta/profile/data/datasource/prod/location_datasource_impl.dart'
    as _i34;
import 'package:zheeta/profile/data/datasource/prod/user_bank_account_datasource_impl.dart'
    as _i57;
import 'package:zheeta/profile/data/datasource/prod/user_interest_datasource_impl.dart'
    as _i61;
import 'package:zheeta/profile/data/datasource/prod/user_profile_access_datasource_impl.dart'
    as _i69;
import 'package:zheeta/profile/data/datasource/prod/user_profile_boost_datasource_impl.dart'
    as _i73;
import 'package:zheeta/profile/data/datasource/prod/user_profile_datasource_impl.dart'
    as _i77;
import 'package:zheeta/profile/data/datasource/prod/user_search_datasource_impl.dart'
    as _i81;
import 'package:zheeta/profile/data/datasource/prod/user_transaction_datasource_impl.dart'
    as _i85;
import 'package:zheeta/profile/data/datasource/user_bank_account_datasource.dart'
    as _i56;
import 'package:zheeta/profile/data/datasource/user_interest_datasource.dart'
    as _i60;
import 'package:zheeta/profile/data/datasource/user_profile_access_datasource.dart'
    as _i68;
import 'package:zheeta/profile/data/datasource/user_profile_boost_datasource.dart'
    as _i72;
import 'package:zheeta/profile/data/datasource/user_profile_datasource.dart'
    as _i76;
import 'package:zheeta/profile/data/datasource/user_search_datasource.dart'
    as _i80;
import 'package:zheeta/profile/data/datasource/user_transaction_datasource.dart'
    as _i84;
import 'package:zheeta/profile/data/repository/prod/access_restriction_repository_impl.dart'
    as _i93;
import 'package:zheeta/profile/data/repository/prod/location_repository_impl.dart'
    as _i36;
import 'package:zheeta/profile/data/repository/prod/user_bank_account_repository_impl.dart'
    as _i59;
import 'package:zheeta/profile/data/repository/prod/user_interest_repository_impl.dart'
    as _i63;
import 'package:zheeta/profile/data/repository/prod/user_profile_access_repository_impl.dart'
    as _i71;
import 'package:zheeta/profile/data/repository/prod/user_profile_boost_repository_impl.dart'
    as _i75;
import 'package:zheeta/profile/data/repository/prod/user_profile_repository_impl.dart'
    as _i79;
import 'package:zheeta/profile/data/repository/prod/user_search_repository_impl.dart'
    as _i83;
import 'package:zheeta/profile/data/repository/prod/user_transaction_repository_impl.dart'
    as _i87;
import 'package:zheeta/profile/domain/repository/access_restriction_repository.dart'
    as _i92;
import 'package:zheeta/profile/domain/repository/location_repository.dart'
    as _i35;
import 'package:zheeta/profile/domain/repository/user_bank_account_repository.dart'
    as _i58;
import 'package:zheeta/profile/domain/repository/user_interest_repository.dart'
    as _i62;
import 'package:zheeta/profile/domain/repository/user_profile_access_repository.dart'
    as _i70;
import 'package:zheeta/profile/domain/repository/user_profile_boost_repository.dart'
    as _i74;
import 'package:zheeta/profile/domain/repository/user_profile_repository.dart'
    as _i78;
import 'package:zheeta/profile/domain/repository/user_search_repository.dart'
    as _i82;
import 'package:zheeta/profile/domain/repository/user_transaction_repository.dart'
    as _i86;
import 'package:zheeta/profile/domain/usecase/access_restriction_usecase.dart'
    as _i94;
import 'package:zheeta/profile/domain/usecase/prod/access_restriction_usecase_impl.dart'
    as _i95;
import 'package:zheeta/profile/domain/usecase/ref_usecases/access_restriction_usecases.dart'
    as _i100;
import 'package:zheeta/profile/domain/usecase/ref_usecases/location_usecases.dart'
    as _i102;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_bank_usecases.dart'
    as _i99;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_interest_usecases.dart'
    as _i103;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_access_usecases.dart'
    as _i96;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_boost_usecases.dart'
    as _i98;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_usecases.dart'
    as _i89;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_search_usecases.dart'
    as _i101;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_transaction_usecases.dart'
    as _i104;
import 'package:zheeta/profile/presentation/bloc/profile_cubit.dart' as _i107;
import 'package:zheeta/profile/presentation/viewmodel/about_screen_viewmodel.dart'
    as _i3;
import 'package:zheeta/profile/presentation/viewmodel/user_profile_viewmodel.dart'
    as _i15;

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
    gh.lazySingleton<_i3.AbountScreenViewModel>(
      () => _i3.AbountScreenViewModel(),
      registerFor: {_prod},
    );
    gh.factory<_i4.Api>(
      () => _i4.Api(),
      registerFor: {_prod},
    );
    gh.factory<_i5.AppRouter>(() => _i5.AppRouter());
    gh.factory<_i6.DioModule>(() => _i6.DioModule());
    gh.lazySingleton<_i7.FriendRequestViewModel>(
      () => _i7.FriendRequestViewModel(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i8.ITokenStorage>(
      () => _i9.TokenStorage(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i10.IUserStorage>(
      () => _i11.UserStorage(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i12.MatchCriteriaViewModel>(
      () => _i12.MatchCriteriaViewModel(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i13.UserAuthViewModel>(
      () => _i13.UserAuthViewModel(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i14.UserOtpViewModel>(
      () => _i14.UserOtpViewModel(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i15.UserProfileViewModel>(
      () => _i15.UserProfileViewModel(),
      registerFor: {_prod},
    );
    gh.factory<_i16.ApiManager>(
      () => _i17.ApiManagerImpl(gh<_i6.DioModule>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i18.CountryDataSource>(
      () => _i19.CountryDataSourceImpl(
        gh<_i16.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i20.CountryRepository>(
      () => _i21.CountryRepositoryImpl(gh<_i18.CountryDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i22.FriendRequestDataSource>(
      _i23.FriendRequestDataSourceImpl(
        gh<_i16.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i24.FriendRequestRepository>(
      () =>
          _i25.FriendRequestRepositoryImpl(gh<_i22.FriendRequestDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i26.FriendRequestUseCase>(
      () => _i27.FriendRequestUseCaseImpl(gh<_i24.FriendRequestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i28.GetAllCountries>(
      () => _i28.GetAllCountries(gh<_i20.CountryRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i28.GetCountryDetails>(
      () => _i28.GetCountryDetails(gh<_i20.CountryRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i29.IdentityRoleDataSource>(
      () => _i30.IdentityRoleDataSourceImpl(
        gh<_i16.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i31.IdentityRoleRepository>(
      () => _i32.IdentityRoleRepositoryImpl(gh<_i29.IdentityRoleDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i33.LocationDataSource>(
      _i34.LocationDataSourceImpl(
        gh<_i16.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i35.LocationRepository>(
      () => _i36.LocationRepositoryImpl(gh<_i33.LocationDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i37.MatchCriteriaDataSource>(
      _i38.MatchCriteriaDataSourceImpl(
        gh<_i16.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i39.MatchCriteriaRepository>(
      () =>
          _i40.MatchCriteriaRepositoryImpl(gh<_i37.MatchCriteriaDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i41.MatchCriteriaUseCase>(
      () => _i42.MatchCriteriaUseCaseImpl(gh<_i39.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i43.NotificationDataSource>(
      _i44.NotificationDataSourceImpl(gh<_i16.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i45.NotificationRepository>(
      () => _i46.NotificationRepositoryImpl(gh<_i43.NotificationDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i47.NotificationUseCase>(
      () => _i48.NotificationUseCaseImpl(gh<_i45.NotificationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i49.PopulateMatches>(
      () => _i49.PopulateMatches(gh<_i39.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i50.SendFriendRequest>(
      () => _i50.SendFriendRequest(gh<_i24.FriendRequestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i49.UpdateMatchCriteria>(
      () => _i49.UpdateMatchCriteria(gh<_i39.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i51.UpgradeUserRole>(
      () => _i51.UpgradeUserRole(gh<_i31.IdentityRoleRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i52.UserAuthDataSource>(
      () => _i53.UserAuthDataSourceImpl(
        gh<_i16.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i54.UserAuthRepository>(
      () => _i55.UserAuthRepositoryImpl(
        gh<_i52.UserAuthDataSource>(),
        gh<_i10.IUserStorage>(),
        gh<_i8.ITokenStorage>(),
      ),
      registerFor: {_prod},
    );
    gh.singleton<_i56.UserBankAccountDataSource>(
      _i57.UserBankAccountDataSourceImpl(
        gh<_i16.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i58.UserBankAccountRepository>(
      () => _i59.UserBankAccountRepositoryImpl(
          gh<_i56.UserBankAccountDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i60.UserInterestDataSource>(
      _i61.UserInterestDataSourceImpl(
        gh<_i16.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i62.UserInterestRepository>(
      () => _i63.UserInterestRepositoryImpl(gh<_i60.UserInterestDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i64.UserOtpDataSource>(
      () => _i65.UserOtpDataSourceImpl(
        gh<_i16.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i66.UserOtpRepository>(
      () => _i67.UserOtpRepositoryImpl(gh<_i64.UserOtpDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i68.UserProfileAccessDataSource>(
      _i69.UserProfileAccessDataSourceImpl(
        gh<_i16.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i70.UserProfileAccessRepository>(
      () => _i71.UserProfileAccessRepositoryImpl(
          gh<_i68.UserProfileAccessDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i72.UserProfileBoostDataSource>(
      _i73.UserProfileBoostDataSourceImpl(
        gh<_i16.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i74.UserProfileBoostRepository>(
      () => _i75.UserProfileBoostRepositoryImpl(
          gh<_i72.UserProfileBoostDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i76.UserProfileDataSource>(
      _i77.UserProfileDataSourceImpl(
        gh<_i16.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i78.UserProfileRepository>(
      () => _i79.UserProfileRepositoryImpl(gh<_i76.UserProfileDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i80.UserSearchDataSource>(
      _i81.UserSearchDataSourceImpl(
        gh<_i16.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i82.UserSearchRepository>(
      () => _i83.UserSearchRepositorImpl(gh<_i80.UserSearchDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i84.UserTransactionDataSource>(
      _i85.UserTransactionDataSourceImpl(
        gh<_i16.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i86.UserTransactionRepository>(
      () => _i87.UserTransactionRepositoryImpl(
          gh<_i84.UserTransactionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i88.VerifyEmailOtp>(
      () => _i88.VerifyEmailOtp(gh<_i66.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i88.VerifyPhoneOtp>(
      () => _i88.VerifyPhoneOtp(gh<_i66.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i89.VisitUserProfile>(
      () => _i89.VisitUserProfile(gh<_i78.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i90.AccessRestrictionDataSource>(
      _i91.AccessRestrictionDataSourceImpl(
        gh<_i16.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i92.AccessRestrictionRepository>(
      () => _i93.AccessRestrictionRepositoryImpl(
          gh<_i90.AccessRestrictionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i94.AccessRestrictionUseCase>(
      () => _i95.AccessRestrictionUseCaseImpl(
          gh<_i92.AccessRestrictionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i96.BlockAccount>(
      () => _i96.BlockAccount(gh<_i70.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i97.ChangePassword>(
      () => _i97.ChangePassword(gh<_i54.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i89.CreateProfile>(
      () => _i89.CreateProfile(gh<_i78.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i98.CreateProfileBoost>(
      () => _i98.CreateProfileBoost(gh<_i74.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i99.CreateUpdateBankAccount>(
      () => _i99.CreateUpdateBankAccount(gh<_i58.UserBankAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i100.DisableAccount>(
      () => _i100.DisableAccount(gh<_i92.AccessRestrictionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i51.DowngradeUserRole>(
      () => _i51.DowngradeUserRole(gh<_i31.IdentityRoleRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i100.EnableAccount>(
      () => _i100.EnableAccount(gh<_i92.AccessRestrictionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i101.FindUserByAdminEmail>(
      () => _i101.FindUserByAdminEmail(gh<_i82.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i101.FindUserByAdminUsername>(
      () => _i101.FindUserByAdminUsername(gh<_i82.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i102.GetAddressFromLocationCoordinate>(
      () =>
          _i102.GetAddressFromLocationCoordinate(gh<_i35.LocationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i89.GetAllUsersProfile>(
      () => _i89.GetAllUsersProfile(gh<_i78.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i96.GetBlockedUsers>(
      () => _i96.GetBlockedUsers(gh<_i70.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i98.GetBoostedProfileByAdmin>(
      () =>
          _i98.GetBoostedProfileByAdmin(gh<_i74.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i103.GetInterests>(
      () => _i103.GetInterests(gh<_i62.UserInterestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i102.GetLocationCoordinateFromAddress>(
      () =>
          _i102.GetLocationCoordinateFromAddress(gh<_i35.LocationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i49.GetMatchCriteria>(
      () => _i49.GetMatchCriteria(gh<_i39.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i98.GetMatchedProfileBoost>(
      () => _i98.GetMatchedProfileBoost(gh<_i74.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i49.GetMatches>(
      () => _i49.GetMatches(gh<_i39.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i89.GetSingleUserProfile>(
      () => _i89.GetSingleUserProfile(gh<_i78.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i99.GetUserBankAccount>(
      () => _i99.GetUserBankAccount(gh<_i58.UserBankAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i89.GetUserRecentActivity>(
      () => _i89.GetUserRecentActivity(gh<_i78.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i104.GetUserTransactions>(
      () => _i104.GetUserTransactions(gh<_i86.UserTransactionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i97.LoginOAuth>(
      () => _i97.LoginOAuth(gh<_i54.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i97.LoginUser>(
      () => _i97.LoginUser(gh<_i54.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i105.MatchesCubit>(
      () => _i105.MatchesCubit(
        sendFriendRequest: gh<_i50.SendFriendRequest>(),
        getMatchCriteria: gh<_i49.GetMatchCriteria>(),
        getMatches: gh<_i49.GetMatches>(),
        populateMatches: gh<_i49.PopulateMatches>(),
        updateMatchCriteria: gh<_i49.UpdateMatchCriteria>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i97.RegisterStaff>(
      () => _i97.RegisterStaff(gh<_i54.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i97.RegisterUser>(
      () => _i97.RegisterUser(gh<_i54.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i97.ResetPassword>(
      () => _i97.ResetPassword(gh<_i54.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i101.SearchUserByCustomer>(
      () => _i101.SearchUserByCustomer(gh<_i82.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i88.SendEmailVerifyOtp>(
      () => _i88.SendEmailVerifyOtp(gh<_i66.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i88.SendPasswordResetOtp>(
      () => _i88.SendPasswordResetOtp(gh<_i66.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i88.SendPhoneVerifyOtp>(
      () => _i88.SendPhoneVerifyOtp(gh<_i66.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i96.UnBlockAccount>(
      () => _i96.UnBlockAccount(gh<_i70.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i103.UpdateUserInterest>(
      () => _i103.UpdateUserInterest(gh<_i62.UserInterestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i89.UpdateUserProfile>(
      () => _i89.UpdateUserProfile(gh<_i78.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i89.UpdateUserProfilePicture>(
      () => _i89.UpdateUserProfilePicture(gh<_i78.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i106.AuthenticationCubit>(
      () => _i106.AuthenticationCubit(
        getAllCountries: gh<_i28.GetAllCountries>(),
        getCountryDetails: gh<_i28.GetCountryDetails>(),
        upgradeUserRole: gh<_i51.UpgradeUserRole>(),
        downgradeUserRole: gh<_i51.DowngradeUserRole>(),
        registerUser: gh<_i97.RegisterUser>(),
        loginUser: gh<_i97.LoginUser>(),
        registerStaff: gh<_i97.RegisterStaff>(),
        changePassword: gh<_i97.ChangePassword>(),
        resetPassword: gh<_i97.ResetPassword>(),
        loginOAuth: gh<_i97.LoginOAuth>(),
        sendPasswordResetOtp: gh<_i88.SendPasswordResetOtp>(),
        sendEmailVerifyOtp: gh<_i88.SendEmailVerifyOtp>(),
        sendPhoneVerifyOtp: gh<_i88.SendPhoneVerifyOtp>(),
        verifyPhoneOtp: gh<_i88.VerifyPhoneOtp>(),
        verifyEmailOtp: gh<_i88.VerifyEmailOtp>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i107.ProfileCubit>(
      () => _i107.ProfileCubit(
        disableAccount: gh<_i100.DisableAccount>(),
        enableAccount: gh<_i100.EnableAccount>(),
        getAddressFromLocationCoordinate:
            gh<_i102.GetAddressFromLocationCoordinate>(),
        getLocationCoordinateFromAddress:
            gh<_i102.GetLocationCoordinateFromAddress>(),
        createUpdateBankAccount: gh<_i99.CreateUpdateBankAccount>(),
        getUserBankAccount: gh<_i99.GetUserBankAccount>(),
        getInterests: gh<_i103.GetInterests>(),
        updateUserInterest: gh<_i103.UpdateUserInterest>(),
        blockAccount: gh<_i96.BlockAccount>(),
        getBlockedUsers: gh<_i96.GetBlockedUsers>(),
        unBlockAccount: gh<_i96.UnBlockAccount>(),
        createProfileBoost: gh<_i98.CreateProfileBoost>(),
        getBoostedProfileByAdmin: gh<_i98.GetBoostedProfileByAdmin>(),
        getMatchedProfileBoost: gh<_i98.GetMatchedProfileBoost>(),
        createProfile: gh<_i89.CreateProfile>(),
        getAllUsersProfile: gh<_i89.GetAllUsersProfile>(),
        getSingleUserProfile: gh<_i89.GetSingleUserProfile>(),
        getUserRecentActivity: gh<_i89.GetUserRecentActivity>(),
        updateUserProfilePicture: gh<_i89.UpdateUserProfilePicture>(),
        updateUserProfile: gh<_i89.UpdateUserProfile>(),
        visitUserProfile: gh<_i89.VisitUserProfile>(),
        findUserByAdminEmail: gh<_i101.FindUserByAdminEmail>(),
        findUserByAdminUsername: gh<_i101.FindUserByAdminUsername>(),
        searchUserByCustomer: gh<_i101.SearchUserByCustomer>(),
        getUserTransactions: gh<_i104.GetUserTransactions>(),
      ),
      registerFor: {_prod},
    );
    return this;
  }
}
