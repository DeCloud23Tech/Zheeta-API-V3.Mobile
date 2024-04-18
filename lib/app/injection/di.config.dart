// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:zheeta/app/api/api_manager.dart' as _i10;
import 'package:zheeta/app/api/api_manager_refactored.dart' as _i4;
import 'package:zheeta/app/api/dio_module.dart' as _i6;
import 'package:zheeta/app/api/prod/api_manager_impl.dart' as _i11;
import 'package:zheeta/app/router/app_router.dart' as _i5;
import 'package:zheeta/authentication/data/datasource/country_datasource.dart'
    as _i12;
import 'package:zheeta/authentication/data/datasource/identity_role_datasource.dart'
    as _i23;
import 'package:zheeta/authentication/data/datasource/prod/country_datasource_impl.dart'
    as _i13;
import 'package:zheeta/authentication/data/datasource/prod/identity_role_datasource_impl.dart'
    as _i24;
import 'package:zheeta/authentication/data/datasource/prod/user_auth_datasource_impl.dart'
    as _i47;
import 'package:zheeta/authentication/data/datasource/prod/user_otp_datasource_impl.dart'
    as _i59;
import 'package:zheeta/authentication/data/datasource/user_auth_datasource.dart'
    as _i46;
import 'package:zheeta/authentication/data/datasource/user_otp_datasource.dart'
    as _i58;
import 'package:zheeta/authentication/data/repository/prod/country_repository_impl.dart'
    as _i15;
import 'package:zheeta/authentication/data/repository/prod/identity_role_repository_impl.dart'
    as _i26;
import 'package:zheeta/authentication/data/repository/prod/user_auth_repository_impl.dart'
    as _i49;
import 'package:zheeta/authentication/data/repository/prod/user_otp_repository_impl.dart'
    as _i61;
import 'package:zheeta/authentication/domain/repository/country_repository.dart'
    as _i14;
import 'package:zheeta/authentication/domain/repository/identity_role_repository.dart'
    as _i25;
import 'package:zheeta/authentication/domain/repository/user_auth_repository.dart'
    as _i48;
import 'package:zheeta/authentication/domain/repository/user_otp_repository.dart'
    as _i60;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/country/country_usecases.dart'
    as _i22;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/identity/identity_usecases.dart'
    as _i45;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/user_auth/user_auth_usecases.dart'
    as _i91;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/user_otp/user_otp_usecases.dart'
    as _i82;
import 'package:zheeta/authentication/presentation/bloc/authentication_bloc.dart'
    as _i99;
import 'package:zheeta/discover/data/datasource/friend_request_datasource.dart'
    as _i16;
import 'package:zheeta/discover/data/datasource/match_criteria_datasource.dart'
    as _i31;
import 'package:zheeta/discover/data/datasource/prod/friend_request_datasource_impl.dart'
    as _i17;
import 'package:zheeta/discover/data/datasource/prod/match_criteria_datasource_impl.dart'
    as _i32;
import 'package:zheeta/discover/data/repository/prod/friend_request_repository_impl.dart'
    as _i19;
import 'package:zheeta/discover/data/repository/prod/match_criteria_repository_impl.dart'
    as _i34;
import 'package:zheeta/discover/domain/repository/friend_request_repository.dart'
    as _i18;
import 'package:zheeta/discover/domain/repository/match_criteria_repository.dart'
    as _i33;
import 'package:zheeta/discover/domain/usecase/friend_request_usecase.dart'
    as _i20;
import 'package:zheeta/discover/domain/usecase/match_criteria_usecase.dart'
    as _i35;
import 'package:zheeta/discover/domain/usecase/prod/friend_request_usecase_impl.dart'
    as _i21;
import 'package:zheeta/discover/domain/usecase/prod/match_criteria_usecase_impl.dart'
    as _i36;
import 'package:zheeta/discover/domain/usecase/ref/friend_usecases.dart'
    as _i44;
import 'package:zheeta/discover/domain/usecase/ref/match_criteria_usecases.dart'
    as _i43;
import 'package:zheeta/discover/presentation/bloc/matches_cubit.dart' as _i98;
import 'package:zheeta/discover/presentation/viewmodel/friend_request_viewmodel.dart'
    as _i7;
import 'package:zheeta/discover/presentation/viewmodel/match_criteria_viewmodel.dart'
    as _i8;
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
    as _i84;
import 'package:zheeta/profile/data/datasource/location_datasource.dart'
    as _i27;
import 'package:zheeta/profile/data/datasource/prod/access_restriction_datasource_impl.dart'
    as _i85;
import 'package:zheeta/profile/data/datasource/prod/location_datasource_impl.dart'
    as _i28;
import 'package:zheeta/profile/data/datasource/prod/user_bank_account_datasource_impl.dart'
    as _i51;
import 'package:zheeta/profile/data/datasource/prod/user_interest_datasource_impl.dart'
    as _i55;
import 'package:zheeta/profile/data/datasource/prod/user_profile_access_datasource_impl.dart'
    as _i63;
import 'package:zheeta/profile/data/datasource/prod/user_profile_boost_datasource_impl.dart'
    as _i67;
import 'package:zheeta/profile/data/datasource/prod/user_profile_datasource_impl.dart'
    as _i71;
import 'package:zheeta/profile/data/datasource/prod/user_search_datasource_impl.dart'
    as _i75;
import 'package:zheeta/profile/data/datasource/prod/user_transaction_datasource_impl.dart'
    as _i79;
import 'package:zheeta/profile/data/datasource/user_bank_account_datasource.dart'
    as _i50;
import 'package:zheeta/profile/data/datasource/user_interest_datasource.dart'
    as _i54;
import 'package:zheeta/profile/data/datasource/user_profile_access_datasource.dart'
    as _i62;
import 'package:zheeta/profile/data/datasource/user_profile_boost_datasource.dart'
    as _i66;
import 'package:zheeta/profile/data/datasource/user_profile_datasource.dart'
    as _i70;
import 'package:zheeta/profile/data/datasource/user_search_datasource.dart'
    as _i74;
import 'package:zheeta/profile/data/datasource/user_transaction_datasource.dart'
    as _i78;
import 'package:zheeta/profile/data/repository/prod/access_restriction_repository_impl.dart'
    as _i87;
import 'package:zheeta/profile/data/repository/prod/location_repository_impl.dart'
    as _i30;
import 'package:zheeta/profile/data/repository/prod/user_bank_account_repository_impl.dart'
    as _i53;
import 'package:zheeta/profile/data/repository/prod/user_interest_repository_impl.dart'
    as _i57;
import 'package:zheeta/profile/data/repository/prod/user_profile_access_repository_impl.dart'
    as _i65;
import 'package:zheeta/profile/data/repository/prod/user_profile_boost_repository_impl.dart'
    as _i69;
import 'package:zheeta/profile/data/repository/prod/user_profile_repository_impl.dart'
    as _i73;
import 'package:zheeta/profile/data/repository/prod/user_search_repository_impl.dart'
    as _i77;
import 'package:zheeta/profile/data/repository/prod/user_transaction_repository_impl.dart'
    as _i81;
import 'package:zheeta/profile/domain/repository/access_restriction_repository.dart'
    as _i86;
import 'package:zheeta/profile/domain/repository/location_repository.dart'
    as _i29;
import 'package:zheeta/profile/domain/repository/user_bank_account_repository.dart'
    as _i52;
import 'package:zheeta/profile/domain/repository/user_interest_repository.dart'
    as _i56;
import 'package:zheeta/profile/domain/repository/user_profile_access_repository.dart'
    as _i64;
import 'package:zheeta/profile/domain/repository/user_profile_boost_repository.dart'
    as _i68;
import 'package:zheeta/profile/domain/repository/user_profile_repository.dart'
    as _i72;
import 'package:zheeta/profile/domain/repository/user_search_repository.dart'
    as _i76;
import 'package:zheeta/profile/domain/repository/user_transaction_repository.dart'
    as _i80;
import 'package:zheeta/profile/domain/usecase/access_restriction_usecase.dart'
    as _i88;
import 'package:zheeta/profile/domain/usecase/prod/access_restriction_usecase_impl.dart'
    as _i89;
import 'package:zheeta/profile/domain/usecase/ref_usecases/access_restriction_usecases.dart'
    as _i94;
import 'package:zheeta/profile/domain/usecase/ref_usecases/location_usecases.dart'
    as _i96;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_bank_usecases.dart'
    as _i93;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_interest_usecases.dart'
    as _i101;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_access_usecases.dart'
    as _i90;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_boost_usecases.dart'
    as _i92;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_usecases.dart'
    as _i83;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_search_usecases.dart'
    as _i95;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_transaction_usecases.dart'
    as _i97;
import 'package:zheeta/profile/presentation/bloc/profile_cubit.dart' as _i100;
import 'package:zheeta/profile/presentation/viewmodel/about_screen_viewmodel.dart'
    as _i3;
import 'package:zheeta/profile/presentation/viewmodel/user_profile_viewmodel.dart'
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
    gh.lazySingleton<_i8.MatchCriteriaViewModel>(
      () => _i8.MatchCriteriaViewModel(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i9.UserProfileViewModel>(
      () => _i9.UserProfileViewModel(),
      registerFor: {_prod},
    );
    gh.factory<_i10.ApiManager>(
      () => _i11.ApiManagerImpl(gh<_i6.DioModule>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i12.CountryDataSource>(
      () => _i13.CountryDataSourceImpl(
        gh<_i10.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i14.CountryRepository>(
      () => _i15.CountryRepositoryImpl(gh<_i12.CountryDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i16.FriendRequestDataSource>(
      _i17.FriendRequestDataSourceImpl(
        gh<_i10.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i18.FriendRequestRepository>(
      () =>
          _i19.FriendRequestRepositoryImpl(gh<_i16.FriendRequestDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i20.FriendRequestUseCase>(
      () => _i21.FriendRequestUseCaseImpl(gh<_i18.FriendRequestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i22.GetAllCountries>(
      () => _i22.GetAllCountries(gh<_i14.CountryRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i22.GetCountryDetails>(
      () => _i22.GetCountryDetails(gh<_i14.CountryRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i23.IdentityRoleDataSource>(
      () => _i24.IdentityRoleDataSourceImpl(
        gh<_i10.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i25.IdentityRoleRepository>(
      () => _i26.IdentityRoleRepositoryImpl(gh<_i23.IdentityRoleDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i27.LocationDataSource>(
      _i28.LocationDataSourceImpl(
        gh<_i10.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i29.LocationRepository>(
      () => _i30.LocationRepositoryImpl(gh<_i27.LocationDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i31.MatchCriteriaDataSource>(
      _i32.MatchCriteriaDataSourceImpl(
        gh<_i10.ApiManager>(),
        gh<_i4.Api>(),
      ),
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
      _i38.NotificationDataSourceImpl(gh<_i10.ApiManager>()),
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
    gh.lazySingleton<_i43.PopulateMatches>(
      () => _i43.PopulateMatches(gh<_i33.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i44.SendFriendRequest>(
      () => _i44.SendFriendRequest(gh<_i18.FriendRequestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i43.UpdateMatchCriteria>(
      () => _i43.UpdateMatchCriteria(gh<_i33.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i45.UpgradeUserRole>(
      () => _i45.UpgradeUserRole(gh<_i25.IdentityRoleRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i46.UserAuthDataSource>(
      () => _i47.UserAuthDataSourceImpl(
        gh<_i10.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i48.UserAuthRepository>(
      () => _i49.UserAuthRepositoryImpl(gh<_i46.UserAuthDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i50.UserBankAccountDataSource>(
      _i51.UserBankAccountDataSourceImpl(
        gh<_i10.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i52.UserBankAccountRepository>(
      () => _i53.UserBankAccountRepositoryImpl(
          gh<_i50.UserBankAccountDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i54.UserInterestDataSource>(
      _i55.UserInterestDataSourceImpl(
        gh<_i10.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i56.UserInterestRepository>(
      () => _i57.UserInterestRepositoryImpl(gh<_i54.UserInterestDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i58.UserOtpDataSource>(
      () => _i59.UserOtpDataSourceImpl(
        gh<_i10.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i60.UserOtpRepository>(
      () => _i61.UserOtpRepositoryImpl(gh<_i58.UserOtpDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i62.UserProfileAccessDataSource>(
      _i63.UserProfileAccessDataSourceImpl(
        gh<_i10.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i64.UserProfileAccessRepository>(
      () => _i65.UserProfileAccessRepositoryImpl(
          gh<_i62.UserProfileAccessDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i66.UserProfileBoostDataSource>(
      _i67.UserProfileBoostDataSourceImpl(
        gh<_i10.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i68.UserProfileBoostRepository>(
      () => _i69.UserProfileBoostRepositoryImpl(
          gh<_i66.UserProfileBoostDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i70.UserProfileDataSource>(
      _i71.UserProfileDataSourceImpl(
        gh<_i10.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i72.UserProfileRepository>(
      () => _i73.UserProfileRepositoryImpl(gh<_i70.UserProfileDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i74.UserSearchDataSource>(
      _i75.UserSearchDataSourceImpl(
        gh<_i10.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i76.UserSearchRepository>(
      () => _i77.UserSearchRepositorImpl(gh<_i74.UserSearchDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i78.UserTransactionDataSource>(
      _i79.UserTransactionDataSourceImpl(
        gh<_i10.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i80.UserTransactionRepository>(
      () => _i81.UserTransactionRepositoryImpl(
          gh<_i78.UserTransactionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i82.VerifyEmailOtp>(
      () => _i82.VerifyEmailOtp(gh<_i60.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i82.VerifyPhoneOtp>(
      () => _i82.VerifyPhoneOtp(gh<_i60.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i83.VisitUserProfile>(
      () => _i83.VisitUserProfile(gh<_i72.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i84.AccessRestrictionDataSource>(
      _i85.AccessRestrictionDataSourceImpl(
        gh<_i10.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i86.AccessRestrictionRepository>(
      () => _i87.AccessRestrictionRepositoryImpl(
          gh<_i84.AccessRestrictionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i88.AccessRestrictionUseCase>(
      () => _i89.AccessRestrictionUseCaseImpl(
          gh<_i86.AccessRestrictionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i90.BlockAccount>(
      () => _i90.BlockAccount(gh<_i64.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i91.ChangePassword>(
      () => _i91.ChangePassword(gh<_i48.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i83.CreateProfile>(
      () => _i83.CreateProfile(gh<_i72.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i92.CreateProfileBoost>(
      () => _i92.CreateProfileBoost(gh<_i68.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i93.CreateUpdateBankAccount>(
      () => _i93.CreateUpdateBankAccount(gh<_i52.UserBankAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i94.DisableAccount>(
      () => _i94.DisableAccount(gh<_i86.AccessRestrictionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i45.DowngradeUserRole>(
      () => _i45.DowngradeUserRole(gh<_i25.IdentityRoleRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i94.EnableAccount>(
      () => _i94.EnableAccount(gh<_i86.AccessRestrictionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i95.FindUserByAdminEmail>(
      () => _i95.FindUserByAdminEmail(gh<_i76.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i95.FindUserByAdminUsername>(
      () => _i95.FindUserByAdminUsername(gh<_i76.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i96.GetAddressFromLocationCoordinate>(
      () =>
          _i96.GetAddressFromLocationCoordinate(gh<_i29.LocationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i83.GetAllUsersProfile>(
      () => _i83.GetAllUsersProfile(gh<_i72.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i90.GetBlockedUsers>(
      () => _i90.GetBlockedUsers(gh<_i64.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i92.GetBoostedProfileByAdmin>(
      () =>
          _i92.GetBoostedProfileByAdmin(gh<_i68.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i96.GetLocationCoordinateFromAddress>(
      () =>
          _i96.GetLocationCoordinateFromAddress(gh<_i29.LocationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i43.GetMatchCriteria>(
      () => _i43.GetMatchCriteria(gh<_i33.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i92.GetMatchedProfileBoost>(
      () => _i92.GetMatchedProfileBoost(gh<_i68.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i43.GetMatches>(
      () => _i43.GetMatches(gh<_i33.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i83.GetSingleUserProfile>(
      () => _i83.GetSingleUserProfile(gh<_i72.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i93.GetUserBankAccount>(
      () => _i93.GetUserBankAccount(gh<_i52.UserBankAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i83.GetUserRecentActivity>(
      () => _i83.GetUserRecentActivity(gh<_i72.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i97.GetUserTransactions>(
      () => _i97.GetUserTransactions(gh<_i80.UserTransactionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i91.LoginOAuth>(
      () => _i91.LoginOAuth(gh<_i48.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i91.LoginUser>(
      () => _i91.LoginUser(gh<_i48.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i98.MatchesCubit>(
      () => _i98.MatchesCubit(
        sendFriendRequest: gh<_i44.SendFriendRequest>(),
        getMatchCriteria: gh<_i43.GetMatchCriteria>(),
        getMatches: gh<_i43.GetMatches>(),
        populateMatches: gh<_i43.PopulateMatches>(),
        updateMatchCriteria: gh<_i43.UpdateMatchCriteria>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i91.RegisterStaff>(
      () => _i91.RegisterStaff(gh<_i48.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i91.RegisterUser>(
      () => _i91.RegisterUser(gh<_i48.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i91.ResetPassword>(
      () => _i91.ResetPassword(gh<_i48.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i95.SearchUserByCustomer>(
      () => _i95.SearchUserByCustomer(gh<_i76.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i82.SendEmailVerifyOtp>(
      () => _i82.SendEmailVerifyOtp(gh<_i60.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i82.SendPasswordResetOtp>(
      () => _i82.SendPasswordResetOtp(gh<_i60.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i82.SendPhoneVerifyOtp>(
      () => _i82.SendPhoneVerifyOtp(gh<_i60.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i90.UnBlockAccount>(
      () => _i90.UnBlockAccount(gh<_i64.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i83.UpdateUserProfile>(
      () => _i83.UpdateUserProfile(gh<_i72.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i83.UpdateUserProfilePicture>(
      () => _i83.UpdateUserProfilePicture(gh<_i72.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i99.AuthenticationCubit>(
      () => _i99.AuthenticationCubit(
        getAllCountries: gh<_i22.GetAllCountries>(),
        getCountryDetails: gh<_i22.GetCountryDetails>(),
        upgradeUserRole: gh<_i45.UpgradeUserRole>(),
        downgradeUserRole: gh<_i45.DowngradeUserRole>(),
        registerUser: gh<_i91.RegisterUser>(),
        loginUser: gh<_i91.LoginUser>(),
        registerStaff: gh<_i91.RegisterStaff>(),
        changePassword: gh<_i91.ChangePassword>(),
        resetPassword: gh<_i91.ResetPassword>(),
        loginOAuth: gh<_i91.LoginOAuth>(),
        sendPasswordResetOtp: gh<_i82.SendPasswordResetOtp>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i100.ProfileCubit>(
      () => _i100.ProfileCubit(
        disableAccount: gh<_i94.DisableAccount>(),
        enableAccount: gh<_i94.EnableAccount>(),
        getAddressFromLocationCoordinate:
            gh<_i96.GetAddressFromLocationCoordinate>(),
        getLocationCoordinateFromAddress:
            gh<_i96.GetLocationCoordinateFromAddress>(),
        createUpdateBankAccount: gh<_i93.CreateUpdateBankAccount>(),
        getUserBankAccount: gh<_i93.GetUserBankAccount>(),
        getInterests: gh<_i101.GetInterests>(),
        updateUserInterest: gh<_i101.UpdateUserInterest>(),
        blockAccount: gh<_i90.BlockAccount>(),
        getBlockedUsers: gh<_i90.GetBlockedUsers>(),
        unBlockAccount: gh<_i90.UnBlockAccount>(),
        createProfileBoost: gh<_i92.CreateProfileBoost>(),
        getBoostedProfileByAdmin: gh<_i92.GetBoostedProfileByAdmin>(),
        getMatchedProfileBoost: gh<_i92.GetMatchedProfileBoost>(),
        createProfile: gh<_i83.CreateProfile>(),
        getAllUsersProfile: gh<_i83.GetAllUsersProfile>(),
        getSingleUserProfile: gh<_i83.GetSingleUserProfile>(),
        getUserRecentActivity: gh<_i83.GetUserRecentActivity>(),
        updateUserProfilePicture: gh<_i83.UpdateUserProfilePicture>(),
        updateUserProfile: gh<_i83.UpdateUserProfile>(),
        visitUserProfile: gh<_i83.VisitUserProfile>(),
        findUserByAdminEmail: gh<_i95.FindUserByAdminEmail>(),
        findUserByAdminUsername: gh<_i95.FindUserByAdminUsername>(),
        searchUserByCustomer: gh<_i95.SearchUserByCustomer>(),
        getUserTransactions: gh<_i97.GetUserTransactions>(),
      ),
      registerFor: {_prod},
    );
    return this;
  }
}
