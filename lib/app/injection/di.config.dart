// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:zheeta/app/api/api_manager.dart' as _i33;
import 'package:zheeta/app/api/api_manager_refactored.dart' as _i4;
import 'package:zheeta/app/api/dio_module.dart' as _i6;
import 'package:zheeta/app/api/prod/api_manager_impl.dart' as _i34;
import 'package:zheeta/app/common/storage/token_storage/i_token_storage.dart'
    as _i12;
import 'package:zheeta/app/common/storage/token_storage/token_storage.dart'
    as _i13;
import 'package:zheeta/app/common/storage/user_storage/i_user_storage.dart'
    as _i14;
import 'package:zheeta/app/common/storage/user_storage/user_storage.dart'
    as _i15;
import 'package:zheeta/app/router/app_router.dart' as _i5;
import 'package:zheeta/authentication/data/datasource/country_datasource.dart'
    as _i35;
import 'package:zheeta/authentication/data/datasource/identity_role_datasource.dart'
    as _i52;
import 'package:zheeta/authentication/data/datasource/prod/country_datasource_impl.dart'
    as _i36;
import 'package:zheeta/authentication/data/datasource/prod/identity_role_datasource_impl.dart'
    as _i53;
import 'package:zheeta/authentication/data/datasource/prod/user_auth_datasource_impl.dart'
    as _i80;
import 'package:zheeta/authentication/data/datasource/prod/user_otp_datasource_impl.dart'
    as _i92;
import 'package:zheeta/authentication/data/datasource/user_auth_datasource.dart'
    as _i79;
import 'package:zheeta/authentication/data/datasource/user_otp_datasource.dart'
    as _i91;
import 'package:zheeta/authentication/data/repository/prod/country_repository_impl.dart'
    as _i38;
import 'package:zheeta/authentication/data/repository/prod/identity_role_repository_impl.dart'
    as _i55;
import 'package:zheeta/authentication/data/repository/prod/user_auth_repository_impl.dart'
    as _i82;
import 'package:zheeta/authentication/data/repository/prod/user_otp_repository_impl.dart'
    as _i94;
import 'package:zheeta/authentication/domain/repository/country_repository.dart'
    as _i37;
import 'package:zheeta/authentication/domain/repository/identity_role_repository.dart'
    as _i54;
import 'package:zheeta/authentication/domain/repository/user_auth_repository.dart'
    as _i81;
import 'package:zheeta/authentication/domain/repository/user_otp_repository.dart'
    as _i93;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/country/country_usecases.dart'
    as _i45;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/identity/identity_usecases.dart'
    as _i78;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/user_auth/user_auth_usecases.dart'
    as _i117;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/user_otp/user_otp_usecases.dart'
    as _i111;
import 'package:zheeta/authentication/presentation/bloc/authentication_bloc.dart'
    as _i130;
import 'package:zheeta/authentication/presentation/viewmodel/user_auth_viewmodel.dart'
    as _i25;
import 'package:zheeta/authentication/presentation/viewmodel/user_otp_viewmodel.dart'
    as _i26;
import 'package:zheeta/discover/data/datasource/friend_request_datasource.dart'
    as _i39;
import 'package:zheeta/discover/data/datasource/match_criteria_datasource.dart'
    as _i60;
import 'package:zheeta/discover/data/datasource/nearby_datasource.dart' as _i17;
import 'package:zheeta/discover/data/datasource/prod/friend_request_datasource_impl.dart'
    as _i40;
import 'package:zheeta/discover/data/datasource/prod/match_criteria_datasource_impl.dart'
    as _i61;
import 'package:zheeta/discover/data/datasource/prod/nearby_datasource_impl.dart'
    as _i18;
import 'package:zheeta/discover/data/repository/prod/friend_request_repository_impl.dart'
    as _i42;
import 'package:zheeta/discover/data/repository/prod/match_criteria_repository_impl.dart'
    as _i63;
import 'package:zheeta/discover/data/repository/prod/nearby_profile_repository_impl.dart'
    as _i67;
import 'package:zheeta/discover/domain/repository/friend_request_repository.dart'
    as _i41;
import 'package:zheeta/discover/domain/repository/match_criteria_repository.dart'
    as _i62;
import 'package:zheeta/discover/domain/repository/populate_nearby_repository.dart'
    as _i66;
import 'package:zheeta/discover/domain/usecase/friend_request_usecase.dart'
    as _i43;
import 'package:zheeta/discover/domain/usecase/match_criteria_usecase.dart'
    as _i64;
import 'package:zheeta/discover/domain/usecase/prod/friend_request_usecase_impl.dart'
    as _i44;
import 'package:zheeta/discover/domain/usecase/prod/match_criteria_usecase_impl.dart'
    as _i65;
import 'package:zheeta/discover/domain/usecase/ref/friend_usecases.dart'
    as _i75;
import 'package:zheeta/discover/domain/usecase/ref/match_criteria_usecases.dart'
    as _i74;
import 'package:zheeta/discover/domain/usecase/ref/nearby_profiles_usecase.dart'
    as _i124;
import 'package:zheeta/discover/domain/usecase/ref/nearby_settings_usecase.dart'
    as _i125;
import 'package:zheeta/discover/presentation/bloc/matches_bloc/matches_cubit.dart'
    as _i127;
import 'package:zheeta/discover/presentation/bloc/nearby_bloc/nearby_cubit.dart'
    as _i128;
import 'package:zheeta/discover/presentation/viewmodel/friend_request_viewmodel.dart'
    as _i7;
import 'package:zheeta/discover/presentation/viewmodel/match_criteria_viewmodel.dart'
    as _i16;
import 'package:zheeta/discover/presentation/viewmodel/nearby_viewmodel.dart'
    as _i129;
import 'package:zheeta/feeds/presentation/bloc/feeds_cubit.dart' as _i131;
import 'package:zheeta/feeds/presentation/viewmodel/feeds_viewmodel.dart'
    as _i132;
import 'package:zheeta/gifts/data/datasource/gift_datasource.dart' as _i8;
import 'package:zheeta/gifts/data/datasource/prod/gift_datasource_impl.dart'
    as _i9;
import 'package:zheeta/gifts/data/repository/gift_repository_impl.dart' as _i11;
import 'package:zheeta/gifts/domain/repository/gift_repository.dart' as _i10;
import 'package:zheeta/gifts/domain/usecase/get_gifts_usecase.dart' as _i46;
import 'package:zheeta/gifts/domain/usecase/received_gift_usecase.dart' as _i47;
import 'package:zheeta/gifts/domain/usecase/redeem_gift_usecase.dart' as _i19;
import 'package:zheeta/gifts/domain/usecase/send_gift_usecase.dart' as _i20;
import 'package:zheeta/gifts/domain/usecase/sent_gift_usecase.dart' as _i48;
import 'package:zheeta/gifts/presentation/bloc/gift/gift_cubit.dart' as _i50;
import 'package:zheeta/gifts/presentation/viewmodel/gift_viewmodel.dart'
    as _i51;
import 'package:zheeta/notification/data/datasource/notification_datasource.dart'
    as _i68;
import 'package:zheeta/notification/data/datasource/prod/notification_datasource_impl.dart'
    as _i69;
import 'package:zheeta/notification/data/repository/prod/notification_repository_impl.dart'
    as _i71;
import 'package:zheeta/notification/domain/repository/notification_repository.dart'
    as _i70;
import 'package:zheeta/notification/domain/usecase/notification_usecase.dart'
    as _i72;
import 'package:zheeta/notification/domain/usecase/prod/notification_usecase_impl.dart'
    as _i73;
import 'package:zheeta/payment_and_subscriptions/data/datasource/prod/subscription_datasource_impl.dart'
    as _i22;
import 'package:zheeta/payment_and_subscriptions/data/datasource/subscription_datasource.dart'
    as _i21;
import 'package:zheeta/payment_and_subscriptions/data/repository/subscription_repository_impl.dart'
    as _i24;
import 'package:zheeta/payment_and_subscriptions/domain/repository/subscription_repository.dart'
    as _i23;
import 'package:zheeta/payment_and_subscriptions/domain/usecase/get_subscriptions_usecase.dart'
    as _i49;
import 'package:zheeta/payment_and_subscriptions/presentation/bloc/subscription/subscription_cubit.dart'
    as _i76;
import 'package:zheeta/payment_and_subscriptions/presentation/viewmodel/subscription_viewmodel.dart'
    as _i77;
import 'package:zheeta/profile/data/datasource/access_restriction_datasource.dart'
    as _i112;
import 'package:zheeta/profile/data/datasource/location_datasource.dart'
    as _i56;
import 'package:zheeta/profile/data/datasource/prod/access_restriction_datasource_impl.dart'
    as _i113;
import 'package:zheeta/profile/data/datasource/prod/location_datasource_impl.dart'
    as _i57;
import 'package:zheeta/profile/data/datasource/prod/user_bank_account_datasource_impl.dart'
    as _i84;
import 'package:zheeta/profile/data/datasource/prod/user_interest_datasource_impl.dart'
    as _i88;
import 'package:zheeta/profile/data/datasource/prod/user_profile_access_datasource_impl.dart'
    as _i96;
import 'package:zheeta/profile/data/datasource/prod/user_profile_boost_datasource_impl.dart'
    as _i100;
import 'package:zheeta/profile/data/datasource/prod/user_profile_datasource_impl.dart'
    as _i28;
import 'package:zheeta/profile/data/datasource/prod/user_search_datasource_impl.dart'
    as _i104;
import 'package:zheeta/profile/data/datasource/prod/user_transaction_datasource_impl.dart'
    as _i108;
import 'package:zheeta/profile/data/datasource/user_bank_account_datasource.dart'
    as _i83;
import 'package:zheeta/profile/data/datasource/user_interest_datasource.dart'
    as _i87;
import 'package:zheeta/profile/data/datasource/user_profile_access_datasource.dart'
    as _i95;
import 'package:zheeta/profile/data/datasource/user_profile_boost_datasource.dart'
    as _i99;
import 'package:zheeta/profile/data/datasource/user_profile_datasource.dart'
    as _i27;
import 'package:zheeta/profile/data/datasource/user_search_datasource.dart'
    as _i103;
import 'package:zheeta/profile/data/datasource/user_transaction_datasource.dart'
    as _i107;
import 'package:zheeta/profile/data/repository/prod/access_restriction_repository_impl.dart'
    as _i115;
import 'package:zheeta/profile/data/repository/prod/location_repository_impl.dart'
    as _i59;
import 'package:zheeta/profile/data/repository/prod/user_bank_account_repository_impl.dart'
    as _i86;
import 'package:zheeta/profile/data/repository/prod/user_interest_repository_impl.dart'
    as _i90;
import 'package:zheeta/profile/data/repository/prod/user_profile_access_repository_impl.dart'
    as _i98;
import 'package:zheeta/profile/data/repository/prod/user_profile_boost_repository_impl.dart'
    as _i102;
import 'package:zheeta/profile/data/repository/prod/user_profile_repository_impl.dart'
    as _i30;
import 'package:zheeta/profile/data/repository/prod/user_search_repository_impl.dart'
    as _i106;
import 'package:zheeta/profile/data/repository/prod/user_transaction_repository_impl.dart'
    as _i110;
import 'package:zheeta/profile/domain/repository/access_restriction_repository.dart'
    as _i114;
import 'package:zheeta/profile/domain/repository/location_repository.dart'
    as _i58;
import 'package:zheeta/profile/domain/repository/user_bank_account_repository.dart'
    as _i85;
import 'package:zheeta/profile/domain/repository/user_interest_repository.dart'
    as _i89;
import 'package:zheeta/profile/domain/repository/user_profile_access_repository.dart'
    as _i97;
import 'package:zheeta/profile/domain/repository/user_profile_boost_repository.dart'
    as _i101;
import 'package:zheeta/profile/domain/repository/user_profile_repository.dart'
    as _i29;
import 'package:zheeta/profile/domain/repository/user_search_repository.dart'
    as _i105;
import 'package:zheeta/profile/domain/repository/user_transaction_repository.dart'
    as _i109;
import 'package:zheeta/profile/domain/usecase/ref_usecases/access_restriction_usecases.dart'
    as _i120;
import 'package:zheeta/profile/domain/usecase/ref_usecases/location_usecases.dart'
    as _i122;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_bank_usecases.dart'
    as _i119;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_interest_usecases.dart'
    as _i123;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_access_usecases.dart'
    as _i116;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_boost_usecases.dart'
    as _i118;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_usecases.dart'
    as _i32;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_search_usecases.dart'
    as _i121;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_transaction_usecases.dart'
    as _i126;
import 'package:zheeta/profile/presentation/bloc/profile_cubit.dart' as _i133;
import 'package:zheeta/profile/presentation/viewmodel/about_screen_viewmodel.dart'
    as _i3;
import 'package:zheeta/profile/presentation/viewmodel/user_profile_viewmodel.dart'
    as _i31;

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
    gh.singleton<_i8.GiftDataSource>(
      _i9.GiftDataSourceImpl(gh<_i4.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i10.GiftRepository>(
      () => _i11.GiftDataRepositoryImpl(gh<_i8.GiftDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i12.ITokenStorage>(
      () => _i13.TokenStorage(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i14.IUserStorage>(
      () => _i15.UserStorage(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i16.MatchCriteriaViewModel>(
      () => _i16.MatchCriteriaViewModel(),
      registerFor: {_prod},
    );
    gh.singleton<_i17.NearbyDataSource>(
      _i18.NearbyDataSourceImpl(gh<_i4.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i19.RedeemGiftById>(
      () => _i19.RedeemGiftById(gh<_i10.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i20.SendGiftUseCase>(
      () => _i20.SendGiftUseCase(gh<_i10.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i21.SubscriptionDataSource>(
      _i22.SubscriptionDatasourceImpl(gh<_i4.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i23.SubscriptionRepository>(
      () => _i24.SubscriptionRepositoryImpl(gh<_i21.SubscriptionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i25.UserAuthViewModel>(
      () => _i25.UserAuthViewModel(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i26.UserOtpViewModel>(
      () => _i26.UserOtpViewModel(),
      registerFor: {_prod},
    );
    gh.singleton<_i27.UserProfileDataSource>(
      _i28.UserProfileDataSourceImpl(gh<_i4.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i29.UserProfileRepository>(
      () => _i30.UserProfileRepositoryImpl(gh<_i27.UserProfileDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i31.UserProfileViewModel>(
      () => _i31.UserProfileViewModel(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i32.VisitUserProfile>(
      () => _i32.VisitUserProfile(gh<_i29.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.factory<_i33.ApiManager>(
      () => _i34.ApiManagerImpl(gh<_i6.DioModule>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i35.CountryDataSource>(
      () => _i36.CountryDataSourceImpl(
        gh<_i33.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i37.CountryRepository>(
      () => _i38.CountryRepositoryImpl(gh<_i35.CountryDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i32.CreateProfile>(
      () => _i32.CreateProfile(gh<_i29.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i39.FriendRequestDataSource>(
      _i40.FriendRequestDataSourceImpl(
        gh<_i33.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i41.FriendRequestRepository>(
      () =>
          _i42.FriendRequestRepositoryImpl(gh<_i39.FriendRequestDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i43.FriendRequestUseCase>(
      () => _i44.FriendRequestUseCaseImpl(gh<_i41.FriendRequestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i45.GetAllCountries>(
      () => _i45.GetAllCountries(gh<_i37.CountryRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i46.GetAllGifts>(
      () => _i46.GetAllGifts(gh<_i10.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i47.GetAllReceivedGifts>(
      () => _i47.GetAllReceivedGifts(gh<_i10.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i48.GetAllSentGifts>(
      () => _i48.GetAllSentGifts(gh<_i10.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i49.GetAllSubscriptions>(
      () => _i49.GetAllSubscriptions(gh<_i23.SubscriptionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i32.GetAllUsersProfile>(
      () => _i32.GetAllUsersProfile(gh<_i29.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i45.GetCountryDetails>(
      () => _i45.GetCountryDetails(gh<_i37.CountryRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i32.GetSingleUserProfile>(
      () => _i32.GetSingleUserProfile(gh<_i29.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i32.GetUserRecentActivity>(
      () => _i32.GetUserRecentActivity(gh<_i29.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i32.GetVisitedUserRecentActivity>(
      () => _i32.GetVisitedUserRecentActivity(gh<_i29.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i50.GiftCubit>(
      () => _i50.GiftCubit(
        getAllGifts: gh<_i46.GetAllGifts>(),
        getAllReceivedGifts: gh<_i47.GetAllReceivedGifts>(),
        redeemGiftById: gh<_i19.RedeemGiftById>(),
        sendGiftUseCase: gh<_i20.SendGiftUseCase>(),
        getAllSentGifts: gh<_i48.GetAllSentGifts>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i51.GiftViewModel>(
      () => _i51.GiftViewModel(gh<_i50.GiftCubit>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i52.IdentityRoleDataSource>(
      () => _i53.IdentityRoleDataSourceImpl(
        gh<_i33.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i54.IdentityRoleRepository>(
      () => _i55.IdentityRoleRepositoryImpl(gh<_i52.IdentityRoleDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i56.LocationDataSource>(
      _i57.LocationDataSourceImpl(
        gh<_i33.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i58.LocationRepository>(
      () => _i59.LocationRepositoryImpl(gh<_i56.LocationDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i60.MatchCriteriaDataSource>(
      _i61.MatchCriteriaDataSourceImpl(
        gh<_i33.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i62.MatchCriteriaRepository>(
      () =>
          _i63.MatchCriteriaRepositoryImpl(gh<_i60.MatchCriteriaDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i64.MatchCriteriaUseCase>(
      () => _i65.MatchCriteriaUseCaseImpl(gh<_i62.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i66.NearbyDataRepository>(
      () => _i67.NearbyDataRepositoryImpl(gh<_i17.NearbyDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i68.NotificationDataSource>(
      _i69.NotificationDataSourceImpl(gh<_i33.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i70.NotificationRepository>(
      () => _i71.NotificationRepositoryImpl(gh<_i68.NotificationDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i72.NotificationUseCase>(
      () => _i73.NotificationUseCaseImpl(gh<_i70.NotificationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i74.PopulateMatches>(
      () => _i74.PopulateMatches(gh<_i62.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i75.SendFriendRequest>(
      () => _i75.SendFriendRequest(gh<_i41.FriendRequestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i76.SubscriptionCubit>(
      () => _i76.SubscriptionCubit(
          getAllSubscriptions: gh<_i49.GetAllSubscriptions>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i77.SubscriptionViewmodel>(
      () => _i77.SubscriptionViewmodel(gh<_i76.SubscriptionCubit>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i74.UpdateMatchCriteria>(
      () => _i74.UpdateMatchCriteria(gh<_i62.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i32.UpdateUserProfile>(
      () => _i32.UpdateUserProfile(gh<_i29.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i32.UpdateUserProfilePicture>(
      () => _i32.UpdateUserProfilePicture(gh<_i29.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i78.UpgradeUserRole>(
      () => _i78.UpgradeUserRole(gh<_i54.IdentityRoleRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i79.UserAuthDataSource>(
      () => _i80.UserAuthDataSourceImpl(
        gh<_i33.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i81.UserAuthRepository>(
      () => _i82.UserAuthRepositoryImpl(
        gh<_i79.UserAuthDataSource>(),
        gh<_i14.IUserStorage>(),
        gh<_i12.ITokenStorage>(),
      ),
      registerFor: {_prod},
    );
    gh.singleton<_i83.UserBankAccountDataSource>(
      _i84.UserBankAccountDataSourceImpl(
        gh<_i33.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i85.UserBankAccountRepository>(
      () => _i86.UserBankAccountRepositoryImpl(
          gh<_i83.UserBankAccountDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i87.UserInterestDataSource>(
      _i88.UserInterestDataSourceImpl(
        gh<_i33.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i89.UserInterestRepository>(
      () => _i90.UserInterestRepositoryImpl(gh<_i87.UserInterestDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i91.UserOtpDataSource>(
      () => _i92.UserOtpDataSourceImpl(
        gh<_i33.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i93.UserOtpRepository>(
      () => _i94.UserOtpRepositoryImpl(gh<_i91.UserOtpDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i95.UserProfileAccessDataSource>(
      _i96.UserProfileAccessDataSourceImpl(
        gh<_i33.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i97.UserProfileAccessRepository>(
      () => _i98.UserProfileAccessRepositoryImpl(
          gh<_i95.UserProfileAccessDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i99.UserProfileBoostDataSource>(
      _i100.UserProfileBoostDataSourceImpl(
        gh<_i33.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i101.UserProfileBoostRepository>(
      () => _i102.UserProfileBoostRepositoryImpl(
          gh<_i99.UserProfileBoostDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i103.UserSearchDataSource>(
      _i104.UserSearchDataSourceImpl(
        gh<_i33.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i105.UserSearchRepository>(
      () => _i106.UserSearchRepositorImpl(gh<_i103.UserSearchDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i107.UserTransactionDataSource>(
      _i108.UserTransactionDataSourceImpl(
        gh<_i33.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i109.UserTransactionRepository>(
      () => _i110.UserTransactionRepositoryImpl(
          gh<_i107.UserTransactionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i111.VerifyEmailOtp>(
      () => _i111.VerifyEmailOtp(gh<_i93.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i111.VerifyPhoneOtp>(
      () => _i111.VerifyPhoneOtp(gh<_i93.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i112.AccessRestrictionDataSource>(
      _i113.AccessRestrictionDataSourceImpl(
        gh<_i33.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i114.AccessRestrictionRepository>(
      () => _i115.AccessRestrictionRepositoryImpl(
          gh<_i112.AccessRestrictionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i116.BlockAccount>(
      () => _i116.BlockAccount(gh<_i97.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i117.ChangePassword>(
      () => _i117.ChangePassword(gh<_i81.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i118.CreateProfileBoost>(
      () => _i118.CreateProfileBoost(gh<_i101.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i119.CreateUpdateBankAccount>(
      () => _i119.CreateUpdateBankAccount(gh<_i85.UserBankAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i120.DisableAccount>(
      () => _i120.DisableAccount(gh<_i114.AccessRestrictionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i78.DowngradeUserRole>(
      () => _i78.DowngradeUserRole(gh<_i54.IdentityRoleRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i120.EnableAccount>(
      () => _i120.EnableAccount(gh<_i114.AccessRestrictionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i121.FindUserByAdminEmail>(
      () => _i121.FindUserByAdminEmail(gh<_i105.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i121.FindUserByAdminUsername>(
      () => _i121.FindUserByAdminUsername(gh<_i105.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i122.GetAddressFromLocationCoordinate>(
      () =>
          _i122.GetAddressFromLocationCoordinate(gh<_i58.LocationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i116.GetBlockedUsers>(
      () => _i116.GetBlockedUsers(gh<_i97.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i118.GetBoostedProfileByAdmin>(
      () => _i118.GetBoostedProfileByAdmin(
          gh<_i101.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i123.GetInterests>(
      () => _i123.GetInterests(gh<_i89.UserInterestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i122.GetLocationCoordinateFromAddress>(
      () =>
          _i122.GetLocationCoordinateFromAddress(gh<_i58.LocationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i74.GetMatchCriteria>(
      () => _i74.GetMatchCriteria(gh<_i62.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i118.GetMatchedProfileBoost>(
      () =>
          _i118.GetMatchedProfileBoost(gh<_i101.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i74.GetMatches>(
      () => _i74.GetMatches(gh<_i62.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i124.GetNearbyProfiles>(
      () => _i124.GetNearbyProfiles(gh<_i66.NearbyDataRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i125.GetNearbySettings>(
      () => _i125.GetNearbySettings(gh<_i66.NearbyDataRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i119.GetUserBankAccount>(
      () => _i119.GetUserBankAccount(gh<_i85.UserBankAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i126.GetUserTransactions>(
      () => _i126.GetUserTransactions(gh<_i109.UserTransactionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i117.LoginOAuth>(
      () => _i117.LoginOAuth(gh<_i81.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i117.LoginUser>(
      () => _i117.LoginUser(gh<_i81.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i127.MatchesCubit>(
      () => _i127.MatchesCubit(
        sendFriendRequest: gh<_i75.SendFriendRequest>(),
        getMatchCriteria: gh<_i74.GetMatchCriteria>(),
        getMatches: gh<_i74.GetMatches>(),
        populateMatches: gh<_i74.PopulateMatches>(),
        updateMatchCriteria: gh<_i74.UpdateMatchCriteria>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i128.NearbyCubit>(
      () => _i128.NearbyCubit(
        getNearbyProfiles: gh<_i124.GetNearbyProfiles>(),
        getNearbySettings: gh<_i125.GetNearbySettings>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i129.NearbyViewModel>(
      () => _i129.NearbyViewModel(gh<_i128.NearbyCubit>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i117.RegisterStaff>(
      () => _i117.RegisterStaff(gh<_i81.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i117.RegisterUser>(
      () => _i117.RegisterUser(gh<_i81.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i117.ResetPassword>(
      () => _i117.ResetPassword(gh<_i81.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i121.SearchUserByCustomer>(
      () => _i121.SearchUserByCustomer(gh<_i105.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i111.SendEmailVerifyOtp>(
      () => _i111.SendEmailVerifyOtp(gh<_i93.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i111.SendPasswordResetOtp>(
      () => _i111.SendPasswordResetOtp(gh<_i93.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i111.SendPhoneVerifyOtp>(
      () => _i111.SendPhoneVerifyOtp(gh<_i93.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i116.UnBlockAccount>(
      () => _i116.UnBlockAccount(gh<_i97.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i123.UpdateUserInterest>(
      () => _i123.UpdateUserInterest(gh<_i89.UserInterestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i130.AuthenticationCubit>(
      () => _i130.AuthenticationCubit(
        getAllCountries: gh<_i45.GetAllCountries>(),
        getCountryDetails: gh<_i45.GetCountryDetails>(),
        upgradeUserRole: gh<_i78.UpgradeUserRole>(),
        downgradeUserRole: gh<_i78.DowngradeUserRole>(),
        registerUser: gh<_i117.RegisterUser>(),
        loginUser: gh<_i117.LoginUser>(),
        registerStaff: gh<_i117.RegisterStaff>(),
        changePassword: gh<_i117.ChangePassword>(),
        resetPassword: gh<_i117.ResetPassword>(),
        loginOAuth: gh<_i117.LoginOAuth>(),
        sendPasswordResetOtp: gh<_i111.SendPasswordResetOtp>(),
        sendEmailVerifyOtp: gh<_i111.SendEmailVerifyOtp>(),
        sendPhoneVerifyOtp: gh<_i111.SendPhoneVerifyOtp>(),
        verifyPhoneOtp: gh<_i111.VerifyPhoneOtp>(),
        verifyEmailOtp: gh<_i111.VerifyEmailOtp>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i131.FeedsCubit>(
      () => _i131.FeedsCubit(
          getMatchedProfileBoost: gh<_i118.GetMatchedProfileBoost>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i132.FeedsViewModel>(
      () => _i132.FeedsViewModel(gh<_i131.FeedsCubit>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i133.ProfileCubit>(
      () => _i133.ProfileCubit(
        disableAccount: gh<_i120.DisableAccount>(),
        enableAccount: gh<_i120.EnableAccount>(),
        getAddressFromLocationCoordinate:
            gh<_i122.GetAddressFromLocationCoordinate>(),
        getLocationCoordinateFromAddress:
            gh<_i122.GetLocationCoordinateFromAddress>(),
        createUpdateBankAccount: gh<_i119.CreateUpdateBankAccount>(),
        getUserBankAccount: gh<_i119.GetUserBankAccount>(),
        getInterests: gh<_i123.GetInterests>(),
        updateUserInterest: gh<_i123.UpdateUserInterest>(),
        blockAccount: gh<_i116.BlockAccount>(),
        getBlockedUsers: gh<_i116.GetBlockedUsers>(),
        unBlockAccount: gh<_i116.UnBlockAccount>(),
        createProfileBoost: gh<_i118.CreateProfileBoost>(),
        getBoostedProfileByAdmin: gh<_i118.GetBoostedProfileByAdmin>(),
        createProfile: gh<_i32.CreateProfile>(),
        getAllUsersProfile: gh<_i32.GetAllUsersProfile>(),
        getSingleUserProfile: gh<_i32.GetSingleUserProfile>(),
        getUserRecentActivity: gh<_i32.GetUserRecentActivity>(),
        getVisitedUserRecentActivity: gh<_i32.GetVisitedUserRecentActivity>(),
        updateUserProfilePicture: gh<_i32.UpdateUserProfilePicture>(),
        updateUserProfile: gh<_i32.UpdateUserProfile>(),
        visitUserProfile: gh<_i32.VisitUserProfile>(),
        findUserByAdminEmail: gh<_i121.FindUserByAdminEmail>(),
        findUserByAdminUsername: gh<_i121.FindUserByAdminUsername>(),
        searchUserByCustomer: gh<_i121.SearchUserByCustomer>(),
        getUserTransactions: gh<_i126.GetUserTransactions>(),
      ),
      registerFor: {_prod},
    );
    return this;
  }
}
