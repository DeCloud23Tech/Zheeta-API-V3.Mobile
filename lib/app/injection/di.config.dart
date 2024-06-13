// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:zheeta/app/api/api_manager.dart' as _i28;
import 'package:zheeta/app/api/api_manager_refactored.dart' as _i4;
import 'package:zheeta/app/api/dio_module.dart' as _i6;
import 'package:zheeta/app/api/prod/api_manager_impl.dart' as _i29;
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
    as _i30;
import 'package:zheeta/authentication/data/datasource/identity_role_datasource.dart'
    as _i47;
import 'package:zheeta/authentication/data/datasource/prod/country_datasource_impl.dart'
    as _i31;
import 'package:zheeta/authentication/data/datasource/prod/identity_role_datasource_impl.dart'
    as _i48;
import 'package:zheeta/authentication/data/datasource/prod/user_auth_datasource_impl.dart'
    as _i75;
import 'package:zheeta/authentication/data/datasource/prod/user_otp_datasource_impl.dart'
    as _i87;
import 'package:zheeta/authentication/data/datasource/user_auth_datasource.dart'
    as _i74;
import 'package:zheeta/authentication/data/datasource/user_otp_datasource.dart'
    as _i86;
import 'package:zheeta/authentication/data/repository/prod/country_repository_impl.dart'
    as _i33;
import 'package:zheeta/authentication/data/repository/prod/identity_role_repository_impl.dart'
    as _i50;
import 'package:zheeta/authentication/data/repository/prod/user_auth_repository_impl.dart'
    as _i77;
import 'package:zheeta/authentication/data/repository/prod/user_otp_repository_impl.dart'
    as _i89;
import 'package:zheeta/authentication/domain/repository/country_repository.dart'
    as _i32;
import 'package:zheeta/authentication/domain/repository/identity_role_repository.dart'
    as _i49;
import 'package:zheeta/authentication/domain/repository/user_auth_repository.dart'
    as _i76;
import 'package:zheeta/authentication/domain/repository/user_otp_repository.dart'
    as _i88;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/country/country_usecases.dart'
    as _i40;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/identity/identity_usecases.dart'
    as _i73;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/user_auth/user_auth_usecases.dart'
    as _i119;
import 'package:zheeta/authentication/domain/usecase/ref_usecase/user_otp/user_otp_usecases.dart'
    as _i110;
import 'package:zheeta/authentication/presentation/bloc/authentication_bloc.dart'
    as _i132;
import 'package:zheeta/authentication/presentation/viewmodel/user_auth_viewmodel.dart'
    as _i25;
import 'package:zheeta/authentication/presentation/viewmodel/user_otp_viewmodel.dart'
    as _i26;
import 'package:zheeta/discover/data/datasource/friend_request_datasource.dart'
    as _i34;
import 'package:zheeta/discover/data/datasource/match_criteria_datasource.dart'
    as _i55;
import 'package:zheeta/discover/data/datasource/nearby_datasource.dart' as _i17;
import 'package:zheeta/discover/data/datasource/prod/friend_request_datasource_impl.dart'
    as _i35;
import 'package:zheeta/discover/data/datasource/prod/match_criteria_datasource_impl.dart'
    as _i56;
import 'package:zheeta/discover/data/datasource/prod/nearby_datasource_impl.dart'
    as _i18;
import 'package:zheeta/discover/data/repository/prod/friend_request_repository_impl.dart'
    as _i37;
import 'package:zheeta/discover/data/repository/prod/match_criteria_repository_impl.dart'
    as _i58;
import 'package:zheeta/discover/data/repository/prod/nearby_profile_repository_impl.dart'
    as _i62;
import 'package:zheeta/discover/domain/repository/friend_request_repository.dart'
    as _i36;
import 'package:zheeta/discover/domain/repository/match_criteria_repository.dart'
    as _i57;
import 'package:zheeta/discover/domain/repository/populate_nearby_repository.dart'
    as _i61;
import 'package:zheeta/discover/domain/usecase/friend_request_usecase.dart'
    as _i38;
import 'package:zheeta/discover/domain/usecase/match_criteria_usecase.dart'
    as _i59;
import 'package:zheeta/discover/domain/usecase/prod/friend_request_usecase_impl.dart'
    as _i39;
import 'package:zheeta/discover/domain/usecase/prod/match_criteria_usecase_impl.dart'
    as _i60;
import 'package:zheeta/discover/domain/usecase/ref/friend_usecases.dart'
    as _i70;
import 'package:zheeta/discover/domain/usecase/ref/match_criteria_usecases.dart'
    as _i69;
import 'package:zheeta/discover/domain/usecase/ref/nearby_profiles_usecase.dart'
    as _i126;
import 'package:zheeta/discover/domain/usecase/ref/nearby_settings_usecase.dart'
    as _i127;
import 'package:zheeta/discover/presentation/bloc/matches_bloc/matches_cubit.dart'
    as _i129;
import 'package:zheeta/discover/presentation/bloc/nearby_bloc/nearby_cubit.dart'
    as _i130;
import 'package:zheeta/discover/presentation/viewmodel/friend_request_viewmodel.dart'
    as _i7;
import 'package:zheeta/discover/presentation/viewmodel/match_criteria_viewmodel.dart'
    as _i16;
import 'package:zheeta/discover/presentation/viewmodel/nearby_viewmodel.dart'
    as _i131;
import 'package:zheeta/feeds/presentation/bloc/feeds_cubit.dart' as _i133;
import 'package:zheeta/feeds/presentation/viewmodel/feeds_viewmodel.dart'
    as _i134;
import 'package:zheeta/gifts/data/datasource/gift_datasource.dart' as _i8;
import 'package:zheeta/gifts/data/datasource/prod/gift_datasource_impl.dart'
    as _i9;
import 'package:zheeta/gifts/data/repository/gift_repository_impl.dart' as _i11;
import 'package:zheeta/gifts/domain/repository/gift_repository.dart' as _i10;
import 'package:zheeta/gifts/domain/usecase/get_gifts_usecase.dart' as _i41;
import 'package:zheeta/gifts/domain/usecase/received_gift_usecase.dart' as _i42;
import 'package:zheeta/gifts/domain/usecase/redeem_gift_usecase.dart' as _i19;
import 'package:zheeta/gifts/domain/usecase/send_gift_usecase.dart' as _i20;
import 'package:zheeta/gifts/domain/usecase/sent_gift_usecase.dart' as _i43;
import 'package:zheeta/gifts/presentation/bloc/gift/gift_cubit.dart' as _i45;
import 'package:zheeta/gifts/presentation/viewmodel/gift_viewmodel.dart'
    as _i46;
import 'package:zheeta/notification/data/datasource/notification_datasource.dart'
    as _i63;
import 'package:zheeta/notification/data/datasource/prod/notification_datasource_impl.dart'
    as _i64;
import 'package:zheeta/notification/data/repository/prod/notification_repository_impl.dart'
    as _i66;
import 'package:zheeta/notification/domain/repository/notification_repository.dart'
    as _i65;
import 'package:zheeta/notification/domain/usecase/notification_usecase.dart'
    as _i67;
import 'package:zheeta/notification/domain/usecase/prod/notification_usecase_impl.dart'
    as _i68;
import 'package:zheeta/payment_and_subscriptions/data/datasource/prod/subscription_datasource_impl.dart'
    as _i22;
import 'package:zheeta/payment_and_subscriptions/data/datasource/subscription_datasource.dart'
    as _i21;
import 'package:zheeta/payment_and_subscriptions/data/repository/subscription_repository_impl.dart'
    as _i24;
import 'package:zheeta/payment_and_subscriptions/domain/repository/subscription_repository.dart'
    as _i23;
import 'package:zheeta/payment_and_subscriptions/domain/usecase/get_subscriptions_usecase.dart'
    as _i44;
import 'package:zheeta/payment_and_subscriptions/presentation/bloc/subscription/subscription_cubit.dart'
    as _i71;
import 'package:zheeta/payment_and_subscriptions/presentation/viewmodel/subscription_viewmodel.dart'
    as _i72;
import 'package:zheeta/profile/data/datasource/access_restriction_datasource.dart'
    as _i112;
import 'package:zheeta/profile/data/datasource/location_datasource.dart'
    as _i51;
import 'package:zheeta/profile/data/datasource/prod/access_restriction_datasource_impl.dart'
    as _i113;
import 'package:zheeta/profile/data/datasource/prod/location_datasource_impl.dart'
    as _i52;
import 'package:zheeta/profile/data/datasource/prod/user_bank_account_datasource_impl.dart'
    as _i79;
import 'package:zheeta/profile/data/datasource/prod/user_interest_datasource_impl.dart'
    as _i83;
import 'package:zheeta/profile/data/datasource/prod/user_profile_access_datasource_impl.dart'
    as _i91;
import 'package:zheeta/profile/data/datasource/prod/user_profile_boost_datasource_impl.dart'
    as _i95;
import 'package:zheeta/profile/data/datasource/prod/user_profile_datasource_impl.dart'
    as _i99;
import 'package:zheeta/profile/data/datasource/prod/user_search_datasource_impl.dart'
    as _i103;
import 'package:zheeta/profile/data/datasource/prod/user_transaction_datasource_impl.dart'
    as _i107;
import 'package:zheeta/profile/data/datasource/user_bank_account_datasource.dart'
    as _i78;
import 'package:zheeta/profile/data/datasource/user_interest_datasource.dart'
    as _i82;
import 'package:zheeta/profile/data/datasource/user_profile_access_datasource.dart'
    as _i90;
import 'package:zheeta/profile/data/datasource/user_profile_boost_datasource.dart'
    as _i94;
import 'package:zheeta/profile/data/datasource/user_profile_datasource.dart'
    as _i98;
import 'package:zheeta/profile/data/datasource/user_search_datasource.dart'
    as _i102;
import 'package:zheeta/profile/data/datasource/user_transaction_datasource.dart'
    as _i106;
import 'package:zheeta/profile/data/repository/prod/access_restriction_repository_impl.dart'
    as _i115;
import 'package:zheeta/profile/data/repository/prod/location_repository_impl.dart'
    as _i54;
import 'package:zheeta/profile/data/repository/prod/user_bank_account_repository_impl.dart'
    as _i81;
import 'package:zheeta/profile/data/repository/prod/user_interest_repository_impl.dart'
    as _i85;
import 'package:zheeta/profile/data/repository/prod/user_profile_access_repository_impl.dart'
    as _i93;
import 'package:zheeta/profile/data/repository/prod/user_profile_boost_repository_impl.dart'
    as _i97;
import 'package:zheeta/profile/data/repository/prod/user_profile_repository_impl.dart'
    as _i101;
import 'package:zheeta/profile/data/repository/prod/user_search_repository_impl.dart'
    as _i105;
import 'package:zheeta/profile/data/repository/prod/user_transaction_repository_impl.dart'
    as _i109;
import 'package:zheeta/profile/domain/repository/access_restriction_repository.dart'
    as _i114;
import 'package:zheeta/profile/domain/repository/location_repository.dart'
    as _i53;
import 'package:zheeta/profile/domain/repository/user_bank_account_repository.dart'
    as _i80;
import 'package:zheeta/profile/domain/repository/user_interest_repository.dart'
    as _i84;
import 'package:zheeta/profile/domain/repository/user_profile_access_repository.dart'
    as _i92;
import 'package:zheeta/profile/domain/repository/user_profile_boost_repository.dart'
    as _i96;
import 'package:zheeta/profile/domain/repository/user_profile_repository.dart'
    as _i100;
import 'package:zheeta/profile/domain/repository/user_search_repository.dart'
    as _i104;
import 'package:zheeta/profile/domain/repository/user_transaction_repository.dart'
    as _i108;
import 'package:zheeta/profile/domain/usecase/access_restriction_usecase.dart'
    as _i116;
import 'package:zheeta/profile/domain/usecase/prod/access_restriction_usecase_impl.dart'
    as _i117;
import 'package:zheeta/profile/domain/usecase/ref_usecases/access_restriction_usecases.dart'
    as _i122;
import 'package:zheeta/profile/domain/usecase/ref_usecases/location_usecases.dart'
    as _i124;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_bank_usecases.dart'
    as _i121;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_interest_usecases.dart'
    as _i125;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_access_usecases.dart'
    as _i118;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_boost_usecases.dart'
    as _i120;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_usecases.dart'
    as _i111;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_search_usecases.dart'
    as _i123;
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_transaction_usecases.dart'
    as _i128;
import 'package:zheeta/profile/presentation/bloc/profile_cubit.dart' as _i135;
import 'package:zheeta/profile/presentation/viewmodel/about_screen_viewmodel.dart'
    as _i3;
import 'package:zheeta/profile/presentation/viewmodel/user_profile_viewmodel.dart'
    as _i27;

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
    gh.lazySingleton<_i27.UserProfileViewModel>(
      () => _i27.UserProfileViewModel(),
      registerFor: {_prod},
    );
    gh.factory<_i28.ApiManager>(
      () => _i29.ApiManagerImpl(gh<_i6.DioModule>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i30.CountryDataSource>(
      () => _i31.CountryDataSourceImpl(
        gh<_i28.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i32.CountryRepository>(
      () => _i33.CountryRepositoryImpl(gh<_i30.CountryDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i34.FriendRequestDataSource>(
      _i35.FriendRequestDataSourceImpl(
        gh<_i28.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i36.FriendRequestRepository>(
      () =>
          _i37.FriendRequestRepositoryImpl(gh<_i34.FriendRequestDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i38.FriendRequestUseCase>(
      () => _i39.FriendRequestUseCaseImpl(gh<_i36.FriendRequestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i40.GetAllCountries>(
      () => _i40.GetAllCountries(gh<_i32.CountryRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i41.GetAllGifts>(
      () => _i41.GetAllGifts(gh<_i10.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i42.GetAllReceivedGifts>(
      () => _i42.GetAllReceivedGifts(gh<_i10.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i43.GetAllSentGifts>(
      () => _i43.GetAllSentGifts(gh<_i10.GiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i44.GetAllSubscriptions>(
      () => _i44.GetAllSubscriptions(gh<_i23.SubscriptionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i40.GetCountryDetails>(
      () => _i40.GetCountryDetails(gh<_i32.CountryRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i45.GiftCubit>(
      () => _i45.GiftCubit(
        getAllGifts: gh<_i41.GetAllGifts>(),
        getAllReceivedGifts: gh<_i42.GetAllReceivedGifts>(),
        redeemGiftById: gh<_i19.RedeemGiftById>(),
        sendGiftUseCase: gh<_i20.SendGiftUseCase>(),
        getAllSentGifts: gh<_i43.GetAllSentGifts>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i46.GiftViewModel>(
      () => _i46.GiftViewModel(gh<_i45.GiftCubit>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i47.IdentityRoleDataSource>(
      () => _i48.IdentityRoleDataSourceImpl(
        gh<_i28.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i49.IdentityRoleRepository>(
      () => _i50.IdentityRoleRepositoryImpl(gh<_i47.IdentityRoleDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i51.LocationDataSource>(
      _i52.LocationDataSourceImpl(
        gh<_i28.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i53.LocationRepository>(
      () => _i54.LocationRepositoryImpl(gh<_i51.LocationDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i55.MatchCriteriaDataSource>(
      _i56.MatchCriteriaDataSourceImpl(
        gh<_i28.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i57.MatchCriteriaRepository>(
      () =>
          _i58.MatchCriteriaRepositoryImpl(gh<_i55.MatchCriteriaDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i59.MatchCriteriaUseCase>(
      () => _i60.MatchCriteriaUseCaseImpl(gh<_i57.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i61.NearbyDataRepository>(
      () => _i62.NearbyDataRepositoryImpl(gh<_i17.NearbyDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i63.NotificationDataSource>(
      _i64.NotificationDataSourceImpl(gh<_i28.ApiManager>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i65.NotificationRepository>(
      () => _i66.NotificationRepositoryImpl(gh<_i63.NotificationDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i67.NotificationUseCase>(
      () => _i68.NotificationUseCaseImpl(gh<_i65.NotificationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i69.PopulateMatches>(
      () => _i69.PopulateMatches(gh<_i57.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i70.SendFriendRequest>(
      () => _i70.SendFriendRequest(gh<_i36.FriendRequestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i71.SubscriptionCubit>(
      () => _i71.SubscriptionCubit(
          getAllSubscriptions: gh<_i44.GetAllSubscriptions>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i72.SubscriptionViewmodel>(
      () => _i72.SubscriptionViewmodel(gh<_i71.SubscriptionCubit>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i69.UpdateMatchCriteria>(
      () => _i69.UpdateMatchCriteria(gh<_i57.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i73.UpgradeUserRole>(
      () => _i73.UpgradeUserRole(gh<_i49.IdentityRoleRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i74.UserAuthDataSource>(
      () => _i75.UserAuthDataSourceImpl(
        gh<_i28.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i76.UserAuthRepository>(
      () => _i77.UserAuthRepositoryImpl(
        gh<_i74.UserAuthDataSource>(),
        gh<_i14.IUserStorage>(),
        gh<_i12.ITokenStorage>(),
      ),
      registerFor: {_prod},
    );
    gh.singleton<_i78.UserBankAccountDataSource>(
      _i79.UserBankAccountDataSourceImpl(
        gh<_i28.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i80.UserBankAccountRepository>(
      () => _i81.UserBankAccountRepositoryImpl(
          gh<_i78.UserBankAccountDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i82.UserInterestDataSource>(
      _i83.UserInterestDataSourceImpl(
        gh<_i28.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i84.UserInterestRepository>(
      () => _i85.UserInterestRepositoryImpl(gh<_i82.UserInterestDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i86.UserOtpDataSource>(
      () => _i87.UserOtpDataSourceImpl(
        gh<_i28.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i88.UserOtpRepository>(
      () => _i89.UserOtpRepositoryImpl(gh<_i86.UserOtpDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i90.UserProfileAccessDataSource>(
      _i91.UserProfileAccessDataSourceImpl(
        gh<_i28.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i92.UserProfileAccessRepository>(
      () => _i93.UserProfileAccessRepositoryImpl(
          gh<_i90.UserProfileAccessDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i94.UserProfileBoostDataSource>(
      _i95.UserProfileBoostDataSourceImpl(
        gh<_i28.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i96.UserProfileBoostRepository>(
      () => _i97.UserProfileBoostRepositoryImpl(
          gh<_i94.UserProfileBoostDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i98.UserProfileDataSource>(
      _i99.UserProfileDataSourceImpl(
        gh<_i28.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i100.UserProfileRepository>(
      () => _i101.UserProfileRepositoryImpl(gh<_i98.UserProfileDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i102.UserSearchDataSource>(
      _i103.UserSearchDataSourceImpl(
        gh<_i28.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i104.UserSearchRepository>(
      () => _i105.UserSearchRepositorImpl(gh<_i102.UserSearchDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i106.UserTransactionDataSource>(
      _i107.UserTransactionDataSourceImpl(
        gh<_i28.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i108.UserTransactionRepository>(
      () => _i109.UserTransactionRepositoryImpl(
          gh<_i106.UserTransactionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i110.VerifyEmailOtp>(
      () => _i110.VerifyEmailOtp(gh<_i88.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i110.VerifyPhoneOtp>(
      () => _i110.VerifyPhoneOtp(gh<_i88.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i111.VisitUserProfile>(
      () => _i111.VisitUserProfile(gh<_i100.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i112.AccessRestrictionDataSource>(
      _i113.AccessRestrictionDataSourceImpl(
        gh<_i28.ApiManager>(),
        gh<_i4.Api>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i114.AccessRestrictionRepository>(
      () => _i115.AccessRestrictionRepositoryImpl(
          gh<_i112.AccessRestrictionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i116.AccessRestrictionUseCase>(
      () => _i117.AccessRestrictionUseCaseImpl(
          gh<_i114.AccessRestrictionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i118.BlockAccount>(
      () => _i118.BlockAccount(gh<_i92.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i119.ChangePassword>(
      () => _i119.ChangePassword(gh<_i76.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i111.CreateProfile>(
      () => _i111.CreateProfile(gh<_i100.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i120.CreateProfileBoost>(
      () => _i120.CreateProfileBoost(gh<_i96.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i121.CreateUpdateBankAccount>(
      () => _i121.CreateUpdateBankAccount(gh<_i80.UserBankAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i122.DisableAccount>(
      () => _i122.DisableAccount(gh<_i114.AccessRestrictionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i73.DowngradeUserRole>(
      () => _i73.DowngradeUserRole(gh<_i49.IdentityRoleRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i122.EnableAccount>(
      () => _i122.EnableAccount(gh<_i114.AccessRestrictionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i123.FindUserByAdminEmail>(
      () => _i123.FindUserByAdminEmail(gh<_i104.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i123.FindUserByAdminUsername>(
      () => _i123.FindUserByAdminUsername(gh<_i104.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i124.GetAddressFromLocationCoordinate>(
      () =>
          _i124.GetAddressFromLocationCoordinate(gh<_i53.LocationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i111.GetAllUsersProfile>(
      () => _i111.GetAllUsersProfile(gh<_i100.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i118.GetBlockedUsers>(
      () => _i118.GetBlockedUsers(gh<_i92.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i120.GetBoostedProfileByAdmin>(
      () =>
          _i120.GetBoostedProfileByAdmin(gh<_i96.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i125.GetInterests>(
      () => _i125.GetInterests(gh<_i84.UserInterestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i124.GetLocationCoordinateFromAddress>(
      () =>
          _i124.GetLocationCoordinateFromAddress(gh<_i53.LocationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i69.GetMatchCriteria>(
      () => _i69.GetMatchCriteria(gh<_i57.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i120.GetMatchedProfileBoost>(
      () => _i120.GetMatchedProfileBoost(gh<_i96.UserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i69.GetMatches>(
      () => _i69.GetMatches(gh<_i57.MatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i126.GetNearbyProfiles>(
      () => _i126.GetNearbyProfiles(gh<_i61.NearbyDataRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i127.GetNearbySettings>(
      () => _i127.GetNearbySettings(gh<_i61.NearbyDataRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i111.GetSingleUserProfile>(
      () => _i111.GetSingleUserProfile(gh<_i100.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i121.GetUserBankAccount>(
      () => _i121.GetUserBankAccount(gh<_i80.UserBankAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i111.GetUserRecentActivity>(
      () => _i111.GetUserRecentActivity(gh<_i100.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i128.GetUserTransactions>(
      () => _i128.GetUserTransactions(gh<_i108.UserTransactionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i119.LoginOAuth>(
      () => _i119.LoginOAuth(gh<_i76.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i119.LoginUser>(
      () => _i119.LoginUser(gh<_i76.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i129.MatchesCubit>(
      () => _i129.MatchesCubit(
        sendFriendRequest: gh<_i70.SendFriendRequest>(),
        getMatchCriteria: gh<_i69.GetMatchCriteria>(),
        getMatches: gh<_i69.GetMatches>(),
        populateMatches: gh<_i69.PopulateMatches>(),
        updateMatchCriteria: gh<_i69.UpdateMatchCriteria>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i130.NearbyCubit>(
      () => _i130.NearbyCubit(
        getNearbyProfiles: gh<_i126.GetNearbyProfiles>(),
        getNearbySettings: gh<_i127.GetNearbySettings>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i131.NearbyViewModel>(
      () => _i131.NearbyViewModel(gh<_i130.NearbyCubit>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i119.RegisterStaff>(
      () => _i119.RegisterStaff(gh<_i76.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i119.RegisterUser>(
      () => _i119.RegisterUser(gh<_i76.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i119.ResetPassword>(
      () => _i119.ResetPassword(gh<_i76.UserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i123.SearchUserByCustomer>(
      () => _i123.SearchUserByCustomer(gh<_i104.UserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i110.SendEmailVerifyOtp>(
      () => _i110.SendEmailVerifyOtp(gh<_i88.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i110.SendPasswordResetOtp>(
      () => _i110.SendPasswordResetOtp(gh<_i88.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i110.SendPhoneVerifyOtp>(
      () => _i110.SendPhoneVerifyOtp(gh<_i88.UserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i118.UnBlockAccount>(
      () => _i118.UnBlockAccount(gh<_i92.UserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i125.UpdateUserInterest>(
      () => _i125.UpdateUserInterest(gh<_i84.UserInterestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i111.UpdateUserProfile>(
      () => _i111.UpdateUserProfile(gh<_i100.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i111.UpdateUserProfilePicture>(
      () => _i111.UpdateUserProfilePicture(gh<_i100.UserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i132.AuthenticationCubit>(
      () => _i132.AuthenticationCubit(
        getAllCountries: gh<_i40.GetAllCountries>(),
        getCountryDetails: gh<_i40.GetCountryDetails>(),
        upgradeUserRole: gh<_i73.UpgradeUserRole>(),
        downgradeUserRole: gh<_i73.DowngradeUserRole>(),
        registerUser: gh<_i119.RegisterUser>(),
        loginUser: gh<_i119.LoginUser>(),
        registerStaff: gh<_i119.RegisterStaff>(),
        changePassword: gh<_i119.ChangePassword>(),
        resetPassword: gh<_i119.ResetPassword>(),
        loginOAuth: gh<_i119.LoginOAuth>(),
        sendPasswordResetOtp: gh<_i110.SendPasswordResetOtp>(),
        sendEmailVerifyOtp: gh<_i110.SendEmailVerifyOtp>(),
        sendPhoneVerifyOtp: gh<_i110.SendPhoneVerifyOtp>(),
        verifyPhoneOtp: gh<_i110.VerifyPhoneOtp>(),
        verifyEmailOtp: gh<_i110.VerifyEmailOtp>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i133.FeedsCubit>(
      () => _i133.FeedsCubit(
          getMatchedProfileBoost: gh<_i120.GetMatchedProfileBoost>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i134.FeedsViewModel>(
      () => _i134.FeedsViewModel(gh<_i133.FeedsCubit>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i135.ProfileCubit>(
      () => _i135.ProfileCubit(
        disableAccount: gh<_i122.DisableAccount>(),
        enableAccount: gh<_i122.EnableAccount>(),
        getAddressFromLocationCoordinate:
            gh<_i124.GetAddressFromLocationCoordinate>(),
        getLocationCoordinateFromAddress:
            gh<_i124.GetLocationCoordinateFromAddress>(),
        createUpdateBankAccount: gh<_i121.CreateUpdateBankAccount>(),
        getUserBankAccount: gh<_i121.GetUserBankAccount>(),
        getInterests: gh<_i125.GetInterests>(),
        updateUserInterest: gh<_i125.UpdateUserInterest>(),
        blockAccount: gh<_i118.BlockAccount>(),
        getBlockedUsers: gh<_i118.GetBlockedUsers>(),
        unBlockAccount: gh<_i118.UnBlockAccount>(),
        createProfileBoost: gh<_i120.CreateProfileBoost>(),
        getBoostedProfileByAdmin: gh<_i120.GetBoostedProfileByAdmin>(),
        createProfile: gh<_i111.CreateProfile>(),
        getAllUsersProfile: gh<_i111.GetAllUsersProfile>(),
        getSingleUserProfile: gh<_i111.GetSingleUserProfile>(),
        getUserRecentActivity: gh<_i111.GetUserRecentActivity>(),
        updateUserProfilePicture: gh<_i111.UpdateUserProfilePicture>(),
        updateUserProfile: gh<_i111.UpdateUserProfile>(),
        visitUserProfile: gh<_i111.VisitUserProfile>(),
        findUserByAdminEmail: gh<_i123.FindUserByAdminEmail>(),
        findUserByAdminUsername: gh<_i123.FindUserByAdminUsername>(),
        searchUserByCustomer: gh<_i123.SearchUserByCustomer>(),
        getUserTransactions: gh<_i128.GetUserTransactions>(),
      ),
      registerFor: {_prod},
    );
    return this;
  }
}
