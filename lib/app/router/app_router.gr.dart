// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i24;
import 'package:flutter/material.dart' as _i25;
import 'package:zheeta/authentication/presentation/views/forgot_screen.dart'
    as _i4;
import 'package:zheeta/authentication/presentation/views/reset_password_otp_screen.dart'
    as _i17;
import 'package:zheeta/authentication/presentation/views/reset_password_screen.dart'
    as _i18;
import 'package:zheeta/authentication/presentation/views/signin_screen.dart'
    as _i20;
import 'package:zheeta/authentication/presentation/views/signup_screen.dart'
    as _i21;
import 'package:zheeta/authentication/presentation/views/verification_screen.dart'
    as _i22;
import 'package:zheeta/feeds/presentation/views/product_screen.dart' as _i13;
import 'package:zheeta/homepage/presentation/views/bank_screen.dart' as _i2;
import 'package:zheeta/homepage/presentation/views/giftshop_screen.dart' as _i6;
import 'package:zheeta/homepage/presentation/views/home_screen.dart' as _i7;
import 'package:zheeta/homepage/presentation/views/mygift_screen.dart' as _i10;
import 'package:zheeta/homepage/presentation/views/referees_screen.dart'
    as _i16;
import 'package:zheeta/notification/presentation/views/notification_screen.dart'
    as _i11;
import 'package:zheeta/profile/presentation/views/about_screen.dart' as _i1;
import 'package:zheeta/profile/presentation/views/bio_screen.dart' as _i3;
import 'package:zheeta/profile/presentation/views/friend_screen.dart' as _i5;
import 'package:zheeta/profile/presentation/views/location_screen.dart' as _i9;
import 'package:zheeta/profile/presentation/views/pending_screen.dart' as _i12;
import 'package:zheeta/profile/presentation/views/profile.dart' as _i15;
import 'package:zheeta/profile/presentation/views/profilephoto_screen.dart'
    as _i14;
import 'package:zheeta/profile/presentation/views/select_language_screen.dart'
    as _i19;
import 'package:zheeta/profile/presentation/views/welcome_screen.dart' as _i23;
import 'package:zheeta/splash_screen/presentation/views/intro.dart' as _i8;

abstract class $AppRouter extends _i24.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i24.PageFactory> pagesMap = {
    AboutRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutScreen(),
      );
    },
    BankAccountRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BankAccountScreen(),
      );
    },
    BioDataRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.BioDataScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ForgotPasswordScreen(),
      );
    },
    FriendRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.FriendScreen(),
      );
    },
    GiftShopRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.GiftShopScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.HomeScreen(),
      );
    },
    IntroRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.IntroScreen(),
      );
    },
    LocationRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.LocationScreen(),
      );
    },
    MyGiftRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.MyGiftScreen(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.NotificationScreen(),
      );
    },
    PendingRequestRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.PendingRequestScreen(),
      );
    },
    ProductDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsRouteArgs>(
          orElse: () => const ProductDetailsRouteArgs());
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.ProductDetailsScreen(
          key: args.key,
          product: args.product,
        ),
      );
    },
    ProfilePhotoRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.ProfilePhotoScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return _i24.AutoRoutePage<String?>(
        routeData: routeData,
        child: _i15.ProfileScreen(
          key: args.key,
          profileId: args.profileId,
        ),
      );
    },
    RefereeRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.RefereeScreen(),
      );
    },
    ResetPasswordOtpRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.ResetPasswordOtpScreen(),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.ResetPasswordScreen(),
      );
    },
    SelectLanguageRoute.name: (routeData) {
      final args = routeData.argsAs<SelectLanguageRouteArgs>();
      return _i24.AutoRoutePage<List<String>>(
        routeData: routeData,
        child: _i19.SelectLanguageScreen(
          key: args.key,
          languages: args.languages,
        ),
      );
    },
    SignInRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.SignInScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.SignUpScreen(),
      );
    },
    VerificationRoute.name: (routeData) {
      final args = routeData.argsAs<VerificationRouteArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.VerificationScreen(
          key: args.key,
          isPhoneNumber: args.isPhoneNumber,
          phoneNumber: args.phoneNumber,
          countryCode: args.countryCode,
          email: args.email,
        ),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.WelcomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutScreen]
class AboutRoute extends _i24.PageRouteInfo<void> {
  const AboutRoute({List<_i24.PageRouteInfo>? children})
      : super(
          AboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BankAccountScreen]
class BankAccountRoute extends _i24.PageRouteInfo<void> {
  const BankAccountRoute({List<_i24.PageRouteInfo>? children})
      : super(
          BankAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'BankAccountRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i3.BioDataScreen]
class BioDataRoute extends _i24.PageRouteInfo<void> {
  const BioDataRoute({List<_i24.PageRouteInfo>? children})
      : super(
          BioDataRoute.name,
          initialChildren: children,
        );

  static const String name = 'BioDataRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i24.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i24.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i5.FriendScreen]
class FriendRoute extends _i24.PageRouteInfo<void> {
  const FriendRoute({List<_i24.PageRouteInfo>? children})
      : super(
          FriendRoute.name,
          initialChildren: children,
        );

  static const String name = 'FriendRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i6.GiftShopScreen]
class GiftShopRoute extends _i24.PageRouteInfo<void> {
  const GiftShopRoute({List<_i24.PageRouteInfo>? children})
      : super(
          GiftShopRoute.name,
          initialChildren: children,
        );

  static const String name = 'GiftShopRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomeScreen]
class HomeRoute extends _i24.PageRouteInfo<void> {
  const HomeRoute({List<_i24.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i8.IntroScreen]
class IntroRoute extends _i24.PageRouteInfo<void> {
  const IntroRoute({List<_i24.PageRouteInfo>? children})
      : super(
          IntroRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LocationScreen]
class LocationRoute extends _i24.PageRouteInfo<void> {
  const LocationRoute({List<_i24.PageRouteInfo>? children})
      : super(
          LocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i10.MyGiftScreen]
class MyGiftRoute extends _i24.PageRouteInfo<void> {
  const MyGiftRoute({List<_i24.PageRouteInfo>? children})
      : super(
          MyGiftRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyGiftRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i11.NotificationScreen]
class NotificationRoute extends _i24.PageRouteInfo<void> {
  const NotificationRoute({List<_i24.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i12.PendingRequestScreen]
class PendingRequestRoute extends _i24.PageRouteInfo<void> {
  const PendingRequestRoute({List<_i24.PageRouteInfo>? children})
      : super(
          PendingRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'PendingRequestRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i13.ProductDetailsScreen]
class ProductDetailsRoute extends _i24.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i25.Key? key,
    dynamic product,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          ProductDetailsRoute.name,
          args: ProductDetailsRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static const _i24.PageInfo<ProductDetailsRouteArgs> page =
      _i24.PageInfo<ProductDetailsRouteArgs>(name);
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    this.key,
    this.product,
  });

  final _i25.Key? key;

  final dynamic product;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i14.ProfilePhotoScreen]
class ProfilePhotoRoute extends _i24.PageRouteInfo<void> {
  const ProfilePhotoRoute({List<_i24.PageRouteInfo>? children})
      : super(
          ProfilePhotoRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfilePhotoRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i15.ProfileScreen]
class ProfileRoute extends _i24.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i25.Key? key,
    String? profileId,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            profileId: profileId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i24.PageInfo<ProfileRouteArgs> page =
      _i24.PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    this.profileId,
  });

  final _i25.Key? key;

  final String? profileId;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, profileId: $profileId}';
  }
}

/// generated route for
/// [_i16.RefereeScreen]
class RefereeRoute extends _i24.PageRouteInfo<void> {
  const RefereeRoute({List<_i24.PageRouteInfo>? children})
      : super(
          RefereeRoute.name,
          initialChildren: children,
        );

  static const String name = 'RefereeRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i17.ResetPasswordOtpScreen]
class ResetPasswordOtpRoute extends _i24.PageRouteInfo<void> {
  const ResetPasswordOtpRoute({List<_i24.PageRouteInfo>? children})
      : super(
          ResetPasswordOtpRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordOtpRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i18.ResetPasswordScreen]
class ResetPasswordRoute extends _i24.PageRouteInfo<void> {
  const ResetPasswordRoute({List<_i24.PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i19.SelectLanguageScreen]
class SelectLanguageRoute extends _i24.PageRouteInfo<SelectLanguageRouteArgs> {
  SelectLanguageRoute({
    _i25.Key? key,
    required List<String> languages,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          SelectLanguageRoute.name,
          args: SelectLanguageRouteArgs(
            key: key,
            languages: languages,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectLanguageRoute';

  static const _i24.PageInfo<SelectLanguageRouteArgs> page =
      _i24.PageInfo<SelectLanguageRouteArgs>(name);
}

class SelectLanguageRouteArgs {
  const SelectLanguageRouteArgs({
    this.key,
    required this.languages,
  });

  final _i25.Key? key;

  final List<String> languages;

  @override
  String toString() {
    return 'SelectLanguageRouteArgs{key: $key, languages: $languages}';
  }
}

/// generated route for
/// [_i20.SignInScreen]
class SignInRoute extends _i24.PageRouteInfo<void> {
  const SignInRoute({List<_i24.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i21.SignUpScreen]
class SignUpRoute extends _i24.PageRouteInfo<void> {
  const SignUpRoute({List<_i24.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i22.VerificationScreen]
class VerificationRoute extends _i24.PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({
    _i25.Key? key,
    required bool isPhoneNumber,
    required String phoneNumber,
    required String countryCode,
    required String email,
    List<_i24.PageRouteInfo>? children,
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

  static const _i24.PageInfo<VerificationRouteArgs> page =
      _i24.PageInfo<VerificationRouteArgs>(name);
}

class VerificationRouteArgs {
  const VerificationRouteArgs({
    this.key,
    required this.isPhoneNumber,
    required this.phoneNumber,
    required this.countryCode,
    required this.email,
  });

  final _i25.Key? key;

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
/// [_i23.WelcomeScreen]
class WelcomeRoute extends _i24.PageRouteInfo<void> {
  const WelcomeRoute({List<_i24.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}
