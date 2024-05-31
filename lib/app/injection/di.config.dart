// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:zheeta/app/api/api_manager.dart' as _i18;
import 'package:zheeta/app/api/api_manager_refactored.dart' as _i4;
import 'package:zheeta/app/api/dio_module.dart' as _i6;
import 'package:zheeta/app/api/prod/api_manager_impl.dart' as _i19;
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
    as _i20;
import 'package:zheeta/authentication/data/datasource/identity_role_datasource.dart'
    as _i31;
import 'package:zheeta/authentication/data/datasource/prod/country_datasource_impl.dart'
    as _i21;
import 'package:zheeta/authentication/data/datasource/prod/identity_role_datasource_impl.dart'
    as _i32;
import 'package:zheeta/authentication/data/datasource/prod/user_auth_datasource_impl.dart'
    as _i57;
import 'package:zheeta/authentication/data/datasource/prod/user_otp_datasource_impl.dart'
    as _i69;
import 'package:zheeta/authentication/data/datasource/user_auth_datasource.dart'
    as _i56;
import 'package:zheeta/authentication/data/datasource/user_otp_datasource.dart'
    as _i68;
import 'package:zheeta/authentication/data/repository/prod/country_repository_impl.dart'
    as _i23;
import 'package:zheeta/authentication/data/repository/prod/identity_role_repository_impl.dart'
    as _i34;
import 'package:zheeta/authentication/data/repository/prod/user_auth_repository_impl.dart'
    as _i59;
import 'package:zheeta/authentication/data/repository/prod/user_otp_repository_impl.dart'
    as _i71;
import 'package:zheeta/authentication/domain/repository/country_repository.dart'
    as _i22;
import 'package:zheeta/authentication/domain/repository/identity_role_repository.dart'
    as _i33;
import 'package:zheeta/authentication/domain/repository/user_auth_repository.dart'
    as _i58;
import 'package:zheeta/authentication/domain/repository/user_otp_repository.dart'
    as _i70;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/country/country_usecases.dart'
    as _i30;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/identity/identity_usecases.dart'
    as _i55;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/user_auth/user_auth_usecases.dart'
    as _i101;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/user_otp/user_otp_usecases.dart'
    as _i92;
import 'package:zheeta/authentication/presentation/bloc/authentication_bloc.dart'
    as _i113;
import 'package:zheeta/authentication/presentation/viewmodel/user_auth_viewmodel.dart'
    as _i15;
import 'package:zheeta/authentication/presentation/viewmodel/user_otp_viewmodel.dart'
    as _i16;
import 'package:zheeta/discover/data/datasource/friend_request_datasource.dart'
    as _i24;
import 'package:zheeta/discover/data/datasource/match_criteria_datasource.dart'
    as _i39;
import 'package:zheeta/discover/data/datasource/nearby_datasource.dart' as _i13;
import 'package:zheeta/discover/data/datasource/prod/friend_request_datasource_impl.dart'
    as _i25;
import 'package:zheeta/discover/data/datasource/prod/match_criteria_datasource_impl.dart'
    as _i40;
import 'package:zheeta/discover/data/datasource/prod/nearby_datasource_impl.dart'
    as _i14;
import 'package:zheeta/discover/data/repository/prod/friend_request_repository_impl.dart'
    as _i27;
import 'package:zheeta/discover/data/repository/prod/match_criteria_repository_impl.dart'
    as _i42;
import 'package:zheeta/discover/data/repository/prod/nearby_profile_repository_impl.dart'
    as _i46;
import 'package:zheeta/discover/domain/repository/friend_request_repository.dart'
    as _i26;
import 'package:zheeta/discover/domain/repository/match_criteria_repository.dart'
    as _i41;
import 'package:zheeta/discover/domain/repository/populate_nearby_repository.dart'
    as _i45;
import 'package:zheeta/discover/domain/usecase/friend_request_usecase.dart'
    as _i28;
import 'package:zheeta/discover/domain/usecase/match_criteria_usecase.dart'
    as _i43;
import 'package:zheeta/discover/domain/usecase/prod/friend_request_usecase_impl.dart'
    as _i29;
import 'package:zheeta/discover/domain/usecase/prod/match_criteria_usecase_impl.dart'
    as _i44;
import 'package:zheeta/discover/domain/usecase/ref/friend_usecases.dart'
    as _i54;
import 'package:zheeta/discover/domain/usecase/ref/match_criteria_usecases.dart'
    as _i53;
import 'package:zheeta/discover/domain/usecase/ref/nearby_profiles_usecase.dart'
    as _i108;
import 'package:zheeta/discover/presentation/bloc/matches_bloc/matches_cubit.dart'
    as _i110;
import 'package:zheeta/discover/presentation/bloc/nearby_bloc/nearby_cubit.dart'
    as _i111;
import 'package:zheeta/discover/presentation/viewmodel/friend_request_viewmodel.dart'
    as _i7;
import 'package:zheeta/discover/presentation/viewmodel/match_criteria_viewmodel.dart'
    as _i12;
import 'package:zheeta/discover/presentation/viewmodel/nearby_viewmodel.dart'
    as _i112;
import 'package:zheeta/notification/data/datasource/notification_datasource.dart'
    as _i47;
import 'package:zheeta/notification/data/datasource/prod/notification_datasource_impl.dart'
    as _i48;
import 'package:zheeta/notification/data/repository/prod/notification_repository_impl.dart'
    as _i50;
import 'package:zheeta/notification/domain/repository/notification_repository.dart'
    as _i49;
import 'package:zheeta/notification/domain/usecase/notification_usecase.dart'
    as _i51;
import 'package:zheeta/notification/domain/usecase/prod/notification_usecase_impl.dart'
    as _i52;
import 'package:zheeta/profile/data/datasource/access_restriction_datasource.dart'
    as _i94;
import 'package:zheeta/profile/data/datasource/location_datasource.dart'
    as _i35;
import 'package:zheeta/profile/data/datasource/prod/access_restriction_datasource_impl.dart'
    as _i95;
import 'package:zheeta/profile/data/datasource/prod/location_datasource_impl.dart'
    as _i36;
import 'package:zheeta/profile/data/datasource/prod/user_bank_account_datasource_impl.dart'
    as _i61;
import 'package:zheeta/profile/data/datasource/prod/user_interest_datasource_impl.dart'
    as _i65;
import 'package:zheeta/profile/data/datasource/prod/user_profile_access_datasource_impl.dart'
    as _i73;
import 'package:zheeta/profile/data/datasource/prod/user_profile_boost_datasource_impl.dart'
    as _i77;
import 'package:zheeta/profile/data/datasource/prod/user_profile_datasource_impl.dart'
    as _i81;
import 'package:zheeta/profile/data/datasource/prod/user_search_datasource_impl.dart'
    as _i85;
import 'package:zheeta/profile/data/datasource/prod/user_transaction_datasource_impl.dart'
    as _i89;
import 'package:zheeta/profile/data/datasource/user_bank_account_datasource.dart'
    as _i60;
import 'package:zheeta/profile/data/datasource/user_interest_datasource.dart'
    as _i64;
import 'package:zheeta/profile/data/datasource/user_profile_access_datasource.dart'
    as _i72;
import 'package:zheeta/profile/data/datasource/user_profile_boost_datasource.dart'
    as _i76;
import 'package:zheeta/profile/data/datasource/user_profile_datasource.dart'
    as _i80;
import 'package:zheeta/profile/data/datasource/user_search_datasource.dart'
    as _i84;
import 'package:zheeta/profile/data/datasource/user_transaction_datasource.dart'
    as _i88;
import 'package:zheeta/profile/data/repository/prod/access_restriction_repository_impl.dart'
    as _i97;
import 'package:zheeta/profile/data/repository/prod/location_repository_impl.dart'
    as _i38;
import 'package:zheeta/profile/data/repository/prod/user_bank_account_repository_impl.dart'
    as _i63;
import 'package:zheeta/profile/data/repository/prod/user_interest_repository_impl.dart'
    as _i67;
import 'package:zheeta/profile/data/repository/prod/user_profile_access_repository_impl.dart'
    as _i75;
import 'package:zheeta/profile/data/repository/prod/user_profile_boost_repository_impl.dart'
    as _i79;
import 'package:zheeta/profile/data/repository/prod/user_profile_repository_impl.dart'
    as _i83;
import 'package:zheeta/profile/data/repository/prod/user_search_repository_impl.dart'
    as _i87;
import 'package:zheeta/profile/data/repository/prod/user_transaction_repository_impl.dart'
    as _i91;
import 'package:zheeta/profile/domain/repository/access_restriction_repository.dart'
    as _i96;
import 'package:zheeta/profile/domain/repository/location_repository.dart'
    as _i37;
import 'package:zheeta/profile/domain/repository/user_bank_account_repository.dart'
    as _i62;
import 'package:zheeta/profile/domain/repository/user_interest_repository.dart'
    as _i66;
import 'package:zheeta/profile/domain/repository/user_profile_access_repository.dart'
    as _i74;
import 'package:zheeta/profile/domain/repository/user_profile_boost_repository.dart'
    as _i78;
import 'package:zheeta/profile/domain/repository/user_profile_repository.dart'
    as _i82;
import 'package:zheeta/profile/domain/repository/user_search_repository.dart'
    as _i86;
import 'package:zheeta/profile/domain/repository/user_transaction_repository.dart'
    as _i90;
import 'package:zheeta/profile/domain/usecase/access_restriction_usecase.dart'
    as _i98;
import 'package:zheeta/profile/domain/usecase/prod/access_restriction_usecase_impl.dart'
    as _i99;
import 'package:zheeta/profile/domain/usecase/ref_usecases/access_restriction_usecases.dart'
    as _i104;
import 'package:zheeta/profile/domain/usecase/ref_usecases/location_usecases.dart'
    as _i106;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_bank_usecases.dart'
    as _i103;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_interest_usecases.dart'
    as _i107;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_access_usecases.dart'
    as _i100;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_boost_usecases.dart'
    as _i102;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_usecases.dart'
    as _i93;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_search_usecases.dart'
    as _i105;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_transaction_usecases.dart'
    as _i109;
import 'package:zheeta/profile/presentation/bloc/profile_cubit.dart' as _i114;
import 'package:zheeta/profile/presentation/viewmodel/about_screen_viewmodel.dart'
    as _i3;
import 'package:zheeta/profile/presentation/viewmodel/user_profile_viewmodel.dart'
    as _i17;

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
    gh.singleton<_i13.NearbyDataSource>(
      _i14.NearbyDataSourceImpl(gh<_i4.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i15.UserAuthViewModel>(
      () => _i15.UserAuthViewModel(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i16.UserOtpViewModel>(
      () => _i16.UserOtpViewModel(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i17.UserProfileViewModel>(
      () => _i17.UserProfileViewModel(),
      registerFor: {_prod},
    );
    gh.factory<_i18.ApiManager>(
      () => _i19.ApiManagerImpl(gh<_i6.DioModule>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i20.CountryDataSource>(
      () => _i21.CountryDataSourceImpl(
        gh<_i18.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i22.CountryRepository>(
      () => _i23.CountryRepositoryImpl(gh<_i20.CountryDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i24.FriendRequestDataSource>(
      _i25.FriendRequestDataSourceImpl(
        gh<_i18.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i26.FriendRequestRepository>(
      () =>
          _i27.FriendRequestRepositoryImpl(gh<_i24.FriendRequestDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i28.FriendRequestUseCase>(
      () => _i29.FriendRequestUseCaseImpl(gh<_i26.FriendRequestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i30.GetAllCountries>(
      () => _i30.GetAllCountries(gh<_i22.CountryRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i30.GetCountryDetails>(
      () => _i30.GetCountryDetails(gh<_i22.CountryRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i31.IdentityRoleDataSource>(
      () => _i32.IdentityRoleDataSourceImpl(
        gh<_i18.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i33.IdentityRoleRepository>(
      () => _i34.IdentityRoleRepositoryImpl(gh<_i31.IdentityRoleDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i35.LocationDataSource>(
      _i36.LocationDataSourceImpl(
        gh<_i18.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i37.LocationRepository>(
      () => _i38.LocationRepositoryImpl(gh<_i35.LocationDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i39.MatchCriteriaDataSource>(
      _i40.MatchCriteriaDataSourceImpl(
        gh<_i18.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i41.MatchCriteriaRepository>(
      () =>
          _i42.MatchCriteriaRepositoryImpl(gh<_i39.MatchCriteriaDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i43.MatchCriteriaUseCase>(
      () => _i44.MatchCriteriaUseCaseImpl(gh<_i41.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i45.NearbyDataRepository>(
      () => _i46.NearbyDataRepositoryImpl(gh<_i13.NearbyDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i47.NotificationDataSource>(
      _i48.NotificationDataSourceImpl(gh<_i18.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i49.NotificationRepository>(
      () => _i50.NotificationRepositoryImpl(gh<_i47.NotificationDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i51.NotificationUseCase>(
      () => _i52.NotificationUseCaseImpl(gh<_i49.NotificationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i53.PopulateMatches>(
      () => _i53.PopulateMatches(gh<_i41.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i54.SendFriendRequest>(
      () => _i54.SendFriendRequest(gh<_i26.FriendRequestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i53.UpdateMatchCriteria>(
      () => _i53.UpdateMatchCriteria(gh<_i41.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i55.UpgradeUserRole>(
      () => _i55.UpgradeUserRole(gh<_i33.IdentityRoleRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i56.UserAuthDataSource>(
      () => _i57.UserAuthDataSourceImpl(
        gh<_i18.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i58.UserAuthRepository>(
      () => _i59.UserAuthRepositoryImpl(
        gh<_i56.UserAuthDataSource>(),
        gh<_i10.IUserStorage>(),
        gh<_i8.ITokenStorage>(),
      ),
      registerFor: {_prod},
    );
    gh.singleton<_i60.UserBankAccountDataSource>(
      _i61.UserBankAccountDataSourceImpl(
        gh<_i18.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i62.UserBankAccountRepository>(
      () => _i63.UserBankAccountRepositoryImpl(
          gh<_i60.UserBankAccountDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i64.UserInterestDataSource>(
      _i65.UserInterestDataSourceImpl(
        gh<_i18.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i66.UserInterestRepository>(
      () => _i67.UserInterestRepositoryImpl(gh<_i64.UserInterestDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i68.UserOtpDataSource>(
      () => _i69.UserOtpDataSourceImpl(
        gh<_i18.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i70.UserOtpRepository>(
      () => _i71.UserOtpRepositoryImpl(gh<_i68.UserOtpDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i72.UserProfileAccessDataSource>(
      _i73.UserProfileAccessDataSourceImpl(
        gh<_i18.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i74.UserProfileAccessRepository>(
      () => _i75.UserProfileAccessRepositoryImpl(
          gh<_i72.UserProfileAccessDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i76.UserProfileBoostDataSource>(
      _i77.UserProfileBoostDataSourceImpl(
        gh<_i18.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i78.UserProfileBoostRepository>(
      () => _i79.UserProfileBoostRepositoryImpl(
          gh<_i76.UserProfileBoostDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i80.UserProfileDataSource>(
      _i81.UserProfileDataSourceImpl(
        gh<_i18.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i82.UserProfileRepository>(
      () => _i83.UserProfileRepositoryImpl(gh<_i80.UserProfileDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i84.UserSearchDataSource>(
      _i85.UserSearchDataSourceImpl(
        gh<_i18.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i86.UserSearchRepository>(
      () => _i87.UserSearchRepositorImpl(gh<_i84.UserSearchDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i88.UserTransactionDataSource>(
      _i89.UserTransactionDataSourceImpl(
        gh<_i18.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i90.UserTransactionRepository>(
      () => _i91.UserTransactionRepositoryImpl(
          gh<_i88.UserTransactionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i92.VerifyEmailOtp>(
      () => _i92.VerifyEmailOtp(gh<_i70.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i92.VerifyPhoneOtp>(
      () => _i92.VerifyPhoneOtp(gh<_i70.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i93.VisitUserProfile>(
      () => _i93.VisitUserProfile(gh<_i82.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i94.AccessRestrictionDataSource>(
      _i95.AccessRestrictionDataSourceImpl(
        gh<_i18.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i96.AccessRestrictionRepository>(
      () => _i97.AccessRestrictionRepositoryImpl(
          gh<_i94.AccessRestrictionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i98.AccessRestrictionUseCase>(
      () => _i99.AccessRestrictionUseCaseImpl(
          gh<_i96.AccessRestrictionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i100.BlockAccount>(
      () => _i100.BlockAccount(gh<_i74.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i101.ChangePassword>(
      () => _i101.ChangePassword(gh<_i58.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i93.CreateProfile>(
      () => _i93.CreateProfile(gh<_i82.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i102.CreateProfileBoost>(
      () => _i102.CreateProfileBoost(gh<_i78.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i103.CreateUpdateBankAccount>(
      () => _i103.CreateUpdateBankAccount(gh<_i62.UserBankAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i104.DisableAccount>(
      () => _i104.DisableAccount(gh<_i96.AccessRestrictionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i55.DowngradeUserRole>(
      () => _i55.DowngradeUserRole(gh<_i33.IdentityRoleRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i104.EnableAccount>(
      () => _i104.EnableAccount(gh<_i96.AccessRestrictionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i105.FindUserByAdminEmail>(
      () => _i105.FindUserByAdminEmail(gh<_i86.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i105.FindUserByAdminUsername>(
      () => _i105.FindUserByAdminUsername(gh<_i86.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i106.GetAddressFromLocationCoordinate>(
      () =>
          _i106.GetAddressFromLocationCoordinate(gh<_i37.LocationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i93.GetAllUsersProfile>(
      () => _i93.GetAllUsersProfile(gh<_i82.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i100.GetBlockedUsers>(
      () => _i100.GetBlockedUsers(gh<_i74.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i102.GetBoostedProfileByAdmin>(
      () =>
          _i102.GetBoostedProfileByAdmin(gh<_i78.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i107.GetInterests>(
      () => _i107.GetInterests(gh<_i66.UserInterestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i106.GetLocationCoordinateFromAddress>(
      () =>
          _i106.GetLocationCoordinateFromAddress(gh<_i37.LocationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i53.GetMatchCriteria>(
      () => _i53.GetMatchCriteria(gh<_i41.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i102.GetMatchedProfileBoost>(
      () => _i102.GetMatchedProfileBoost(gh<_i78.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i53.GetMatches>(
      () => _i53.GetMatches(gh<_i41.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i108.GetNearbyProfiles>(
      () => _i108.GetNearbyProfiles(gh<_i45.NearbyDataRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i93.GetSingleUserProfile>(
      () => _i93.GetSingleUserProfile(gh<_i82.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i103.GetUserBankAccount>(
      () => _i103.GetUserBankAccount(gh<_i62.UserBankAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i93.GetUserRecentActivity>(
      () => _i93.GetUserRecentActivity(gh<_i82.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i109.GetUserTransactions>(
      () => _i109.GetUserTransactions(gh<_i90.UserTransactionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i101.LoginOAuth>(
      () => _i101.LoginOAuth(gh<_i58.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i101.LoginUser>(
      () => _i101.LoginUser(gh<_i58.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i110.MatchesCubit>(
      () => _i110.MatchesCubit(
        sendFriendRequest: gh<_i54.SendFriendRequest>(),
        getMatchCriteria: gh<_i53.GetMatchCriteria>(),
        getMatches: gh<_i53.GetMatches>(),
        populateMatches: gh<_i53.PopulateMatches>(),
        updateMatchCriteria: gh<_i53.UpdateMatchCriteria>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i111.NearbyCubit>(
      () => _i111.NearbyCubit(getNearbyProfiles: gh<_i108.GetNearbyProfiles>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i112.NearbyViewModel>(
      () => _i112.NearbyViewModel(gh<_i111.NearbyCubit>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i101.RegisterStaff>(
      () => _i101.RegisterStaff(gh<_i58.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i101.RegisterUser>(
      () => _i101.RegisterUser(gh<_i58.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i101.ResetPassword>(
      () => _i101.ResetPassword(gh<_i58.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i105.SearchUserByCustomer>(
      () => _i105.SearchUserByCustomer(gh<_i86.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i92.SendEmailVerifyOtp>(
      () => _i92.SendEmailVerifyOtp(gh<_i70.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i92.SendPasswordResetOtp>(
      () => _i92.SendPasswordResetOtp(gh<_i70.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i92.SendPhoneVerifyOtp>(
      () => _i92.SendPhoneVerifyOtp(gh<_i70.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i100.UnBlockAccount>(
      () => _i100.UnBlockAccount(gh<_i74.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i107.UpdateUserInterest>(
      () => _i107.UpdateUserInterest(gh<_i66.UserInterestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i93.UpdateUserProfile>(
      () => _i93.UpdateUserProfile(gh<_i82.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i93.UpdateUserProfilePicture>(
      () => _i93.UpdateUserProfilePicture(gh<_i82.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i113.AuthenticationCubit>(
      () => _i113.AuthenticationCubit(
        getAllCountries: gh<_i30.GetAllCountries>(),
        getCountryDetails: gh<_i30.GetCountryDetails>(),
        upgradeUserRole: gh<_i55.UpgradeUserRole>(),
        downgradeUserRole: gh<_i55.DowngradeUserRole>(),
        registerUser: gh<_i101.RegisterUser>(),
        loginUser: gh<_i101.LoginUser>(),
        registerStaff: gh<_i101.RegisterStaff>(),
        changePassword: gh<_i101.ChangePassword>(),
        resetPassword: gh<_i101.ResetPassword>(),
        loginOAuth: gh<_i101.LoginOAuth>(),
        sendPasswordResetOtp: gh<_i92.SendPasswordResetOtp>(),
        sendEmailVerifyOtp: gh<_i92.SendEmailVerifyOtp>(),
        sendPhoneVerifyOtp: gh<_i92.SendPhoneVerifyOtp>(),
        verifyPhoneOtp: gh<_i92.VerifyPhoneOtp>(),
        verifyEmailOtp: gh<_i92.VerifyEmailOtp>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i114.ProfileCubit>(
      () => _i114.ProfileCubit(
        disableAccount: gh<_i104.DisableAccount>(),
        enableAccount: gh<_i104.EnableAccount>(),
        getAddressFromLocationCoordinate:
            gh<_i106.GetAddressFromLocationCoordinate>(),
        getLocationCoordinateFromAddress:
            gh<_i106.GetLocationCoordinateFromAddress>(),
        createUpdateBankAccount: gh<_i103.CreateUpdateBankAccount>(),
        getUserBankAccount: gh<_i103.GetUserBankAccount>(),
        getInterests: gh<_i107.GetInterests>(),
        updateUserInterest: gh<_i107.UpdateUserInterest>(),
        blockAccount: gh<_i100.BlockAccount>(),
        getBlockedUsers: gh<_i100.GetBlockedUsers>(),
        unBlockAccount: gh<_i100.UnBlockAccount>(),
        createProfileBoost: gh<_i102.CreateProfileBoost>(),
        getBoostedProfileByAdmin: gh<_i102.GetBoostedProfileByAdmin>(),
        getMatchedProfileBoost: gh<_i102.GetMatchedProfileBoost>(),
        createProfile: gh<_i93.CreateProfile>(),
        getAllUsersProfile: gh<_i93.GetAllUsersProfile>(),
        getSingleUserProfile: gh<_i93.GetSingleUserProfile>(),
        getUserRecentActivity: gh<_i93.GetUserRecentActivity>(),
        updateUserProfilePicture: gh<_i93.UpdateUserProfilePicture>(),
        updateUserProfile: gh<_i93.UpdateUserProfile>(),
        visitUserProfile: gh<_i93.VisitUserProfile>(),
        findUserByAdminEmail: gh<_i105.FindUserByAdminEmail>(),
        findUserByAdminUsername: gh<_i105.FindUserByAdminUsername>(),
        searchUserByCustomer: gh<_i105.SearchUserByCustomer>(),
        getUserTransactions: gh<_i109.GetUserTransactions>(),
      ),
      registerFor: {_prod},
    );
    return this;
  }
}
