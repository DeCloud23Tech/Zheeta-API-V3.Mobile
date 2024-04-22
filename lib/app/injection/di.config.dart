// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:zheeta/app/api/api_manager.dart' as _i14;
import 'package:zheeta/app/api/api_manager_refactored.dart' as _i4;
import 'package:zheeta/app/api/dio_module.dart' as _i6;
import 'package:zheeta/app/api/prod/api_manager_impl.dart' as _i15;
import 'package:zheeta/app/common/storage/user_storage/i_user_storage.dart'
    as _i8;
import 'package:zheeta/app/common/storage/user_storage/user_storage.dart'
    as _i9;
import 'package:zheeta/app/router/app_router.dart' as _i5;
import 'package:zheeta/authentication/data/datasource/country_datasource.dart'
    as _i16;
import 'package:zheeta/authentication/data/datasource/identity_role_datasource.dart'
    as _i27;
import 'package:zheeta/authentication/data/datasource/prod/country_datasource_impl.dart'
    as _i17;
import 'package:zheeta/authentication/data/datasource/prod/identity_role_datasource_impl.dart'
    as _i28;
import 'package:zheeta/authentication/data/datasource/prod/user_auth_datasource_impl.dart'
    as _i51;
import 'package:zheeta/authentication/data/datasource/prod/user_otp_datasource_impl.dart'
    as _i63;
import 'package:zheeta/authentication/data/datasource/user_auth_datasource.dart'
    as _i50;
import 'package:zheeta/authentication/data/datasource/user_otp_datasource.dart'
    as _i62;
import 'package:zheeta/authentication/data/repository/prod/country_repository_impl.dart'
    as _i19;
import 'package:zheeta/authentication/data/repository/prod/identity_role_repository_impl.dart'
    as _i30;
import 'package:zheeta/authentication/data/repository/prod/user_auth_repository_impl.dart'
    as _i53;
import 'package:zheeta/authentication/data/repository/prod/user_otp_repository_impl.dart'
    as _i65;
import 'package:zheeta/authentication/domain/repository/country_repository.dart'
    as _i18;
import 'package:zheeta/authentication/domain/repository/identity_role_repository.dart'
    as _i29;
import 'package:zheeta/authentication/domain/repository/user_auth_repository.dart'
    as _i52;
import 'package:zheeta/authentication/domain/repository/user_otp_repository.dart'
    as _i64;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/country/country_usecases.dart'
    as _i26;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/identity/identity_usecases.dart'
    as _i49;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/user_auth/user_auth_usecases.dart'
    as _i95;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/user_otp/user_otp_usecases.dart'
    as _i86;
import 'package:zheeta/authentication/presentation/bloc/authentication_bloc.dart'
    as _i103;
import 'package:zheeta/authentication/presentation/viewmodel/user_auth_viewmodel.dart'
    as _i11;
import 'package:zheeta/authentication/presentation/viewmodel/user_otp_viewmodel.dart'
    as _i12;
import 'package:zheeta/discover/data/datasource/friend_request_datasource.dart'
    as _i20;
import 'package:zheeta/discover/data/datasource/match_criteria_datasource.dart'
    as _i35;
import 'package:zheeta/discover/data/datasource/prod/friend_request_datasource_impl.dart'
    as _i21;
import 'package:zheeta/discover/data/datasource/prod/match_criteria_datasource_impl.dart'
    as _i36;
import 'package:zheeta/discover/data/repository/prod/friend_request_repository_impl.dart'
    as _i23;
import 'package:zheeta/discover/data/repository/prod/match_criteria_repository_impl.dart'
    as _i38;
import 'package:zheeta/discover/domain/repository/friend_request_repository.dart'
    as _i22;
import 'package:zheeta/discover/domain/repository/match_criteria_repository.dart'
    as _i37;
import 'package:zheeta/discover/domain/usecase/friend_request_usecase.dart'
    as _i24;
import 'package:zheeta/discover/domain/usecase/match_criteria_usecase.dart'
    as _i39;
import 'package:zheeta/discover/domain/usecase/prod/friend_request_usecase_impl.dart'
    as _i25;
import 'package:zheeta/discover/domain/usecase/prod/match_criteria_usecase_impl.dart'
    as _i40;
import 'package:zheeta/discover/domain/usecase/ref/friend_usecases.dart'
    as _i48;
import 'package:zheeta/discover/domain/usecase/ref/match_criteria_usecases.dart'
    as _i47;
import 'package:zheeta/discover/presentation/bloc/matches_cubit.dart' as _i102;
import 'package:zheeta/discover/presentation/viewmodel/friend_request_viewmodel.dart'
    as _i7;
import 'package:zheeta/discover/presentation/viewmodel/match_criteria_viewmodel.dart'
    as _i10;
import 'package:zheeta/notification/data/datasource/notification_datasource.dart'
    as _i41;
import 'package:zheeta/notification/data/datasource/prod/notification_datasource_impl.dart'
    as _i42;
import 'package:zheeta/notification/data/repository/prod/notification_repository_impl.dart'
    as _i44;
import 'package:zheeta/notification/domain/repository/notification_repository.dart'
    as _i43;
import 'package:zheeta/notification/domain/usecase/notification_usecase.dart'
    as _i45;
import 'package:zheeta/notification/domain/usecase/prod/notification_usecase_impl.dart'
    as _i46;
import 'package:zheeta/profile/data/datasource/access_restriction_datasource.dart'
    as _i88;
import 'package:zheeta/profile/data/datasource/location_datasource.dart'
    as _i31;
import 'package:zheeta/profile/data/datasource/prod/access_restriction_datasource_impl.dart'
    as _i89;
import 'package:zheeta/profile/data/datasource/prod/location_datasource_impl.dart'
    as _i32;
import 'package:zheeta/profile/data/datasource/prod/user_bank_account_datasource_impl.dart'
    as _i55;
import 'package:zheeta/profile/data/datasource/prod/user_interest_datasource_impl.dart'
    as _i59;
import 'package:zheeta/profile/data/datasource/prod/user_profile_access_datasource_impl.dart'
    as _i67;
import 'package:zheeta/profile/data/datasource/prod/user_profile_boost_datasource_impl.dart'
    as _i71;
import 'package:zheeta/profile/data/datasource/prod/user_profile_datasource_impl.dart'
    as _i75;
import 'package:zheeta/profile/data/datasource/prod/user_search_datasource_impl.dart'
    as _i79;
import 'package:zheeta/profile/data/datasource/prod/user_transaction_datasource_impl.dart'
    as _i83;
import 'package:zheeta/profile/data/datasource/user_bank_account_datasource.dart'
    as _i54;
import 'package:zheeta/profile/data/datasource/user_interest_datasource.dart'
    as _i58;
import 'package:zheeta/profile/data/datasource/user_profile_access_datasource.dart'
    as _i66;
import 'package:zheeta/profile/data/datasource/user_profile_boost_datasource.dart'
    as _i70;
import 'package:zheeta/profile/data/datasource/user_profile_datasource.dart'
    as _i74;
import 'package:zheeta/profile/data/datasource/user_search_datasource.dart'
    as _i78;
import 'package:zheeta/profile/data/datasource/user_transaction_datasource.dart'
    as _i82;
import 'package:zheeta/profile/data/repository/prod/access_restriction_repository_impl.dart'
    as _i91;
import 'package:zheeta/profile/data/repository/prod/location_repository_impl.dart'
    as _i34;
import 'package:zheeta/profile/data/repository/prod/user_bank_account_repository_impl.dart'
    as _i57;
import 'package:zheeta/profile/data/repository/prod/user_interest_repository_impl.dart'
    as _i61;
import 'package:zheeta/profile/data/repository/prod/user_profile_access_repository_impl.dart'
    as _i69;
import 'package:zheeta/profile/data/repository/prod/user_profile_boost_repository_impl.dart'
    as _i73;
import 'package:zheeta/profile/data/repository/prod/user_profile_repository_impl.dart'
    as _i77;
import 'package:zheeta/profile/data/repository/prod/user_search_repository_impl.dart'
    as _i81;
import 'package:zheeta/profile/data/repository/prod/user_transaction_repository_impl.dart'
    as _i85;
import 'package:zheeta/profile/domain/repository/access_restriction_repository.dart'
    as _i90;
import 'package:zheeta/profile/domain/repository/location_repository.dart'
    as _i33;
import 'package:zheeta/profile/domain/repository/user_bank_account_repository.dart'
    as _i56;
import 'package:zheeta/profile/domain/repository/user_interest_repository.dart'
    as _i60;
import 'package:zheeta/profile/domain/repository/user_profile_access_repository.dart'
    as _i68;
import 'package:zheeta/profile/domain/repository/user_profile_boost_repository.dart'
    as _i72;
import 'package:zheeta/profile/domain/repository/user_profile_repository.dart'
    as _i76;
import 'package:zheeta/profile/domain/repository/user_search_repository.dart'
    as _i80;
import 'package:zheeta/profile/domain/repository/user_transaction_repository.dart'
    as _i84;
import 'package:zheeta/profile/domain/usecase/access_restriction_usecase.dart'
    as _i92;
import 'package:zheeta/profile/domain/usecase/prod/access_restriction_usecase_impl.dart'
    as _i93;
import 'package:zheeta/profile/domain/usecase/ref_usecases/access_restriction_usecases.dart'
    as _i98;
import 'package:zheeta/profile/domain/usecase/ref_usecases/location_usecases.dart'
    as _i100;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_bank_usecases.dart'
    as _i97;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_interest_usecases.dart'
    as _i105;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_access_usecases.dart'
    as _i94;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_boost_usecases.dart'
    as _i96;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_usecases.dart'
    as _i87;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_search_usecases.dart'
    as _i99;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_transaction_usecases.dart'
    as _i101;
import 'package:zheeta/profile/presentation/bloc/profile_cubit.dart' as _i104;
import 'package:zheeta/profile/presentation/viewmodel/about_screen_viewmodel.dart'
    as _i3;
import 'package:zheeta/profile/presentation/viewmodel/user_profile_viewmodel.dart'
    as _i13;

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
    gh.lazySingleton<_i8.IUserStorage>(
      () => _i9.UserStorage(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i10.MatchCriteriaViewModel>(
      () => _i10.MatchCriteriaViewModel(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i11.UserAuthViewModel>(
      () => _i11.UserAuthViewModel(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i12.UserOtpViewModel>(
      () => _i12.UserOtpViewModel(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i13.UserProfileViewModel>(
      () => _i13.UserProfileViewModel(),
      registerFor: {_prod},
    );
    gh.factory<_i14.ApiManager>(
      () => _i15.ApiManagerImpl(gh<_i6.DioModule>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i16.CountryDataSource>(
      () => _i17.CountryDataSourceImpl(
        gh<_i14.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i18.CountryRepository>(
      () => _i19.CountryRepositoryImpl(gh<_i16.CountryDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i20.FriendRequestDataSource>(
      _i21.FriendRequestDataSourceImpl(
        gh<_i14.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i22.FriendRequestRepository>(
      () =>
          _i23.FriendRequestRepositoryImpl(gh<_i20.FriendRequestDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i24.FriendRequestUseCase>(
      () => _i25.FriendRequestUseCaseImpl(gh<_i22.FriendRequestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i26.GetAllCountries>(
      () => _i26.GetAllCountries(gh<_i18.CountryRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i26.GetCountryDetails>(
      () => _i26.GetCountryDetails(gh<_i18.CountryRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i27.IdentityRoleDataSource>(
      () => _i28.IdentityRoleDataSourceImpl(
        gh<_i14.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i29.IdentityRoleRepository>(
      () => _i30.IdentityRoleRepositoryImpl(gh<_i27.IdentityRoleDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i31.LocationDataSource>(
      _i32.LocationDataSourceImpl(
        gh<_i14.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i33.LocationRepository>(
      () => _i34.LocationRepositoryImpl(gh<_i31.LocationDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i35.MatchCriteriaDataSource>(
      _i36.MatchCriteriaDataSourceImpl(
        gh<_i14.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i37.MatchCriteriaRepository>(
      () =>
          _i38.MatchCriteriaRepositoryImpl(gh<_i35.MatchCriteriaDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i39.MatchCriteriaUseCase>(
      () => _i40.MatchCriteriaUseCaseImpl(gh<_i37.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i41.NotificationDataSource>(
      _i42.NotificationDataSourceImpl(gh<_i14.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i43.NotificationRepository>(
      () => _i44.NotificationRepositoryImpl(gh<_i41.NotificationDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i45.NotificationUseCase>(
      () => _i46.NotificationUseCaseImpl(gh<_i43.NotificationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i47.PopulateMatches>(
      () => _i47.PopulateMatches(gh<_i37.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i48.SendFriendRequest>(
      () => _i48.SendFriendRequest(gh<_i22.FriendRequestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i47.UpdateMatchCriteria>(
      () => _i47.UpdateMatchCriteria(gh<_i37.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i49.UpgradeUserRole>(
      () => _i49.UpgradeUserRole(gh<_i29.IdentityRoleRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i50.UserAuthDataSource>(
      () => _i51.UserAuthDataSourceImpl(
        gh<_i14.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i52.UserAuthRepository>(
      () => _i53.UserAuthRepositoryImpl(
        gh<_i50.UserAuthDataSource>(),
        gh<_i8.IUserStorage>(),
      ),
      registerFor: {_prod},
    );
    gh.singleton<_i54.UserBankAccountDataSource>(
      _i55.UserBankAccountDataSourceImpl(
        gh<_i14.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i56.UserBankAccountRepository>(
      () => _i57.UserBankAccountRepositoryImpl(
          gh<_i54.UserBankAccountDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i58.UserInterestDataSource>(
      _i59.UserInterestDataSourceImpl(
        gh<_i14.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i60.UserInterestRepository>(
      () => _i61.UserInterestRepositoryImpl(gh<_i58.UserInterestDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i62.UserOtpDataSource>(
      () => _i63.UserOtpDataSourceImpl(
        gh<_i14.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i64.UserOtpRepository>(
      () => _i65.UserOtpRepositoryImpl(gh<_i62.UserOtpDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i66.UserProfileAccessDataSource>(
      _i67.UserProfileAccessDataSourceImpl(
        gh<_i14.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i68.UserProfileAccessRepository>(
      () => _i69.UserProfileAccessRepositoryImpl(
          gh<_i66.UserProfileAccessDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i70.UserProfileBoostDataSource>(
      _i71.UserProfileBoostDataSourceImpl(
        gh<_i14.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i72.UserProfileBoostRepository>(
      () => _i73.UserProfileBoostRepositoryImpl(
          gh<_i70.UserProfileBoostDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i74.UserProfileDataSource>(
      _i75.UserProfileDataSourceImpl(
        gh<_i14.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i76.UserProfileRepository>(
      () => _i77.UserProfileRepositoryImpl(gh<_i74.UserProfileDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i78.UserSearchDataSource>(
      _i79.UserSearchDataSourceImpl(
        gh<_i14.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i80.UserSearchRepository>(
      () => _i81.UserSearchRepositorImpl(gh<_i78.UserSearchDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i82.UserTransactionDataSource>(
      _i83.UserTransactionDataSourceImpl(
        gh<_i14.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i84.UserTransactionRepository>(
      () => _i85.UserTransactionRepositoryImpl(
          gh<_i82.UserTransactionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i86.VerifyEmailOtp>(
      () => _i86.VerifyEmailOtp(gh<_i64.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i86.VerifyPhoneOtp>(
      () => _i86.VerifyPhoneOtp(gh<_i64.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i87.VisitUserProfile>(
      () => _i87.VisitUserProfile(gh<_i76.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i88.AccessRestrictionDataSource>(
      _i89.AccessRestrictionDataSourceImpl(
        gh<_i14.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i90.AccessRestrictionRepository>(
      () => _i91.AccessRestrictionRepositoryImpl(
          gh<_i88.AccessRestrictionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i92.AccessRestrictionUseCase>(
      () => _i93.AccessRestrictionUseCaseImpl(
          gh<_i90.AccessRestrictionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i94.BlockAccount>(
      () => _i94.BlockAccount(gh<_i68.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i95.ChangePassword>(
      () => _i95.ChangePassword(gh<_i52.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i87.CreateProfile>(
      () => _i87.CreateProfile(gh<_i76.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i96.CreateProfileBoost>(
      () => _i96.CreateProfileBoost(gh<_i72.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i97.CreateUpdateBankAccount>(
      () => _i97.CreateUpdateBankAccount(gh<_i56.UserBankAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i98.DisableAccount>(
      () => _i98.DisableAccount(gh<_i90.AccessRestrictionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i49.DowngradeUserRole>(
      () => _i49.DowngradeUserRole(gh<_i29.IdentityRoleRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i98.EnableAccount>(
      () => _i98.EnableAccount(gh<_i90.AccessRestrictionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i99.FindUserByAdminEmail>(
      () => _i99.FindUserByAdminEmail(gh<_i80.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i99.FindUserByAdminUsername>(
      () => _i99.FindUserByAdminUsername(gh<_i80.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i100.GetAddressFromLocationCoordinate>(
      () =>
          _i100.GetAddressFromLocationCoordinate(gh<_i33.LocationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i87.GetAllUsersProfile>(
      () => _i87.GetAllUsersProfile(gh<_i76.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i94.GetBlockedUsers>(
      () => _i94.GetBlockedUsers(gh<_i68.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i96.GetBoostedProfileByAdmin>(
      () =>
          _i96.GetBoostedProfileByAdmin(gh<_i72.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i100.GetLocationCoordinateFromAddress>(
      () =>
          _i100.GetLocationCoordinateFromAddress(gh<_i33.LocationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i47.GetMatchCriteria>(
      () => _i47.GetMatchCriteria(gh<_i37.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i96.GetMatchedProfileBoost>(
      () => _i96.GetMatchedProfileBoost(gh<_i72.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i47.GetMatches>(
      () => _i47.GetMatches(gh<_i37.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i87.GetSingleUserProfile>(
      () => _i87.GetSingleUserProfile(gh<_i76.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i97.GetUserBankAccount>(
      () => _i97.GetUserBankAccount(gh<_i56.UserBankAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i87.GetUserRecentActivity>(
      () => _i87.GetUserRecentActivity(gh<_i76.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i101.GetUserTransactions>(
      () => _i101.GetUserTransactions(gh<_i84.UserTransactionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i95.LoginOAuth>(
      () => _i95.LoginOAuth(gh<_i52.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i95.LoginUser>(
      () => _i95.LoginUser(gh<_i52.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i102.MatchesCubit>(
      () => _i102.MatchesCubit(
        sendFriendRequest: gh<_i48.SendFriendRequest>(),
        getMatchCriteria: gh<_i47.GetMatchCriteria>(),
        getMatches: gh<_i47.GetMatches>(),
        populateMatches: gh<_i47.PopulateMatches>(),
        updateMatchCriteria: gh<_i47.UpdateMatchCriteria>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i95.RegisterStaff>(
      () => _i95.RegisterStaff(gh<_i52.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i95.RegisterUser>(
      () => _i95.RegisterUser(gh<_i52.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i95.ResetPassword>(
      () => _i95.ResetPassword(gh<_i52.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i99.SearchUserByCustomer>(
      () => _i99.SearchUserByCustomer(gh<_i80.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i86.SendEmailVerifyOtp>(
      () => _i86.SendEmailVerifyOtp(gh<_i64.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i86.SendPasswordResetOtp>(
      () => _i86.SendPasswordResetOtp(gh<_i64.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i86.SendPhoneVerifyOtp>(
      () => _i86.SendPhoneVerifyOtp(gh<_i64.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i94.UnBlockAccount>(
      () => _i94.UnBlockAccount(gh<_i68.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i87.UpdateUserProfile>(
      () => _i87.UpdateUserProfile(gh<_i76.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i87.UpdateUserProfilePicture>(
      () => _i87.UpdateUserProfilePicture(gh<_i76.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i103.AuthenticationCubit>(
      () => _i103.AuthenticationCubit(
        getAllCountries: gh<_i26.GetAllCountries>(),
        getCountryDetails: gh<_i26.GetCountryDetails>(),
        upgradeUserRole: gh<_i49.UpgradeUserRole>(),
        downgradeUserRole: gh<_i49.DowngradeUserRole>(),
        registerUser: gh<_i95.RegisterUser>(),
        loginUser: gh<_i95.LoginUser>(),
        registerStaff: gh<_i95.RegisterStaff>(),
        changePassword: gh<_i95.ChangePassword>(),
        resetPassword: gh<_i95.ResetPassword>(),
        loginOAuth: gh<_i95.LoginOAuth>(),
        sendPasswordResetOtp: gh<_i86.SendPasswordResetOtp>(),
        sendEmailVerifyOtp: gh<_i86.SendEmailVerifyOtp>(),
        sendPhoneVerifyOtp: gh<_i86.SendPhoneVerifyOtp>(),
        verifyPhoneOtp: gh<_i86.VerifyPhoneOtp>(),
        verifyEmailOtp: gh<_i86.VerifyEmailOtp>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i104.ProfileCubit>(
      () => _i104.ProfileCubit(
        disableAccount: gh<_i98.DisableAccount>(),
        enableAccount: gh<_i98.EnableAccount>(),
        getAddressFromLocationCoordinate:
            gh<_i100.GetAddressFromLocationCoordinate>(),
        getLocationCoordinateFromAddress:
            gh<_i100.GetLocationCoordinateFromAddress>(),
        createUpdateBankAccount: gh<_i97.CreateUpdateBankAccount>(),
        getUserBankAccount: gh<_i97.GetUserBankAccount>(),
        getInterests: gh<_i105.GetInterests>(),
        updateUserInterest: gh<_i105.UpdateUserInterest>(),
        blockAccount: gh<_i94.BlockAccount>(),
        getBlockedUsers: gh<_i94.GetBlockedUsers>(),
        unBlockAccount: gh<_i94.UnBlockAccount>(),
        createProfileBoost: gh<_i96.CreateProfileBoost>(),
        getBoostedProfileByAdmin: gh<_i96.GetBoostedProfileByAdmin>(),
        getMatchedProfileBoost: gh<_i96.GetMatchedProfileBoost>(),
        createProfile: gh<_i87.CreateProfile>(),
        getAllUsersProfile: gh<_i87.GetAllUsersProfile>(),
        getSingleUserProfile: gh<_i87.GetSingleUserProfile>(),
        getUserRecentActivity: gh<_i87.GetUserRecentActivity>(),
        updateUserProfilePicture: gh<_i87.UpdateUserProfilePicture>(),
        updateUserProfile: gh<_i87.UpdateUserProfile>(),
        visitUserProfile: gh<_i87.VisitUserProfile>(),
        findUserByAdminEmail: gh<_i99.FindUserByAdminEmail>(),
        findUserByAdminUsername: gh<_i99.FindUserByAdminUsername>(),
        searchUserByCustomer: gh<_i99.SearchUserByCustomer>(),
        getUserTransactions: gh<_i101.GetUserTransactions>(),
      ),
      registerFor: {_prod},
    );
    return this;
  }
}
