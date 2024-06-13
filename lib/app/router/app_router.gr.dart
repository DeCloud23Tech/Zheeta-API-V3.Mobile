// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i32;
import 'package:flutter/cupertino.dart' as _i36;
import 'package:flutter/material.dart' as _i34;
import 'package:zheeta/app/common/enums/subscription_type.dart' as _i35;
import 'package:zheeta/authentication/data/request/reset_password_request.dart'
    as _i33;
import 'package:zheeta/authentication/presentation/views/forgot_screen.dart'
    as _i5;
import 'package:zheeta/authentication/presentation/views/reset_password_otp_screen.dart'
    as _i25;
import 'package:zheeta/authentication/presentation/views/reset_password_screen.dart'
    as _i26;
import 'package:zheeta/authentication/presentation/views/signin_screen.dart'
    as _i28;
import 'package:zheeta/authentication/presentation/views/signup_screen.dart'
    as _i29;
import 'package:zheeta/authentication/presentation/views/verification_screen.dart'
    as _i30;
import 'package:zheeta/discover/presentation/views/downlines_screen.dart'
    as _i4;
import 'package:zheeta/discover/presentation/views/nearby_search_screen.dart'
    as _i14;
import 'package:zheeta/gifts/data/model/gift_model.dart' as _i37;
import 'package:zheeta/gifts/presentation/views/gift_sucess_screen.dart' as _i8;
import 'package:zheeta/gifts/presentation/views/giftshop_screen.dart' as _i7;
import 'package:zheeta/gifts/presentation/views/mygift_screen.dart' as _i13;
import 'package:zheeta/gifts/presentation/views/product_screen.dart' as _i17;
import 'package:zheeta/gifts/presentation/views/redeem_gift_details_screen.dart'
    as _i23;
import 'package:zheeta/homepage/presentation/views/bank_screen.dart' as _i2;
import 'package:zheeta/homepage/presentation/views/home_screen.dart' as _i9;
import 'package:zheeta/homepage/presentation/views/referees_screen.dart'
    as _i24;
import 'package:zheeta/notification/presentation/views/notification_screen.dart'
    as _i15;
import 'package:zheeta/payment_and_subscriptions/presentation/views/membership_upgrade_screen.dart'
    as _i12;
import 'package:zheeta/profile/presentation/views/about_screen.dart' as _i1;
import 'package:zheeta/profile/presentation/views/bio_screen.dart' as _i3;
import 'package:zheeta/profile/presentation/views/friend_screen.dart' as _i6;
import 'package:zheeta/profile/presentation/views/location_screen.dart' as _i11;
import 'package:zheeta/profile/presentation/views/pending_screen.dart' as _i16;
import 'package:zheeta/profile/presentation/views/profile.dart' as _i22;
import 'package:zheeta/profile/presentation/views/profile_boost_screen.dart'
    as _i18;
import 'package:zheeta/profile/presentation/views/profile_carousel_screen.dart'
    as _i19;
import 'package:zheeta/profile/presentation/views/profile_edit_screen.dart'
    as _i20;
import 'package:zheeta/profile/presentation/views/profilephoto_screen.dart'
    as _i21;
import 'package:zheeta/profile/presentation/views/select_language_screen.dart'
    as _i27;
import 'package:zheeta/profile/presentation/views/welcome_screen.dart' as _i31;
import 'package:zheeta/splash_screen/presentation/views/intro.dart' as _i10;

abstract class $AppRouter extends _i32.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i32.PageFactory> pagesMap = {
    AboutRoute.name: (routeData) {
      final args = routeData.argsAs<AboutRouteArgs>(
          orElse: () => const AboutRouteArgs());
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AboutScreen(key: args.key),
      );
    },
    BankAccountRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BankAccountScreen(),
      );
    },
    BioDataRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.BioDataScreen(),
      );
    },
    DownLinesRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.DownLinesScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ForgotPasswordScreen(),
      );
    },
    FriendRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.FriendScreen(),
      );
    },
    GiftShopRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.GiftShopScreen(),
      );
    },
    GiftSuccessRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.GiftSuccessScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.HomeScreen(),
      );
    },
    IntroRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.IntroScreen(),
      );
    },
    LocationRoute.name: (routeData) {
      final args = routeData.argsAs<LocationRouteArgs>(
          orElse: () => const LocationRouteArgs());
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.LocationScreen(key: args.key),
      );
    },
    MembershipSubscriptionRoute.name: (routeData) {
      final args = routeData.argsAs<MembershipSubscriptionRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.MembershipSubscriptionScreen(
          key: args.key,
          subscriptionId: args.subscriptionId,
        ),
      );
    },
    MyGiftRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.MyGiftScreen(),
      );
    },
    NearbySearchRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.NearbySearchScreen(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.NotificationScreen(),
      );
    },
    PendingRequestRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.PendingRequestScreen(),
      );
    },
    ProductDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.ProductDetailsScreen(
          key: args.key,
          gift: args.gift,
        ),
      );
    },
    ProfileBoostRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.ProfileBoostScreen(),
      );
    },
    ProfileCarouselRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileCarouselRouteArgs>(
          orElse: () => const ProfileCarouselRouteArgs());
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.ProfileCarouselScreen(key: args.key),
      );
    },
    ProfileEditRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.ProfileEditScreen(),
      );
    },
    ProfilePhotoRoute.name: (routeData) {
      final args = routeData.argsAs<ProfilePhotoRouteArgs>();
      return _i32.AutoRoutePage<String>(
        routeData: routeData,
        child: _i21.ProfilePhotoScreen(
          key: args.key,
          username: args.username,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return _i32.AutoRoutePage<String?>(
        routeData: routeData,
        child: _i22.ProfileScreen(
          key: args.key,
          profileId: args.profileId,
        ),
      );
    },
    RedeemGiftDetailRoute.name: (routeData) {
      final args = routeData.argsAs<RedeemGiftDetailRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i23.RedeemGiftDetailScreen(
          key: args.key,
          totalAmount: args.totalAmount,
        ),
      );
    },
    RefereeRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.RefereeScreen(),
      );
    },
    ResetPasswordOtpRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordOtpRouteArgs>();
      return _i32.AutoRoutePage<String>(
        routeData: routeData,
        child: _i25.ResetPasswordOtpScreen(
          key: args.key,
          email: args.email,
        ),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>();
      return _i32.AutoRoutePage<_i33.ResetPasswordRequest>(
        routeData: routeData,
        child: _i26.ResetPasswordScreen(
          key: args.key,
          request: args.request,
        ),
      );
    },
    SelectLanguageRoute.name: (routeData) {
      final args = routeData.argsAs<SelectLanguageRouteArgs>();
      return _i32.AutoRoutePage<List<String>>(
        routeData: routeData,
        child: _i27.SelectLanguageScreen(
          key: args.key,
          languages: args.languages,
        ),
      );
    },
    SignInRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.SignInScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i29.SignUpScreen(),
      );
    },
    VerificationRoute.name: (routeData) {
      final args = routeData.argsAs<VerificationRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i30.VerificationScreen(
          key: args.key,
          isPhoneNumber: args.isPhoneNumber,
          phoneNumber: args.phoneNumber,
          countryCode: args.countryCode,
          email: args.email,
        ),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i31.WelcomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutScreen]
class AboutRoute extends _i32.PageRouteInfo<AboutRouteArgs> {
  AboutRoute({
    _i34.Key? key,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          AboutRoute.name,
          args: AboutRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

  static const _i32.PageInfo<AboutRouteArgs> page =
      _i32.PageInfo<AboutRouteArgs>(name);
}

class AboutRouteArgs {
  const AboutRouteArgs({this.key});

  final _i34.Key? key;

  @override
  String toString() {
    return 'AboutRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.BankAccountScreen]
class BankAccountRoute extends _i32.PageRouteInfo<void> {
  const BankAccountRoute({List<_i32.PageRouteInfo>? children})
      : super(
          BankAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'BankAccountRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i3.BioDataScreen]
class BioDataRoute extends _i32.PageRouteInfo<void> {
  const BioDataRoute({List<_i32.PageRouteInfo>? children})
      : super(
          BioDataRoute.name,
          initialChildren: children,
        );

  static const String name = 'BioDataRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DownLinesScreen]
class DownLinesRoute extends _i32.PageRouteInfo<void> {
  const DownLinesRoute({List<_i32.PageRouteInfo>? children})
      : super(
          DownLinesRoute.name,
          initialChildren: children,
        );

  static const String name = 'DownLinesRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i32.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i32.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i6.FriendScreen]
class FriendRoute extends _i32.PageRouteInfo<void> {
  const FriendRoute({List<_i32.PageRouteInfo>? children})
      : super(
          FriendRoute.name,
          initialChildren: children,
        );

  static const String name = 'FriendRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i7.GiftShopScreen]
class GiftShopRoute extends _i32.PageRouteInfo<void> {
  const GiftShopRoute({List<_i32.PageRouteInfo>? children})
      : super(
          GiftShopRoute.name,
          initialChildren: children,
        );

  static const String name = 'GiftShopRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i8.GiftSuccessScreen]
class GiftSuccessRoute extends _i32.PageRouteInfo<void> {
  const GiftSuccessRoute({List<_i32.PageRouteInfo>? children})
      : super(
          GiftSuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'GiftSuccessRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i9.HomeScreen]
class HomeRoute extends _i32.PageRouteInfo<void> {
  const HomeRoute({List<_i32.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i10.IntroScreen]
class IntroRoute extends _i32.PageRouteInfo<void> {
  const IntroRoute({List<_i32.PageRouteInfo>? children})
      : super(
          IntroRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i11.LocationScreen]
class LocationRoute extends _i32.PageRouteInfo<LocationRouteArgs> {
  LocationRoute({
    _i34.Key? key,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          LocationRoute.name,
          args: LocationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static const _i32.PageInfo<LocationRouteArgs> page =
      _i32.PageInfo<LocationRouteArgs>(name);
}

class LocationRouteArgs {
  const LocationRouteArgs({this.key});

  final _i34.Key? key;

  @override
  String toString() {
    return 'LocationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.MembershipSubscriptionScreen]
class MembershipSubscriptionRoute
    extends _i32.PageRouteInfo<MembershipSubscriptionRouteArgs> {
  MembershipSubscriptionRoute({
    _i34.Key? key,
    required _i35.SubscriptionType? subscriptionId,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          MembershipSubscriptionRoute.name,
          args: MembershipSubscriptionRouteArgs(
            key: key,
            subscriptionId: subscriptionId,
          ),
          initialChildren: children,
        );

  static const String name = 'MembershipSubscriptionRoute';

  static const _i32.PageInfo<MembershipSubscriptionRouteArgs> page =
      _i32.PageInfo<MembershipSubscriptionRouteArgs>(name);
}

class MembershipSubscriptionRouteArgs {
  const MembershipSubscriptionRouteArgs({
    this.key,
    required this.subscriptionId,
  });

  final _i34.Key? key;

  final _i35.SubscriptionType? subscriptionId;

  @override
  String toString() {
    return 'MembershipSubscriptionRouteArgs{key: $key, subscriptionId: $subscriptionId}';
  }
}

/// generated route for
/// [_i13.MyGiftScreen]
class MyGiftRoute extends _i32.PageRouteInfo<void> {
  const MyGiftRoute({List<_i32.PageRouteInfo>? children})
      : super(
          MyGiftRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyGiftRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i14.NearbySearchScreen]
class NearbySearchRoute extends _i32.PageRouteInfo<void> {
  const NearbySearchRoute({List<_i32.PageRouteInfo>? children})
      : super(
          NearbySearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'NearbySearchRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i15.NotificationScreen]
class NotificationRoute extends _i32.PageRouteInfo<void> {
  const NotificationRoute({List<_i32.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i16.PendingRequestScreen]
class PendingRequestRoute extends _i32.PageRouteInfo<void> {
  const PendingRequestRoute({List<_i32.PageRouteInfo>? children})
      : super(
          PendingRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'PendingRequestRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i17.ProductDetailsScreen]
class ProductDetailsRoute extends _i32.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i36.Key? key,
    required _i37.GiftModel gift,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          ProductDetailsRoute.name,
          args: ProductDetailsRouteArgs(
            key: key,
            gift: gift,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static const _i32.PageInfo<ProductDetailsRouteArgs> page =
      _i32.PageInfo<ProductDetailsRouteArgs>(name);
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    this.key,
    required this.gift,
  });

  final _i36.Key? key;

  final _i37.GiftModel gift;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, gift: $gift}';
  }
}

/// generated route for
/// [_i18.ProfileBoostScreen]
class ProfileBoostRoute extends _i32.PageRouteInfo<void> {
  const ProfileBoostRoute({List<_i32.PageRouteInfo>? children})
      : super(
          ProfileBoostRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileBoostRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i19.ProfileCarouselScreen]
class ProfileCarouselRoute
    extends _i32.PageRouteInfo<ProfileCarouselRouteArgs> {
  ProfileCarouselRoute({
    _i34.Key? key,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          ProfileCarouselRoute.name,
          args: ProfileCarouselRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ProfileCarouselRoute';

  static const _i32.PageInfo<ProfileCarouselRouteArgs> page =
      _i32.PageInfo<ProfileCarouselRouteArgs>(name);
}

class ProfileCarouselRouteArgs {
  const ProfileCarouselRouteArgs({this.key});

  final _i34.Key? key;

  @override
  String toString() {
    return 'ProfileCarouselRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i20.ProfileEditScreen]
class ProfileEditRoute extends _i32.PageRouteInfo<void> {
  const ProfileEditRoute({List<_i32.PageRouteInfo>? children})
      : super(
          ProfileEditRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileEditRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i21.ProfilePhotoScreen]
class ProfilePhotoRoute extends _i32.PageRouteInfo<ProfilePhotoRouteArgs> {
  ProfilePhotoRoute({
    _i34.Key? key,
    required String username,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          ProfilePhotoRoute.name,
          args: ProfilePhotoRouteArgs(
            key: key,
            username: username,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfilePhotoRoute';

  static const _i32.PageInfo<ProfilePhotoRouteArgs> page =
      _i32.PageInfo<ProfilePhotoRouteArgs>(name);
}

class ProfilePhotoRouteArgs {
  const ProfilePhotoRouteArgs({
    this.key,
    required this.username,
  });

  final _i34.Key? key;

  final String username;

  @override
  String toString() {
    return 'ProfilePhotoRouteArgs{key: $key, username: $username}';
  }
}

/// generated route for
/// [_i22.ProfileScreen]
class ProfileRoute extends _i32.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i34.Key? key,
    String? profileId,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            profileId: profileId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i32.PageInfo<ProfileRouteArgs> page =
      _i32.PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    this.profileId,
  });

  final _i34.Key? key;

  final String? profileId;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, profileId: $profileId}';
  }
}

/// generated route for
/// [_i23.RedeemGiftDetailScreen]
class RedeemGiftDetailRoute
    extends _i32.PageRouteInfo<RedeemGiftDetailRouteArgs> {
  RedeemGiftDetailRoute({
    _i34.Key? key,
    required double totalAmount,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          RedeemGiftDetailRoute.name,
          args: RedeemGiftDetailRouteArgs(
            key: key,
            totalAmount: totalAmount,
          ),
          initialChildren: children,
        );

  static const String name = 'RedeemGiftDetailRoute';

  static const _i32.PageInfo<RedeemGiftDetailRouteArgs> page =
      _i32.PageInfo<RedeemGiftDetailRouteArgs>(name);
}

class RedeemGiftDetailRouteArgs {
  const RedeemGiftDetailRouteArgs({
    this.key,
    required this.totalAmount,
  });

  final _i34.Key? key;

  final double totalAmount;

  @override
  String toString() {
    return 'RedeemGiftDetailRouteArgs{key: $key, totalAmount: $totalAmount}';
  }
}

/// generated route for
/// [_i24.RefereeScreen]
class RefereeRoute extends _i32.PageRouteInfo<void> {
  const RefereeRoute({List<_i32.PageRouteInfo>? children})
      : super(
          RefereeRoute.name,
          initialChildren: children,
        );

  static const String name = 'RefereeRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i25.ResetPasswordOtpScreen]
class ResetPasswordOtpRoute
    extends _i32.PageRouteInfo<ResetPasswordOtpRouteArgs> {
  ResetPasswordOtpRoute({
    _i34.Key? key,
    required String email,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          ResetPasswordOtpRoute.name,
          args: ResetPasswordOtpRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'ResetPasswordOtpRoute';

  static const _i32.PageInfo<ResetPasswordOtpRouteArgs> page =
      _i32.PageInfo<ResetPasswordOtpRouteArgs>(name);
}

class ResetPasswordOtpRouteArgs {
  const ResetPasswordOtpRouteArgs({
    this.key,
    required this.email,
  });

  final _i34.Key? key;

  final String email;

  @override
  String toString() {
    return 'ResetPasswordOtpRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i26.ResetPasswordScreen]
class ResetPasswordRoute extends _i32.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    _i34.Key? key,
    required _i33.ResetPasswordRequest request,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          ResetPasswordRoute.name,
          args: ResetPasswordRouteArgs(
            key: key,
            request: request,
          ),
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const _i32.PageInfo<ResetPasswordRouteArgs> page =
      _i32.PageInfo<ResetPasswordRouteArgs>(name);
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({
    this.key,
    required this.request,
  });

  final _i34.Key? key;

  final _i33.ResetPasswordRequest request;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key, request: $request}';
  }
}

/// generated route for
/// [_i27.SelectLanguageScreen]
class SelectLanguageRoute extends _i32.PageRouteInfo<SelectLanguageRouteArgs> {
  SelectLanguageRoute({
    _i34.Key? key,
    required List<String> languages,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          SelectLanguageRoute.name,
          args: SelectLanguageRouteArgs(
            key: key,
            languages: languages,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectLanguageRoute';

  static const _i32.PageInfo<SelectLanguageRouteArgs> page =
      _i32.PageInfo<SelectLanguageRouteArgs>(name);
}

class SelectLanguageRouteArgs {
  const SelectLanguageRouteArgs({
    this.key,
    required this.languages,
  });

  final _i34.Key? key;

  final List<String> languages;

  @override
  String toString() {
    return 'SelectLanguageRouteArgs{key: $key, languages: $languages}';
  }
}

/// generated route for
/// [_i28.SignInScreen]
class SignInRoute extends _i32.PageRouteInfo<void> {
  const SignInRoute({List<_i32.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i29.SignUpScreen]
class SignUpRoute extends _i32.PageRouteInfo<void> {
  const SignUpRoute({List<_i32.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i30.VerificationScreen]
class VerificationRoute extends _i32.PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({
    _i34.Key? key,
    required bool isPhoneNumber,
    required String phoneNumber,
    required String countryCode,
    required String email,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          VerificationRoute.name,
          args: VerificationRouteArgs(
            key: key,
            isPhoneNumber: isPhoneNumber,
            phoneNumber: phoneNumber,
            countryCode: countryCode,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'VerificationRoute';

  static const _i32.PageInfo<VerificationRouteArgs> page =
      _i32.PageInfo<VerificationRouteArgs>(name);
}

class VerificationRouteArgs {
  const VerificationRouteArgs({
    this.key,
    required this.isPhoneNumber,
    required this.phoneNumber,
    required this.countryCode,
    required this.email,
  });

  final _i34.Key? key;

  final bool isPhoneNumber;

  final String phoneNumber;

  final String countryCode;

  final String email;

  @override
  String toString() {
    return 'VerificationRouteArgs{key: $key, isPhoneNumber: $isPhoneNumber, phoneNumber: $phoneNumber, countryCode: $countryCode, email: $email}';
  }
}

/// generated route for
/// [_i31.WelcomeScreen]
class WelcomeRoute extends _i32.PageRouteInfo<void> {
  const WelcomeRoute({List<_i32.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}
