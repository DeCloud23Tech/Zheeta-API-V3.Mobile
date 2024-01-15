// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i20;
import 'package:flutter/cupertino.dart' as _i21;
import 'package:flutter/material.dart' as _i22;
import 'package:zheeta/authentication/presentation/views/forgot_screen.dart'
    as _i4;
import 'package:zheeta/authentication/presentation/views/reset_password_otp_screen.dart'
    as _i14;
import 'package:zheeta/authentication/presentation/views/reset_password_screen.dart'
    as _i15;
import 'package:zheeta/authentication/presentation/views/signin_screen.dart'
    as _i16;
import 'package:zheeta/authentication/presentation/views/signup_screen.dart'
    as _i17;
import 'package:zheeta/authentication/presentation/views/verification_screen.dart'
    as _i18;
import 'package:zheeta/feeds/presentation/views/product_screen.dart' as _i11;
import 'package:zheeta/homepage/presentation/views/bank_screen.dart' as _i2;
import 'package:zheeta/homepage/presentation/views/giftshop_screen.dart' as _i5;
import 'package:zheeta/homepage/presentation/views/home_screen.dart' as _i6;
import 'package:zheeta/homepage/presentation/views/mygift_screen.dart' as _i9;
import 'package:zheeta/homepage/presentation/views/pending_screen.dart' as _i10;
import 'package:zheeta/homepage/presentation/views/referees_screen.dart'
    as _i13;
import 'package:zheeta/profile/presentation/views/about_screen.dart' as _i1;
import 'package:zheeta/profile/presentation/views/bio_screen.dart' as _i3;
import 'package:zheeta/profile/presentation/views/location_screen.dart' as _i8;
import 'package:zheeta/profile/presentation/views/profilephoto_screen.dart'
    as _i12;
import 'package:zheeta/profile/presentation/views/welcome_screen.dart' as _i19;
import 'package:zheeta/splash_screen/presentation/views/intro.dart' as _i7;

abstract class $AppRouter extends _i20.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i20.PageFactory> pagesMap = {
    AboutRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutScreen(),
      );
    },
    BankAccountRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BankAccountScreen(),
      );
    },
    BioDataRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.BioDataScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ForgotPasswordScreen(),
      );
    },
    GiftShopRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.GiftShopScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.HomeScreen(
          index: args.index,
          key: args.key,
        ),
      );
    },
    IntroRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.IntroScreen(),
      );
    },
    LocationRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.LocationScreen(),
      );
    },
    MyGiftRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.MyGiftScreen(),
      );
    },
    PendingRequestRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.PendingRequestScreen(),
      );
    },
    ProductDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsRouteArgs>(
          orElse: () => const ProductDetailsRouteArgs());
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.ProductDetailsScreen(
          key: args.key,
          product: args.product,
        ),
      );
    },
    ProfilePhotoRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.ProfilePhotoScreen(),
      );
    },
    RefereeRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.RefereeScreen(),
      );
    },
    ResetPasswordOtpRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.ResetPasswordOtpScreen(),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.ResetPasswordScreen(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.SignInScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.SignUpScreen(),
      );
    },
    VerificationRoute.name: (routeData) {
      final args = routeData.argsAs<VerificationRouteArgs>();
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.VerificationScreen(
          key: args.key,
          isPhoneNumber: args.isPhoneNumber,
          identifier: args.identifier,
        ),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.WelcomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutScreen]
class AboutRoute extends _i20.PageRouteInfo<void> {
  const AboutRoute({List<_i20.PageRouteInfo>? children})
      : super(
          AboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BankAccountScreen]
class BankAccountRoute extends _i20.PageRouteInfo<void> {
  const BankAccountRoute({List<_i20.PageRouteInfo>? children})
      : super(
          BankAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'BankAccountRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i3.BioDataScreen]
class BioDataRoute extends _i20.PageRouteInfo<void> {
  const BioDataRoute({List<_i20.PageRouteInfo>? children})
      : super(
          BioDataRoute.name,
          initialChildren: children,
        );

  static const String name = 'BioDataRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i20.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i20.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i5.GiftShopScreen]
class GiftShopRoute extends _i20.PageRouteInfo<void> {
  const GiftShopRoute({List<_i20.PageRouteInfo>? children})
      : super(
          GiftShopRoute.name,
          initialChildren: children,
        );

  static const String name = 'GiftShopRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i20.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    dynamic index,
    _i21.Key? key,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            index: index,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i20.PageInfo<HomeRouteArgs> page =
      _i20.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.index,
    this.key,
  });

  final dynamic index;

  final _i21.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{index: $index, key: $key}';
  }
}

/// generated route for
/// [_i7.IntroScreen]
class IntroRoute extends _i20.PageRouteInfo<void> {
  const IntroRoute({List<_i20.PageRouteInfo>? children})
      : super(
          IntroRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i8.LocationScreen]
class LocationRoute extends _i20.PageRouteInfo<void> {
  const LocationRoute({List<_i20.PageRouteInfo>? children})
      : super(
          LocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i9.MyGiftScreen]
class MyGiftRoute extends _i20.PageRouteInfo<void> {
  const MyGiftRoute({List<_i20.PageRouteInfo>? children})
      : super(
          MyGiftRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyGiftRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i10.PendingRequestScreen]
class PendingRequestRoute extends _i20.PageRouteInfo<void> {
  const PendingRequestRoute({List<_i20.PageRouteInfo>? children})
      : super(
          PendingRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'PendingRequestRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ProductDetailsScreen]
class ProductDetailsRoute extends _i20.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i22.Key? key,
    dynamic product,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          ProductDetailsRoute.name,
          args: ProductDetailsRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static const _i20.PageInfo<ProductDetailsRouteArgs> page =
      _i20.PageInfo<ProductDetailsRouteArgs>(name);
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    this.key,
    this.product,
  });

  final _i22.Key? key;

  final dynamic product;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i12.ProfilePhotoScreen]
class ProfilePhotoRoute extends _i20.PageRouteInfo<void> {
  const ProfilePhotoRoute({List<_i20.PageRouteInfo>? children})
      : super(
          ProfilePhotoRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfilePhotoRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i13.RefereeScreen]
class RefereeRoute extends _i20.PageRouteInfo<void> {
  const RefereeRoute({List<_i20.PageRouteInfo>? children})
      : super(
          RefereeRoute.name,
          initialChildren: children,
        );

  static const String name = 'RefereeRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i14.ResetPasswordOtpScreen]
class ResetPasswordOtpRoute extends _i20.PageRouteInfo<void> {
  const ResetPasswordOtpRoute({List<_i20.PageRouteInfo>? children})
      : super(
          ResetPasswordOtpRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordOtpRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i15.ResetPasswordScreen]
class ResetPasswordRoute extends _i20.PageRouteInfo<void> {
  const ResetPasswordRoute({List<_i20.PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i16.SignInScreen]
class SignInRoute extends _i20.PageRouteInfo<void> {
  const SignInRoute({List<_i20.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i17.SignUpScreen]
class SignUpRoute extends _i20.PageRouteInfo<void> {
  const SignUpRoute({List<_i20.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i18.VerificationScreen]
class VerificationRoute extends _i20.PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({
    _i22.Key? key,
    required bool isPhoneNumber,
    required String identifier,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          VerificationRoute.name,
          args: VerificationRouteArgs(
            key: key,
            isPhoneNumber: isPhoneNumber,
            identifier: identifier,
          ),
          initialChildren: children,
        );

  static const String name = 'VerificationRoute';

  static const _i20.PageInfo<VerificationRouteArgs> page =
      _i20.PageInfo<VerificationRouteArgs>(name);
}

class VerificationRouteArgs {
  const VerificationRouteArgs({
    this.key,
    required this.isPhoneNumber,
    required this.identifier,
  });

  final _i22.Key? key;

  final bool isPhoneNumber;

  final String identifier;

  @override
  String toString() {
    return 'VerificationRouteArgs{key: $key, isPhoneNumber: $isPhoneNumber, identifier: $identifier}';
  }
}

/// generated route for
/// [_i19.WelcomeScreen]
class WelcomeRoute extends _i20.PageRouteInfo<void> {
  const WelcomeRoute({List<_i20.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}
