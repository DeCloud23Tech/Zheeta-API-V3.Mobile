// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
<<<<<<< HEAD
import 'package:auto_route/auto_route.dart' as _i28;
import 'package:flutter/material.dart' as _i30;
import 'package:zheeta/authentication/data/request/reset_password_request.dart'
    as _i29;
import 'package:zheeta/authentication/presentation/views/forgot_screen.dart'
    as _i4;
import 'package:zheeta/authentication/presentation/views/reset_password_otp_screen.dart'
    as _i21;
import 'package:zheeta/authentication/presentation/views/reset_password_screen.dart'
    as _i22;
import 'package:zheeta/authentication/presentation/views/signin_screen.dart'
    as _i24;
import 'package:zheeta/authentication/presentation/views/signup_screen.dart'
    as _i25;
import 'package:zheeta/authentication/presentation/views/verification_screen.dart'
    as _i26;
import 'package:zheeta/discover/presentation/views/nearby_search_screen.dart'
    as _i11;
import 'package:zheeta/feeds/presentation/views/product_screen.dart' as _i14;
=======
import 'package:auto_route/auto_route.dart' as _i26;
import 'package:flutter/material.dart' as _i28;
import 'package:zheeta/authentication/data/request/reset_password_request.dart'
    as _i27;
import 'package:zheeta/authentication/presentation/views/forgot_screen.dart'
    as _i4;
import 'package:zheeta/authentication/presentation/views/reset_password_otp_screen.dart'
    as _i19;
import 'package:zheeta/authentication/presentation/views/reset_password_screen.dart'
    as _i20;
import 'package:zheeta/authentication/presentation/views/signin_screen.dart'
    as _i22;
import 'package:zheeta/authentication/presentation/views/signup_screen.dart'
    as _i23;
import 'package:zheeta/authentication/presentation/views/verification_screen.dart'
    as _i24;
import 'package:zheeta/feeds/presentation/views/product_screen.dart' as _i13;
>>>>>>> fc211bf (premerge)
import 'package:zheeta/homepage/presentation/views/bank_screen.dart' as _i2;
import 'package:zheeta/homepage/presentation/views/giftshop_screen.dart' as _i6;
import 'package:zheeta/homepage/presentation/views/home_screen.dart' as _i7;
import 'package:zheeta/homepage/presentation/views/mygift_screen.dart' as _i10;
import 'package:zheeta/homepage/presentation/views/referees_screen.dart'
<<<<<<< HEAD
    as _i20;
=======
    as _i18;
>>>>>>> fc211bf (premerge)
import 'package:zheeta/notification/presentation/views/notification_screen.dart'
    as _i12;
import 'package:zheeta/profile/presentation/views/about_screen.dart' as _i1;
import 'package:zheeta/profile/presentation/views/bio_screen.dart' as _i3;
import 'package:zheeta/profile/presentation/views/friend_screen.dart' as _i5;
import 'package:zheeta/profile/presentation/views/location_screen.dart' as _i9;
<<<<<<< HEAD
import 'package:zheeta/profile/presentation/views/pending_screen.dart' as _i13;
import 'package:zheeta/profile/presentation/views/profile.dart' as _i19;
import 'package:zheeta/profile/presentation/views/profile_boost_screen.dart'
=======
import 'package:zheeta/profile/presentation/views/pending_screen.dart' as _i12;
import 'package:zheeta/profile/presentation/views/profile.dart' as _i16;
import 'package:zheeta/profile/presentation/views/profile_carousel_screen.dart'
    as _i14;
import 'package:zheeta/profile/presentation/views/profile_view.dart' as _i17;
import 'package:zheeta/profile/presentation/views/profilephoto_screen.dart'
>>>>>>> fc211bf (premerge)
    as _i15;
import 'package:zheeta/profile/presentation/views/profile_carousel_screen.dart'
    as _i16;
import 'package:zheeta/profile/presentation/views/profile_edit_screen.dart'
    as _i17;
import 'package:zheeta/profile/presentation/views/profilephoto_screen.dart'
    as _i18;
import 'package:zheeta/profile/presentation/views/select_language_screen.dart'
<<<<<<< HEAD
    as _i23;
import 'package:zheeta/profile/presentation/views/welcome_screen.dart' as _i27;
import 'package:zheeta/splash_screen/presentation/views/intro.dart' as _i8;

abstract class $AppRouter extends _i28.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i28.PageFactory> pagesMap = {
    AboutRoute.name: (routeData) {
      final args = routeData.argsAs<AboutRouteArgs>(
          orElse: () => const AboutRouteArgs());
      return _i28.AutoRoutePage<dynamic>(
=======
    as _i21;
import 'package:zheeta/profile/presentation/views/welcome_screen.dart' as _i25;
import 'package:zheeta/splash_screen/presentation/views/intro.dart' as _i8;

abstract class $AppRouter extends _i26.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i26.PageFactory> pagesMap = {
    AboutRoute.name: (routeData) {
      final args = routeData.argsAs<AboutRouteArgs>(
          orElse: () => const AboutRouteArgs());
      return _i26.AutoRoutePage<dynamic>(
>>>>>>> fc211bf (premerge)
        routeData: routeData,
        child: _i1.AboutScreen(key: args.key),
      );
    },
    BankAccountRoute.name: (routeData) {
<<<<<<< HEAD
      return _i28.AutoRoutePage<dynamic>(
=======
      return _i26.AutoRoutePage<dynamic>(
>>>>>>> fc211bf (premerge)
        routeData: routeData,
        child: const _i2.BankAccountScreen(),
      );
    },
    BioDataRoute.name: (routeData) {
<<<<<<< HEAD
      return _i28.AutoRoutePage<dynamic>(
=======
      return _i26.AutoRoutePage<dynamic>(
>>>>>>> fc211bf (premerge)
        routeData: routeData,
        child: const _i3.BioDataScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
<<<<<<< HEAD
      return _i28.AutoRoutePage<dynamic>(
=======
      return _i26.AutoRoutePage<dynamic>(
>>>>>>> fc211bf (premerge)
        routeData: routeData,
        child: const _i4.ForgotPasswordScreen(),
      );
    },
    FriendRoute.name: (routeData) {
<<<<<<< HEAD
      return _i28.AutoRoutePage<dynamic>(
=======
      return _i26.AutoRoutePage<dynamic>(
>>>>>>> fc211bf (premerge)
        routeData: routeData,
        child: const _i5.FriendScreen(),
      );
    },
    GiftShopRoute.name: (routeData) {
<<<<<<< HEAD
      return _i28.AutoRoutePage<dynamic>(
=======
      return _i26.AutoRoutePage<dynamic>(
>>>>>>> fc211bf (premerge)
        routeData: routeData,
        child: const _i6.GiftShopScreen(),
      );
    },
    HomeRoute.name: (routeData) {
<<<<<<< HEAD
      return _i28.AutoRoutePage<dynamic>(
=======
      return _i26.AutoRoutePage<dynamic>(
>>>>>>> fc211bf (premerge)
        routeData: routeData,
        child: const _i7.HomeScreen(),
      );
    },
    IntroRoute.name: (routeData) {
<<<<<<< HEAD
      return _i28.AutoRoutePage<dynamic>(
=======
      return _i26.AutoRoutePage<dynamic>(
>>>>>>> fc211bf (premerge)
        routeData: routeData,
        child: const _i8.IntroScreen(),
      );
    },
    LocationRoute.name: (routeData) {
      final args = routeData.argsAs<LocationRouteArgs>(
          orElse: () => const LocationRouteArgs());
<<<<<<< HEAD
      return _i28.AutoRoutePage<dynamic>(
=======
      return _i26.AutoRoutePage<dynamic>(
>>>>>>> fc211bf (premerge)
        routeData: routeData,
        child: _i9.LocationScreen(key: args.key),
      );
    },
    MyGiftRoute.name: (routeData) {
<<<<<<< HEAD
      return _i28.AutoRoutePage<dynamic>(
=======
      return _i26.AutoRoutePage<dynamic>(
>>>>>>> fc211bf (premerge)
        routeData: routeData,
        child: const _i10.MyGiftScreen(),
      );
    },
<<<<<<< HEAD
    NearbySearchRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
=======
    NotificationRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
>>>>>>> fc211bf (premerge)
        routeData: routeData,
        child: const _i11.NearbySearchScreen(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.NotificationScreen(),
      );
    },
    PendingRequestRoute.name: (routeData) {
<<<<<<< HEAD
      return _i28.AutoRoutePage<dynamic>(
=======
      return _i26.AutoRoutePage<dynamic>(
>>>>>>> fc211bf (premerge)
        routeData: routeData,
        child: const _i13.PendingRequestScreen(),
      );
    },
    ProductDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsRouteArgs>(
          orElse: () => const ProductDetailsRouteArgs());
<<<<<<< HEAD
      return _i28.AutoRoutePage<dynamic>(
=======
      return _i26.AutoRoutePage<dynamic>(
>>>>>>> fc211bf (premerge)
        routeData: routeData,
        child: _i14.ProductDetailsScreen(
          key: args.key,
          product: args.product,
        ),
      );
    },
    ProfileBoostRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.ProfileBoostScreen(),
      );
    },
    ProfileCarouselRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileCarouselRouteArgs>(
          orElse: () => const ProfileCarouselRouteArgs());
<<<<<<< HEAD
      return _i28.AutoRoutePage<dynamic>(
=======
      return _i26.AutoRoutePage<dynamic>(
>>>>>>> fc211bf (premerge)
        routeData: routeData,
        child: _i16.ProfileCarouselScreen(key: args.key),
      );
    },
    ProfileEditRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.ProfileEditScreen(),
      );
    },
    ProfilePhotoRoute.name: (routeData) {
      final args = routeData.argsAs<ProfilePhotoRouteArgs>();
<<<<<<< HEAD
      return _i28.AutoRoutePage<String>(
=======
      return _i26.AutoRoutePage<String>(
>>>>>>> fc211bf (premerge)
        routeData: routeData,
        child: _i18.ProfilePhotoScreen(
          key: args.key,
          username: args.username,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
<<<<<<< HEAD
      return _i28.AutoRoutePage<String?>(
        routeData: routeData,
        child: _i19.ProfileScreen(
=======
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.ProfileScreen(key: args.key),
      );
    },
    ProfileViewRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileViewRouteArgs>();
      return _i26.AutoRoutePage<String>(
        routeData: routeData,
        child: _i17.ProfileViewScreen(
>>>>>>> fc211bf (premerge)
          key: args.key,
          profileId: args.profileId,
        ),
      );
    },
    RefereeRoute.name: (routeData) {
<<<<<<< HEAD
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.RefereeScreen(),
=======
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.RefereeScreen(),
>>>>>>> fc211bf (premerge)
      );
    },
    ResetPasswordOtpRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordOtpRouteArgs>();
<<<<<<< HEAD
      return _i28.AutoRoutePage<String>(
        routeData: routeData,
        child: _i21.ResetPasswordOtpScreen(
=======
      return _i26.AutoRoutePage<String>(
        routeData: routeData,
        child: _i19.ResetPasswordOtpScreen(
>>>>>>> fc211bf (premerge)
          key: args.key,
          email: args.email,
        ),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>();
<<<<<<< HEAD
      return _i28.AutoRoutePage<_i29.ResetPasswordRequest>(
        routeData: routeData,
        child: _i22.ResetPasswordScreen(
=======
      return _i26.AutoRoutePage<_i27.ResetPasswordRequest>(
        routeData: routeData,
        child: _i20.ResetPasswordScreen(
>>>>>>> fc211bf (premerge)
          key: args.key,
          request: args.request,
        ),
      );
    },
    SelectLanguageRoute.name: (routeData) {
      final args = routeData.argsAs<SelectLanguageRouteArgs>();
<<<<<<< HEAD
      return _i28.AutoRoutePage<List<String>>(
        routeData: routeData,
        child: _i23.SelectLanguageScreen(
=======
      return _i26.AutoRoutePage<List<String>>(
        routeData: routeData,
        child: _i21.SelectLanguageScreen(
>>>>>>> fc211bf (premerge)
          key: args.key,
          languages: args.languages,
        ),
      );
    },
    SignInRoute.name: (routeData) {
<<<<<<< HEAD
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.SignInScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.SignUpScreen(),
=======
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.SignInScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.SignUpScreen(),
>>>>>>> fc211bf (premerge)
      );
    },
    VerificationRoute.name: (routeData) {
      final args = routeData.argsAs<VerificationRouteArgs>();
<<<<<<< HEAD
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i26.VerificationScreen(
=======
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.VerificationScreen(
>>>>>>> fc211bf (premerge)
          key: args.key,
          isPhoneNumber: args.isPhoneNumber,
          phoneNumber: args.phoneNumber,
          countryCode: args.countryCode,
          email: args.email,
        ),
      );
    },
    WelcomeRoute.name: (routeData) {
<<<<<<< HEAD
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.WelcomeScreen(),
=======
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.WelcomeScreen(),
>>>>>>> fc211bf (premerge)
      );
    },
  };
}

/// generated route for
/// [_i1.AboutScreen]
<<<<<<< HEAD
class AboutRoute extends _i28.PageRouteInfo<AboutRouteArgs> {
  AboutRoute({
    _i30.Key? key,
    List<_i28.PageRouteInfo>? children,
=======
class AboutRoute extends _i26.PageRouteInfo<AboutRouteArgs> {
  AboutRoute({
    _i28.Key? key,
    List<_i26.PageRouteInfo>? children,
>>>>>>> fc211bf (premerge)
  }) : super(
          AboutRoute.name,
          args: AboutRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

<<<<<<< HEAD
  static const _i28.PageInfo<AboutRouteArgs> page =
      _i28.PageInfo<AboutRouteArgs>(name);
=======
  static const _i26.PageInfo<AboutRouteArgs> page =
      _i26.PageInfo<AboutRouteArgs>(name);
>>>>>>> fc211bf (premerge)
}

class AboutRouteArgs {
  const AboutRouteArgs({this.key});

<<<<<<< HEAD
  final _i30.Key? key;
=======
  final _i28.Key? key;
>>>>>>> fc211bf (premerge)

  @override
  String toString() {
    return 'AboutRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.BankAccountScreen]
<<<<<<< HEAD
class BankAccountRoute extends _i28.PageRouteInfo<void> {
  const BankAccountRoute({List<_i28.PageRouteInfo>? children})
=======
class BankAccountRoute extends _i26.PageRouteInfo<void> {
  const BankAccountRoute({List<_i26.PageRouteInfo>? children})
>>>>>>> fc211bf (premerge)
      : super(
          BankAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'BankAccountRoute';

<<<<<<< HEAD
  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
=======
  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
>>>>>>> fc211bf (premerge)
}

/// generated route for
/// [_i3.BioDataScreen]
<<<<<<< HEAD
class BioDataRoute extends _i28.PageRouteInfo<void> {
  const BioDataRoute({List<_i28.PageRouteInfo>? children})
=======
class BioDataRoute extends _i26.PageRouteInfo<void> {
  const BioDataRoute({List<_i26.PageRouteInfo>? children})
>>>>>>> fc211bf (premerge)
      : super(
          BioDataRoute.name,
          initialChildren: children,
        );

  static const String name = 'BioDataRoute';

<<<<<<< HEAD
  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
=======
  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
>>>>>>> fc211bf (premerge)
}

/// generated route for
/// [_i4.ForgotPasswordScreen]
<<<<<<< HEAD
class ForgotPasswordRoute extends _i28.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i28.PageRouteInfo>? children})
=======
class ForgotPasswordRoute extends _i26.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i26.PageRouteInfo>? children})
>>>>>>> fc211bf (premerge)
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

<<<<<<< HEAD
  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
=======
  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
>>>>>>> fc211bf (premerge)
}

/// generated route for
/// [_i5.FriendScreen]
<<<<<<< HEAD
class FriendRoute extends _i28.PageRouteInfo<void> {
  const FriendRoute({List<_i28.PageRouteInfo>? children})
=======
class FriendRoute extends _i26.PageRouteInfo<void> {
  const FriendRoute({List<_i26.PageRouteInfo>? children})
>>>>>>> fc211bf (premerge)
      : super(
          FriendRoute.name,
          initialChildren: children,
        );

  static const String name = 'FriendRoute';

<<<<<<< HEAD
  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
=======
  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
>>>>>>> fc211bf (premerge)
}

/// generated route for
/// [_i6.GiftShopScreen]
<<<<<<< HEAD
class GiftShopRoute extends _i28.PageRouteInfo<void> {
  const GiftShopRoute({List<_i28.PageRouteInfo>? children})
=======
class GiftShopRoute extends _i26.PageRouteInfo<void> {
  const GiftShopRoute({List<_i26.PageRouteInfo>? children})
>>>>>>> fc211bf (premerge)
      : super(
          GiftShopRoute.name,
          initialChildren: children,
        );

  static const String name = 'GiftShopRoute';

<<<<<<< HEAD
  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
=======
  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
>>>>>>> fc211bf (premerge)
}

/// generated route for
/// [_i7.HomeScreen]
<<<<<<< HEAD
class HomeRoute extends _i28.PageRouteInfo<void> {
  const HomeRoute({List<_i28.PageRouteInfo>? children})
=======
class HomeRoute extends _i26.PageRouteInfo<void> {
  const HomeRoute({List<_i26.PageRouteInfo>? children})
>>>>>>> fc211bf (premerge)
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

<<<<<<< HEAD
  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
=======
  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
>>>>>>> fc211bf (premerge)
}

/// generated route for
/// [_i8.IntroScreen]
<<<<<<< HEAD
class IntroRoute extends _i28.PageRouteInfo<void> {
  const IntroRoute({List<_i28.PageRouteInfo>? children})
=======
class IntroRoute extends _i26.PageRouteInfo<void> {
  const IntroRoute({List<_i26.PageRouteInfo>? children})
>>>>>>> fc211bf (premerge)
      : super(
          IntroRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroRoute';

<<<<<<< HEAD
  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
=======
  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
>>>>>>> fc211bf (premerge)
}

/// generated route for
/// [_i9.LocationScreen]
<<<<<<< HEAD
class LocationRoute extends _i28.PageRouteInfo<LocationRouteArgs> {
  LocationRoute({
    _i30.Key? key,
    List<_i28.PageRouteInfo>? children,
=======
class LocationRoute extends _i26.PageRouteInfo<LocationRouteArgs> {
  LocationRoute({
    _i28.Key? key,
    List<_i26.PageRouteInfo>? children,
>>>>>>> fc211bf (premerge)
  }) : super(
          LocationRoute.name,
          args: LocationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

<<<<<<< HEAD
  static const _i28.PageInfo<LocationRouteArgs> page =
      _i28.PageInfo<LocationRouteArgs>(name);
=======
  static const _i26.PageInfo<LocationRouteArgs> page =
      _i26.PageInfo<LocationRouteArgs>(name);
>>>>>>> fc211bf (premerge)
}

class LocationRouteArgs {
  const LocationRouteArgs({this.key});

<<<<<<< HEAD
  final _i30.Key? key;
=======
  final _i28.Key? key;
>>>>>>> fc211bf (premerge)

  @override
  String toString() {
    return 'LocationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.MyGiftScreen]
<<<<<<< HEAD
class MyGiftRoute extends _i28.PageRouteInfo<void> {
  const MyGiftRoute({List<_i28.PageRouteInfo>? children})
=======
class MyGiftRoute extends _i26.PageRouteInfo<void> {
  const MyGiftRoute({List<_i26.PageRouteInfo>? children})
>>>>>>> fc211bf (premerge)
      : super(
          MyGiftRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyGiftRoute';

<<<<<<< HEAD
  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i11.NearbySearchScreen]
class NearbySearchRoute extends _i28.PageRouteInfo<void> {
  const NearbySearchRoute({List<_i28.PageRouteInfo>? children})
      : super(
          NearbySearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'NearbySearchRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i12.NotificationScreen]
class NotificationRoute extends _i28.PageRouteInfo<void> {
  const NotificationRoute({List<_i28.PageRouteInfo>? children})
=======
  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i11.NotificationScreen]
class NotificationRoute extends _i26.PageRouteInfo<void> {
  const NotificationRoute({List<_i26.PageRouteInfo>? children})
>>>>>>> fc211bf (premerge)
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

<<<<<<< HEAD
  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i13.PendingRequestScreen]
class PendingRequestRoute extends _i28.PageRouteInfo<void> {
  const PendingRequestRoute({List<_i28.PageRouteInfo>? children})
=======
  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i12.PendingRequestScreen]
class PendingRequestRoute extends _i26.PageRouteInfo<void> {
  const PendingRequestRoute({List<_i26.PageRouteInfo>? children})
>>>>>>> fc211bf (premerge)
      : super(
          PendingRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'PendingRequestRoute';

<<<<<<< HEAD
  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i14.ProductDetailsScreen]
class ProductDetailsRoute extends _i28.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i30.Key? key,
    dynamic product,
    List<_i28.PageRouteInfo>? children,
=======
  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i13.ProductDetailsScreen]
class ProductDetailsRoute extends _i26.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i28.Key? key,
    dynamic product,
    List<_i26.PageRouteInfo>? children,
>>>>>>> fc211bf (premerge)
  }) : super(
          ProductDetailsRoute.name,
          args: ProductDetailsRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

<<<<<<< HEAD
  static const _i28.PageInfo<ProductDetailsRouteArgs> page =
      _i28.PageInfo<ProductDetailsRouteArgs>(name);
=======
  static const _i26.PageInfo<ProductDetailsRouteArgs> page =
      _i26.PageInfo<ProductDetailsRouteArgs>(name);
>>>>>>> fc211bf (premerge)
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    this.key,
    this.product,
  });

<<<<<<< HEAD
  final _i30.Key? key;
=======
  final _i28.Key? key;
>>>>>>> fc211bf (premerge)

  final dynamic product;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i15.ProfileBoostScreen]
class ProfileBoostRoute extends _i28.PageRouteInfo<void> {
  const ProfileBoostRoute({List<_i28.PageRouteInfo>? children})
      : super(
          ProfileBoostRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileBoostRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i16.ProfileCarouselScreen]
class ProfileCarouselRoute
<<<<<<< HEAD
    extends _i28.PageRouteInfo<ProfileCarouselRouteArgs> {
  ProfileCarouselRoute({
    _i30.Key? key,
    List<_i28.PageRouteInfo>? children,
=======
    extends _i26.PageRouteInfo<ProfileCarouselRouteArgs> {
  ProfileCarouselRoute({
    _i28.Key? key,
    List<_i26.PageRouteInfo>? children,
>>>>>>> fc211bf (premerge)
  }) : super(
          ProfileCarouselRoute.name,
          args: ProfileCarouselRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ProfileCarouselRoute';

<<<<<<< HEAD
  static const _i28.PageInfo<ProfileCarouselRouteArgs> page =
      _i28.PageInfo<ProfileCarouselRouteArgs>(name);
=======
  static const _i26.PageInfo<ProfileCarouselRouteArgs> page =
      _i26.PageInfo<ProfileCarouselRouteArgs>(name);
>>>>>>> fc211bf (premerge)
}

class ProfileCarouselRouteArgs {
  const ProfileCarouselRouteArgs({this.key});

<<<<<<< HEAD
  final _i30.Key? key;
=======
  final _i28.Key? key;
>>>>>>> fc211bf (premerge)

  @override
  String toString() {
    return 'ProfileCarouselRouteArgs{key: $key}';
  }
}

/// generated route for
<<<<<<< HEAD
/// [_i17.ProfileEditScreen]
class ProfileEditRoute extends _i28.PageRouteInfo<void> {
  const ProfileEditRoute({List<_i28.PageRouteInfo>? children})
      : super(
          ProfileEditRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileEditRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i18.ProfilePhotoScreen]
class ProfilePhotoRoute extends _i28.PageRouteInfo<ProfilePhotoRouteArgs> {
  ProfilePhotoRoute({
    _i30.Key? key,
    required String username,
    List<_i28.PageRouteInfo>? children,
=======
/// [_i15.ProfilePhotoScreen]
class ProfilePhotoRoute extends _i26.PageRouteInfo<ProfilePhotoRouteArgs> {
  ProfilePhotoRoute({
    _i28.Key? key,
    required String username,
    List<_i26.PageRouteInfo>? children,
>>>>>>> fc211bf (premerge)
  }) : super(
          ProfilePhotoRoute.name,
          args: ProfilePhotoRouteArgs(
            key: key,
            username: username,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfilePhotoRoute';

<<<<<<< HEAD
  static const _i28.PageInfo<ProfilePhotoRouteArgs> page =
      _i28.PageInfo<ProfilePhotoRouteArgs>(name);
=======
  static const _i26.PageInfo<ProfilePhotoRouteArgs> page =
      _i26.PageInfo<ProfilePhotoRouteArgs>(name);
>>>>>>> fc211bf (premerge)
}

class ProfilePhotoRouteArgs {
  const ProfilePhotoRouteArgs({
    this.key,
    required this.username,
  });

<<<<<<< HEAD
  final _i30.Key? key;
=======
  final _i28.Key? key;
>>>>>>> fc211bf (premerge)

  final String username;

  @override
  String toString() {
    return 'ProfilePhotoRouteArgs{key: $key, username: $username}';
  }
}

/// generated route for
<<<<<<< HEAD
/// [_i19.ProfileScreen]
class ProfileRoute extends _i28.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i30.Key? key,
    String? profileId,
    List<_i28.PageRouteInfo>? children,
=======
/// [_i16.ProfileScreen]
class ProfileRoute extends _i26.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i28.Key? key,
    List<_i26.PageRouteInfo>? children,
>>>>>>> fc211bf (premerge)
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i26.PageInfo<ProfileRouteArgs> page =
      _i26.PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i17.ProfileViewScreen]
class ProfileViewRoute extends _i26.PageRouteInfo<ProfileViewRouteArgs> {
  ProfileViewRoute({
    _i28.Key? key,
    required String profileId,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          ProfileViewRoute.name,
          args: ProfileViewRouteArgs(
            key: key,
            profileId: profileId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileViewRoute';

<<<<<<< HEAD
  static const _i28.PageInfo<ProfileRouteArgs> page =
      _i28.PageInfo<ProfileRouteArgs>(name);
=======
  static const _i26.PageInfo<ProfileViewRouteArgs> page =
      _i26.PageInfo<ProfileViewRouteArgs>(name);
>>>>>>> fc211bf (premerge)
}

class ProfileViewRouteArgs {
  const ProfileViewRouteArgs({
    this.key,
    required this.profileId,
  });

<<<<<<< HEAD
  final _i30.Key? key;
=======
  final _i28.Key? key;
>>>>>>> fc211bf (premerge)

  final String profileId;

  @override
  String toString() {
    return 'ProfileViewRouteArgs{key: $key, profileId: $profileId}';
  }
}

/// generated route for
<<<<<<< HEAD
/// [_i20.RefereeScreen]
class RefereeRoute extends _i28.PageRouteInfo<void> {
  const RefereeRoute({List<_i28.PageRouteInfo>? children})
=======
/// [_i18.RefereeScreen]
class RefereeRoute extends _i26.PageRouteInfo<void> {
  const RefereeRoute({List<_i26.PageRouteInfo>? children})
>>>>>>> fc211bf (premerge)
      : super(
          RefereeRoute.name,
          initialChildren: children,
        );

  static const String name = 'RefereeRoute';

<<<<<<< HEAD
  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i21.ResetPasswordOtpScreen]
class ResetPasswordOtpRoute
    extends _i28.PageRouteInfo<ResetPasswordOtpRouteArgs> {
  ResetPasswordOtpRoute({
    _i30.Key? key,
    required String email,
    List<_i28.PageRouteInfo>? children,
=======
  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i19.ResetPasswordOtpScreen]
class ResetPasswordOtpRoute
    extends _i26.PageRouteInfo<ResetPasswordOtpRouteArgs> {
  ResetPasswordOtpRoute({
    _i28.Key? key,
    required String email,
    List<_i26.PageRouteInfo>? children,
>>>>>>> fc211bf (premerge)
  }) : super(
          ResetPasswordOtpRoute.name,
          args: ResetPasswordOtpRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'ResetPasswordOtpRoute';

<<<<<<< HEAD
  static const _i28.PageInfo<ResetPasswordOtpRouteArgs> page =
      _i28.PageInfo<ResetPasswordOtpRouteArgs>(name);
=======
  static const _i26.PageInfo<ResetPasswordOtpRouteArgs> page =
      _i26.PageInfo<ResetPasswordOtpRouteArgs>(name);
>>>>>>> fc211bf (premerge)
}

class ResetPasswordOtpRouteArgs {
  const ResetPasswordOtpRouteArgs({
    this.key,
    required this.email,
  });

<<<<<<< HEAD
  final _i30.Key? key;
=======
  final _i28.Key? key;
>>>>>>> fc211bf (premerge)

  final String email;

  @override
  String toString() {
    return 'ResetPasswordOtpRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
<<<<<<< HEAD
/// [_i22.ResetPasswordScreen]
class ResetPasswordRoute extends _i28.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    _i30.Key? key,
    required _i29.ResetPasswordRequest request,
    List<_i28.PageRouteInfo>? children,
=======
/// [_i20.ResetPasswordScreen]
class ResetPasswordRoute extends _i26.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    _i28.Key? key,
    required _i27.ResetPasswordRequest request,
    List<_i26.PageRouteInfo>? children,
>>>>>>> fc211bf (premerge)
  }) : super(
          ResetPasswordRoute.name,
          args: ResetPasswordRouteArgs(
            key: key,
            request: request,
          ),
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

<<<<<<< HEAD
  static const _i28.PageInfo<ResetPasswordRouteArgs> page =
      _i28.PageInfo<ResetPasswordRouteArgs>(name);
=======
  static const _i26.PageInfo<ResetPasswordRouteArgs> page =
      _i26.PageInfo<ResetPasswordRouteArgs>(name);
>>>>>>> fc211bf (premerge)
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({
    this.key,
    required this.request,
  });

<<<<<<< HEAD
  final _i30.Key? key;

  final _i29.ResetPasswordRequest request;
=======
  final _i28.Key? key;

  final _i27.ResetPasswordRequest request;
>>>>>>> fc211bf (premerge)

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key, request: $request}';
  }
}

/// generated route for
<<<<<<< HEAD
/// [_i23.SelectLanguageScreen]
class SelectLanguageRoute extends _i28.PageRouteInfo<SelectLanguageRouteArgs> {
  SelectLanguageRoute({
    _i30.Key? key,
    required List<String> languages,
    List<_i28.PageRouteInfo>? children,
=======
/// [_i21.SelectLanguageScreen]
class SelectLanguageRoute extends _i26.PageRouteInfo<SelectLanguageRouteArgs> {
  SelectLanguageRoute({
    _i28.Key? key,
    required List<String> languages,
    List<_i26.PageRouteInfo>? children,
>>>>>>> fc211bf (premerge)
  }) : super(
          SelectLanguageRoute.name,
          args: SelectLanguageRouteArgs(
            key: key,
            languages: languages,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectLanguageRoute';

<<<<<<< HEAD
  static const _i28.PageInfo<SelectLanguageRouteArgs> page =
      _i28.PageInfo<SelectLanguageRouteArgs>(name);
=======
  static const _i26.PageInfo<SelectLanguageRouteArgs> page =
      _i26.PageInfo<SelectLanguageRouteArgs>(name);
>>>>>>> fc211bf (premerge)
}

class SelectLanguageRouteArgs {
  const SelectLanguageRouteArgs({
    this.key,
    required this.languages,
  });

<<<<<<< HEAD
  final _i30.Key? key;
=======
  final _i28.Key? key;
>>>>>>> fc211bf (premerge)

  final List<String> languages;

  @override
  String toString() {
    return 'SelectLanguageRouteArgs{key: $key, languages: $languages}';
  }
}

/// generated route for
<<<<<<< HEAD
/// [_i24.SignInScreen]
class SignInRoute extends _i28.PageRouteInfo<void> {
  const SignInRoute({List<_i28.PageRouteInfo>? children})
=======
/// [_i22.SignInScreen]
class SignInRoute extends _i26.PageRouteInfo<void> {
  const SignInRoute({List<_i26.PageRouteInfo>? children})
>>>>>>> fc211bf (premerge)
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

<<<<<<< HEAD
  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i25.SignUpScreen]
class SignUpRoute extends _i28.PageRouteInfo<void> {
  const SignUpRoute({List<_i28.PageRouteInfo>? children})
=======
  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i23.SignUpScreen]
class SignUpRoute extends _i26.PageRouteInfo<void> {
  const SignUpRoute({List<_i26.PageRouteInfo>? children})
>>>>>>> fc211bf (premerge)
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

<<<<<<< HEAD
  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i26.VerificationScreen]
class VerificationRoute extends _i28.PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({
    _i30.Key? key,
=======
  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i24.VerificationScreen]
class VerificationRoute extends _i26.PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({
    _i28.Key? key,
>>>>>>> fc211bf (premerge)
    required bool isPhoneNumber,
    required String phoneNumber,
    required String countryCode,
    required String email,
<<<<<<< HEAD
    List<_i28.PageRouteInfo>? children,
=======
    List<_i26.PageRouteInfo>? children,
>>>>>>> fc211bf (premerge)
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

<<<<<<< HEAD
  static const _i28.PageInfo<VerificationRouteArgs> page =
      _i28.PageInfo<VerificationRouteArgs>(name);
=======
  static const _i26.PageInfo<VerificationRouteArgs> page =
      _i26.PageInfo<VerificationRouteArgs>(name);
>>>>>>> fc211bf (premerge)
}

class VerificationRouteArgs {
  const VerificationRouteArgs({
    this.key,
    required this.isPhoneNumber,
    required this.phoneNumber,
    required this.countryCode,
    required this.email,
  });

<<<<<<< HEAD
  final _i30.Key? key;
=======
  final _i28.Key? key;
>>>>>>> fc211bf (premerge)

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
<<<<<<< HEAD
/// [_i27.WelcomeScreen]
class WelcomeRoute extends _i28.PageRouteInfo<void> {
  const WelcomeRoute({List<_i28.PageRouteInfo>? children})
=======
/// [_i25.WelcomeScreen]
class WelcomeRoute extends _i26.PageRouteInfo<void> {
  const WelcomeRoute({List<_i26.PageRouteInfo>? children})
>>>>>>> fc211bf (premerge)
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

<<<<<<< HEAD
  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
=======
  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
>>>>>>> fc211bf (premerge)
}
