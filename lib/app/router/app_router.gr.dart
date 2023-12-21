// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/cupertino.dart' as _i18;
import 'package:flutter/material.dart' as _i19;
import 'package:zheeta/authentication/presentation/views/bio_screen.dart'
    as _i3;
import 'package:zheeta/authentication/presentation/views/forgot_screen.dart'
    as _i4;
import 'package:zheeta/authentication/presentation/views/location_screen.dart'
    as _i8;
import 'package:zheeta/authentication/presentation/views/profilephoto_screen.dart'
    as _i12;
import 'package:zheeta/authentication/presentation/views/signin_screen.dart'
    as _i14;
import 'package:zheeta/authentication/presentation/views/signup_screen.dart'
    as _i15;
import 'package:zheeta/authentication/presentation/views/verification_screen.dart'
    as _i16;
import 'package:zheeta/authentication/presentation/views/welcome_screen.dart'
    as _i1;
import 'package:zheeta/feeds/presentation/views/product_screen.dart' as _i11;
import 'package:zheeta/homepage/presentation/views/bank_screen.dart' as _i2;
import 'package:zheeta/homepage/presentation/views/giftshop_screen.dart' as _i5;
import 'package:zheeta/homepage/presentation/views/home_screen.dart' as _i6;
import 'package:zheeta/homepage/presentation/views/mygift_screen.dart' as _i9;
import 'package:zheeta/homepage/presentation/views/pending_screen.dart' as _i10;
import 'package:zheeta/homepage/presentation/views/referees_screen.dart'
    as _i13;
import 'package:zheeta/splash_screen/presentation/views/intro.dart' as _i7;

abstract class $AppRouter extends _i17.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    AuthWelcomeRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthWelcomeScreen(),
      );
    },
    BankAccountRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BankAccountScreen(),
      );
    },
    BioDataRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.BioDataScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ForgotPasswordScreen(),
      );
    },
    GiftShopRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.GiftShopScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.HomeScreen(
          index: args.index,
          key: args.key,
        ),
      );
    },
    IntroRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.IntroScreen(),
      );
    },
    LocationRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.LocationScreen(),
      );
    },
    MyGiftRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.MyGiftScreen(),
      );
    },
    PendingRequestRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.PendingRequestScreen(),
      );
    },
    ProductDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsRouteArgs>(
          orElse: () => const ProductDetailsRouteArgs());
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.ProductDetailsScreen(
          key: args.key,
          product: args.product,
        ),
      );
    },
    ProfilePhotoRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.ProfilePhotoScreen(),
      );
    },
    RefereeRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.RefereeScreen(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.SignInScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.SignUpScreen(),
      );
    },
    VerificationRoute.name: (routeData) {
      final args = routeData.argsAs<VerificationRouteArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.VerificationScreen(
          identifier: args.identifier,
          isPhoneNumber: args.isPhoneNumber,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthWelcomeScreen]
class AuthWelcomeRoute extends _i17.PageRouteInfo<void> {
  const AuthWelcomeRoute({List<_i17.PageRouteInfo>? children})
      : super(
          AuthWelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthWelcomeRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BankAccountScreen]
class BankAccountRoute extends _i17.PageRouteInfo<void> {
  const BankAccountRoute({List<_i17.PageRouteInfo>? children})
      : super(
          BankAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'BankAccountRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i3.BioDataScreen]
class BioDataRoute extends _i17.PageRouteInfo<void> {
  const BioDataRoute({List<_i17.PageRouteInfo>? children})
      : super(
          BioDataRoute.name,
          initialChildren: children,
        );

  static const String name = 'BioDataRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i17.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i5.GiftShopScreen]
class GiftShopRoute extends _i17.PageRouteInfo<void> {
  const GiftShopRoute({List<_i17.PageRouteInfo>? children})
      : super(
          GiftShopRoute.name,
          initialChildren: children,
        );

  static const String name = 'GiftShopRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i17.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    dynamic index,
    _i18.Key? key,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            index: index,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i17.PageInfo<HomeRouteArgs> page =
      _i17.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.index,
    this.key,
  });

  final dynamic index;

  final _i18.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{index: $index, key: $key}';
  }
}

/// generated route for
/// [_i7.IntroScreen]
class IntroRoute extends _i17.PageRouteInfo<void> {
  const IntroRoute({List<_i17.PageRouteInfo>? children})
      : super(
          IntroRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i8.LocationScreen]
class LocationRoute extends _i17.PageRouteInfo<void> {
  const LocationRoute({List<_i17.PageRouteInfo>? children})
      : super(
          LocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i9.MyGiftScreen]
class MyGiftRoute extends _i17.PageRouteInfo<void> {
  const MyGiftRoute({List<_i17.PageRouteInfo>? children})
      : super(
          MyGiftRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyGiftRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i10.PendingRequestScreen]
class PendingRequestRoute extends _i17.PageRouteInfo<void> {
  const PendingRequestRoute({List<_i17.PageRouteInfo>? children})
      : super(
          PendingRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'PendingRequestRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ProductDetailsScreen]
class ProductDetailsRoute extends _i17.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i19.Key? key,
    dynamic product,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          ProductDetailsRoute.name,
          args: ProductDetailsRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static const _i17.PageInfo<ProductDetailsRouteArgs> page =
      _i17.PageInfo<ProductDetailsRouteArgs>(name);
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    this.key,
    this.product,
  });

  final _i19.Key? key;

  final dynamic product;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i12.ProfilePhotoScreen]
class ProfilePhotoRoute extends _i17.PageRouteInfo<void> {
  const ProfilePhotoRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ProfilePhotoRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfilePhotoRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i13.RefereeScreen]
class RefereeRoute extends _i17.PageRouteInfo<void> {
  const RefereeRoute({List<_i17.PageRouteInfo>? children})
      : super(
          RefereeRoute.name,
          initialChildren: children,
        );

  static const String name = 'RefereeRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i14.SignInScreen]
class SignInRoute extends _i17.PageRouteInfo<void> {
  const SignInRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i15.SignUpScreen]
class SignUpRoute extends _i17.PageRouteInfo<void> {
  const SignUpRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i16.VerificationScreen]
class VerificationRoute extends _i17.PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({
    required String identifier,
    required bool isPhoneNumber,
    _i19.Key? key,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          VerificationRoute.name,
          args: VerificationRouteArgs(
            identifier: identifier,
            isPhoneNumber: isPhoneNumber,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'VerificationRoute';

  static const _i17.PageInfo<VerificationRouteArgs> page =
      _i17.PageInfo<VerificationRouteArgs>(name);
}

class VerificationRouteArgs {
  const VerificationRouteArgs({
    required this.identifier,
    required this.isPhoneNumber,
    this.key,
  });

  final String identifier;

  final bool isPhoneNumber;

  final _i19.Key? key;

  @override
  String toString() {
    return 'VerificationRouteArgs{identifier: $identifier, isPhoneNumber: $isPhoneNumber, key: $key}';
  }
}
