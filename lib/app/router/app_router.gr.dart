// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i41;
import 'package:flutter/cupertino.dart' as _i43;
import 'package:flutter/material.dart' as _i46;
import 'package:zheeta/authentication/presentation/views/forgot_screen.dart'
    as _i10;
import 'package:zheeta/authentication/presentation/views/reset_password_otp_screen.dart'
    as _i35;
import 'package:zheeta/authentication/presentation/views/signin_screen.dart'
    as _i36;
import 'package:zheeta/authentication/presentation/views/signup_screen.dart'
    as _i37;
import 'package:zheeta/authentication/presentation/views/verification_screen.dart'
    as _i38;
import 'package:zheeta/connections/presentation/views/downlines/downlines_screen.dart'
    as _i6;
import 'package:zheeta/connections/presentation/views/downlines/referee_list_screen.dart'
    as _i34;
import 'package:zheeta/connections/presentation/views/friends/friend_requests_screen.dart'
    as _i11;
import 'package:zheeta/connections/presentation/views/friends/friend_screen.dart'
    as _i12;
import 'package:zheeta/discover/presentation/views/nearby_search_screen.dart'
    as _i20;
import 'package:zheeta/events/data/model/buddy_events_feed.dart' as _i42;
import 'package:zheeta/events/presentation/views/create_event/create_event_screen.dart'
    as _i5;
import 'package:zheeta/events/presentation/views/create_event/event_preview_screen.dart'
    as _i9;
import 'package:zheeta/events/presentation/views/events_feed/event_details_screen.dart'
    as _i7;
import 'package:zheeta/events/presentation/views/events_feed/event_feed_screen.dart'
    as _i8;
import 'package:zheeta/events/presentation/views/profile_boost_view_screen.dart'
    as _i26;
import 'package:zheeta/events/presentation/views/user_buddy_events/my_buddy_events_screen.dart'
    as _i18;
import 'package:zheeta/gifts/data/model/gift_model.dart' as _i44;
import 'package:zheeta/gifts/presentation/views/gift_shop/giftshop_product_screen.dart'
    as _i22;
import 'package:zheeta/gifts/presentation/views/gift_shop/giftshop_screen.dart'
    as _i13;
import 'package:zheeta/gifts/presentation/views/user_gifts/mygift_screen.dart'
    as _i19;
import 'package:zheeta/gifts/presentation/views/user_gifts/redeem_gift_details_screen.dart'
    as _i33;
import 'package:zheeta/homepage/presentation/views/home_screen.dart' as _i14;
import 'package:zheeta/notification/presentation/views/notification_screen.dart'
    as _i21;
import 'package:zheeta/payment_and_subscriptions/presentation/views/charges_screen.dart'
    as _i4;
import 'package:zheeta/payment_and_subscriptions/presentation/views/membership_upgrade_screen.dart'
    as _i17;
import 'package:zheeta/profile/data/model/matched_profile_boost_model.dart'
    as _i45;
import 'package:zheeta/profile/presentation/views/profile/profile_screen.dart'
    as _i30;
import 'package:zheeta/profile/presentation/views/profile_boost/profile_boost_insight_screen.dart'
    as _i24;
import 'package:zheeta/profile/presentation/views/profile_boost/profile_boost_screen.dart'
    as _i25;
import 'package:zheeta/profile/presentation/views/profile_create/about_screen.dart'
    as _i1;
import 'package:zheeta/profile/presentation/views/profile_create/bio_data_screen.dart'
    as _i3;
import 'package:zheeta/profile/presentation/views/profile_create/location_screen.dart'
    as _i16;
import 'package:zheeta/profile/presentation/views/profile_create/profile_carousel_screen.dart'
    as _i27;
import 'package:zheeta/profile/presentation/views/profile_create/profilephoto_screen.dart'
    as _i31;
import 'package:zheeta/profile/presentation/views/profile_edit/profile_access_screen.dart_screen.dart'
    as _i23;
import 'package:zheeta/profile/presentation/views/profile_edit/profile_edit_carousel_screen.dart'
    as _i28;
import 'package:zheeta/profile/presentation/views/profile_edit/profile_edit_screen.dart'
    as _i29;
import 'package:zheeta/profile/presentation/views/profile_view/profile_view_screen.dart'
    as _i32;
import 'package:zheeta/splash_screen/presentation/views/intro.dart' as _i15;
import 'package:zheeta/splash_screen/presentation/views/welcome.dart' as _i40;
import 'package:zheeta/wallet/presentation/views/bank_screen.dart' as _i2;
import 'package:zheeta/wallet/presentation/views/wallet_screen.dart' as _i39;

/// generated route for
/// [_i1.AboutScreen]
class AboutRoute extends _i41.PageRouteInfo<void> {
  const AboutRoute({List<_i41.PageRouteInfo>? children})
      : super(
          AboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return _i1.AboutScreen();
    },
  );
}

/// generated route for
/// [_i2.BankAccountScreen]
class BankAccountRoute extends _i41.PageRouteInfo<void> {
  const BankAccountRoute({List<_i41.PageRouteInfo>? children})
      : super(
          BankAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'BankAccountRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return const _i2.BankAccountScreen();
    },
  );
}

/// generated route for
/// [_i3.BioDataScreen]
class BioDataRoute extends _i41.PageRouteInfo<void> {
  const BioDataRoute({List<_i41.PageRouteInfo>? children})
      : super(
          BioDataRoute.name,
          initialChildren: children,
        );

  static const String name = 'BioDataRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return _i3.BioDataScreen();
    },
  );
}

/// generated route for
/// [_i4.ChargesList]
class ChargesList extends _i41.PageRouteInfo<void> {
  const ChargesList({List<_i41.PageRouteInfo>? children})
      : super(
          ChargesList.name,
          initialChildren: children,
        );

  static const String name = 'ChargesList';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return const _i4.ChargesList();
    },
  );
}

/// generated route for
/// [_i5.CreateEventScreen]
class CreateEventRoute extends _i41.PageRouteInfo<void> {
  const CreateEventRoute({List<_i41.PageRouteInfo>? children})
      : super(
          CreateEventRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateEventRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return _i5.CreateEventScreen();
    },
  );
}

/// generated route for
/// [_i6.DownLinesScreen]
class DownLinesRoute extends _i41.PageRouteInfo<void> {
  const DownLinesRoute({List<_i41.PageRouteInfo>? children})
      : super(
          DownLinesRoute.name,
          initialChildren: children,
        );

  static const String name = 'DownLinesRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return const _i6.DownLinesScreen();
    },
  );
}

/// generated route for
/// [_i7.EventDetailsScreen]
class EventDetailsRoute extends _i41.PageRouteInfo<EventDetailsRouteArgs> {
  EventDetailsRoute({
    required _i42.BuddyEvent event,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          EventDetailsRoute.name,
          args: EventDetailsRouteArgs(event: event),
          initialChildren: children,
        );

  static const String name = 'EventDetailsRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventDetailsRouteArgs>();
      return _i7.EventDetailsScreen(event: args.event);
    },
  );
}

class EventDetailsRouteArgs {
  const EventDetailsRouteArgs({required this.event});

  final _i42.BuddyEvent event;

  @override
  String toString() {
    return 'EventDetailsRouteArgs{event: $event}';
  }
}

/// generated route for
/// [_i8.EventFeedPage]
class EventFeedRoute extends _i41.PageRouteInfo<void> {
  const EventFeedRoute({List<_i41.PageRouteInfo>? children})
      : super(
          EventFeedRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventFeedRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return const _i8.EventFeedPage();
    },
  );
}

/// generated route for
/// [_i9.EventPreviewScreen]
class EventPreviewRoute extends _i41.PageRouteInfo<EventPreviewRouteArgs> {
  EventPreviewRoute({
    required _i9.Event event,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          EventPreviewRoute.name,
          args: EventPreviewRouteArgs(event: event),
          initialChildren: children,
        );

  static const String name = 'EventPreviewRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventPreviewRouteArgs>();
      return _i9.EventPreviewScreen(event: args.event);
    },
  );
}

class EventPreviewRouteArgs {
  const EventPreviewRouteArgs({required this.event});

  final _i9.Event event;

  @override
  String toString() {
    return 'EventPreviewRouteArgs{event: $event}';
  }
}

/// generated route for
/// [_i10.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i41.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i41.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return const _i10.ForgotPasswordScreen();
    },
  );
}

/// generated route for
/// [_i11.FriendRequestsScreen]
class FriendRequestsRoute extends _i41.PageRouteInfo<void> {
  const FriendRequestsRoute({List<_i41.PageRouteInfo>? children})
      : super(
          FriendRequestsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FriendRequestsRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return const _i11.FriendRequestsScreen();
    },
  );
}

/// generated route for
/// [_i12.FriendScreen]
class FriendRoute extends _i41.PageRouteInfo<void> {
  const FriendRoute({List<_i41.PageRouteInfo>? children})
      : super(
          FriendRoute.name,
          initialChildren: children,
        );

  static const String name = 'FriendRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return _i12.FriendScreen();
    },
  );
}

/// generated route for
/// [_i13.GiftShopScreen]
class GiftShopRoute extends _i41.PageRouteInfo<void> {
  const GiftShopRoute({List<_i41.PageRouteInfo>? children})
      : super(
          GiftShopRoute.name,
          initialChildren: children,
        );

  static const String name = 'GiftShopRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return const _i13.GiftShopScreen();
    },
  );
}

/// generated route for
/// [_i14.HomeScreen]
class HomeRoute extends _i41.PageRouteInfo<void> {
  const HomeRoute({List<_i41.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return const _i14.HomeScreen();
    },
  );
}

/// generated route for
/// [_i15.IntroScreen]
class IntroRoute extends _i41.PageRouteInfo<void> {
  const IntroRoute({List<_i41.PageRouteInfo>? children})
      : super(
          IntroRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return const _i15.IntroScreen();
    },
  );
}

/// generated route for
/// [_i16.LocationScreen]
class LocationRoute extends _i41.PageRouteInfo<void> {
  const LocationRoute({List<_i41.PageRouteInfo>? children})
      : super(
          LocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return _i16.LocationScreen();
    },
  );
}

/// generated route for
/// [_i17.MembershipSubscriptionScreen]
class MembershipSubscriptionRoute extends _i41.PageRouteInfo<void> {
  const MembershipSubscriptionRoute({List<_i41.PageRouteInfo>? children})
      : super(
          MembershipSubscriptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'MembershipSubscriptionRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return const _i17.MembershipSubscriptionScreen();
    },
  );
}

/// generated route for
/// [_i18.MyBuddyEventsScreen]
class MyBuddyEventsRoute extends _i41.PageRouteInfo<void> {
  const MyBuddyEventsRoute({List<_i41.PageRouteInfo>? children})
      : super(
          MyBuddyEventsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyBuddyEventsRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return const _i18.MyBuddyEventsScreen();
    },
  );
}

/// generated route for
/// [_i19.MyGiftScreen]
class MyGiftRoute extends _i41.PageRouteInfo<void> {
  const MyGiftRoute({List<_i41.PageRouteInfo>? children})
      : super(
          MyGiftRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyGiftRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return const _i19.MyGiftScreen();
    },
  );
}

/// generated route for
/// [_i20.NearbySearchScreen]
class NearbySearchRoute extends _i41.PageRouteInfo<void> {
  const NearbySearchRoute({List<_i41.PageRouteInfo>? children})
      : super(
          NearbySearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'NearbySearchRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return const _i20.NearbySearchScreen();
    },
  );
}

/// generated route for
/// [_i21.NotificationScreen]
class NotificationRoute extends _i41.PageRouteInfo<void> {
  const NotificationRoute({List<_i41.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return const _i21.NotificationScreen();
    },
  );
}

/// generated route for
/// [_i22.ProductDetailsScreen]
class ProductDetailsRoute extends _i41.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i43.Key? key,
    required _i44.GiftModel gift,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          ProductDetailsRoute.name,
          args: ProductDetailsRouteArgs(
            key: key,
            gift: gift,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailsRouteArgs>();
      return _i22.ProductDetailsScreen(
        key: args.key,
        gift: args.gift,
      );
    },
  );
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    this.key,
    required this.gift,
  });

  final _i43.Key? key;

  final _i44.GiftModel gift;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, gift: $gift}';
  }
}

/// generated route for
/// [_i23.ProfileAccessManagementScreen]
class ProfileAccessManagementRoute extends _i41.PageRouteInfo<void> {
  const ProfileAccessManagementRoute({List<_i41.PageRouteInfo>? children})
      : super(
          ProfileAccessManagementRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileAccessManagementRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return _i23.ProfileAccessManagementScreen();
    },
  );
}

/// generated route for
/// [_i24.ProfileBoostInsightScreen]
class ProfileBoostInsightRoute extends _i41.PageRouteInfo<void> {
  const ProfileBoostInsightRoute({List<_i41.PageRouteInfo>? children})
      : super(
          ProfileBoostInsightRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileBoostInsightRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return const _i24.ProfileBoostInsightScreen();
    },
  );
}

/// generated route for
/// [_i25.ProfileBoostScreen]
class ProfileBoostRoute extends _i41.PageRouteInfo<void> {
  const ProfileBoostRoute({List<_i41.PageRouteInfo>? children})
      : super(
          ProfileBoostRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileBoostRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return _i25.ProfileBoostScreen();
    },
  );
}

/// generated route for
/// [_i26.ProfileBoostViewScreen]
class ProfileBoostViewRoute
    extends _i41.PageRouteInfo<ProfileBoostViewRouteArgs> {
  ProfileBoostViewRoute({
    required _i45.ProfileBoostModel profile,
    required List<_i45.ProfileBoostModel> profiles,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          ProfileBoostViewRoute.name,
          args: ProfileBoostViewRouteArgs(
            profile: profile,
            profiles: profiles,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileBoostViewRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileBoostViewRouteArgs>();
      return _i26.ProfileBoostViewScreen(
        profile: args.profile,
        profiles: args.profiles,
      );
    },
  );
}

class ProfileBoostViewRouteArgs {
  const ProfileBoostViewRouteArgs({
    required this.profile,
    required this.profiles,
  });

  final _i45.ProfileBoostModel profile;

  final List<_i45.ProfileBoostModel> profiles;

  @override
  String toString() {
    return 'ProfileBoostViewRouteArgs{profile: $profile, profiles: $profiles}';
  }
}

/// generated route for
/// [_i27.ProfileCarouselScreen]
class ProfileCarouselRoute extends _i41.PageRouteInfo<void> {
  const ProfileCarouselRoute({List<_i41.PageRouteInfo>? children})
      : super(
          ProfileCarouselRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileCarouselRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return const _i27.ProfileCarouselScreen();
    },
  );
}

/// generated route for
/// [_i28.ProfileEditCarouselScreen]
class ProfileEditCarouselRoute extends _i41.PageRouteInfo<void> {
  const ProfileEditCarouselRoute({List<_i41.PageRouteInfo>? children})
      : super(
          ProfileEditCarouselRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileEditCarouselRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return const _i28.ProfileEditCarouselScreen();
    },
  );
}

/// generated route for
/// [_i29.ProfileEditScreen]
class ProfileEditRoute extends _i41.PageRouteInfo<ProfileEditRouteArgs> {
  ProfileEditRoute({
    _i46.Key? key,
    required int activeTab,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          ProfileEditRoute.name,
          args: ProfileEditRouteArgs(
            key: key,
            activeTab: activeTab,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileEditRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileEditRouteArgs>();
      return _i29.ProfileEditScreen(
        key: args.key,
        activeTab: args.activeTab,
      );
    },
  );
}

class ProfileEditRouteArgs {
  const ProfileEditRouteArgs({
    this.key,
    required this.activeTab,
  });

  final _i46.Key? key;

  final int activeTab;

  @override
  String toString() {
    return 'ProfileEditRouteArgs{key: $key, activeTab: $activeTab}';
  }
}

/// generated route for
/// [_i30.ProfilePage]
class ProfileRoute extends _i41.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i46.Key? key,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<ProfileRouteArgs>(orElse: () => const ProfileRouteArgs());
      return _i30.ProfilePage(key: args.key);
    },
  );
}

class ProfileRouteArgs {
  const ProfileRouteArgs({this.key});

  final _i46.Key? key;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i31.ProfilePhotoScreen]
class ProfilePhotoRoute extends _i41.PageRouteInfo<void> {
  const ProfilePhotoRoute({List<_i41.PageRouteInfo>? children})
      : super(
          ProfilePhotoRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfilePhotoRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return _i31.ProfilePhotoScreen();
    },
  );
}

/// generated route for
/// [_i32.ProfileViewScreen]
class ProfileViewRoute extends _i41.PageRouteInfo<ProfileViewRouteArgs> {
  ProfileViewRoute({
    _i46.Key? key,
    required String profileId,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          ProfileViewRoute.name,
          args: ProfileViewRouteArgs(
            key: key,
            profileId: profileId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileViewRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileViewRouteArgs>();
      return _i32.ProfileViewScreen(
        key: args.key,
        profileId: args.profileId,
      );
    },
  );
}

class ProfileViewRouteArgs {
  const ProfileViewRouteArgs({
    this.key,
    required this.profileId,
  });

  final _i46.Key? key;

  final String profileId;

  @override
  String toString() {
    return 'ProfileViewRouteArgs{key: $key, profileId: $profileId}';
  }
}

/// generated route for
/// [_i33.RedeemGiftDetailScreen]
class RedeemGiftDetailRoute
    extends _i41.PageRouteInfo<RedeemGiftDetailRouteArgs> {
  RedeemGiftDetailRoute({
    _i46.Key? key,
    required double totalAmount,
    required String giftId,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          RedeemGiftDetailRoute.name,
          args: RedeemGiftDetailRouteArgs(
            key: key,
            totalAmount: totalAmount,
            giftId: giftId,
          ),
          initialChildren: children,
        );

  static const String name = 'RedeemGiftDetailRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RedeemGiftDetailRouteArgs>();
      return _i33.RedeemGiftDetailScreen(
        key: args.key,
        totalAmount: args.totalAmount,
        giftId: args.giftId,
      );
    },
  );
}

class RedeemGiftDetailRouteArgs {
  const RedeemGiftDetailRouteArgs({
    this.key,
    required this.totalAmount,
    required this.giftId,
  });

  final _i46.Key? key;

  final double totalAmount;

  final String giftId;

  @override
  String toString() {
    return 'RedeemGiftDetailRouteArgs{key: $key, totalAmount: $totalAmount, giftId: $giftId}';
  }
}

/// generated route for
/// [_i34.RefereeListScreen]
class RefereeListRoute extends _i41.PageRouteInfo<void> {
  const RefereeListRoute({List<_i41.PageRouteInfo>? children})
      : super(
          RefereeListRoute.name,
          initialChildren: children,
        );

  static const String name = 'RefereeListRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return _i34.RefereeListScreen();
    },
  );
}

/// generated route for
/// [_i35.ResetPasswordOtpScreen]
class ResetPasswordOtpRoute
    extends _i41.PageRouteInfo<ResetPasswordOtpRouteArgs> {
  ResetPasswordOtpRoute({
    _i46.Key? key,
    required String email,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          ResetPasswordOtpRoute.name,
          args: ResetPasswordOtpRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'ResetPasswordOtpRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResetPasswordOtpRouteArgs>();
      return _i35.ResetPasswordOtpScreen(
        key: args.key,
        email: args.email,
      );
    },
  );
}

class ResetPasswordOtpRouteArgs {
  const ResetPasswordOtpRouteArgs({
    this.key,
    required this.email,
  });

  final _i46.Key? key;

  final String email;

  @override
  String toString() {
    return 'ResetPasswordOtpRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i36.SignInScreen]
class SignInRoute extends _i41.PageRouteInfo<void> {
  const SignInRoute({List<_i41.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return const _i36.SignInScreen();
    },
  );
}

/// generated route for
/// [_i37.SignUpScreen]
class SignUpRoute extends _i41.PageRouteInfo<void> {
  const SignUpRoute({List<_i41.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return const _i37.SignUpScreen();
    },
  );
}

/// generated route for
/// [_i38.VerificationScreen]
class VerificationRoute extends _i41.PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({
    _i46.Key? key,
    required bool isPhoneNumber,
    required String phoneNumber,
    required String countryCode,
    required String email,
    List<_i41.PageRouteInfo>? children,
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

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerificationRouteArgs>();
      return _i38.VerificationScreen(
        key: args.key,
        isPhoneNumber: args.isPhoneNumber,
        phoneNumber: args.phoneNumber,
        countryCode: args.countryCode,
        email: args.email,
      );
    },
  );
}

class VerificationRouteArgs {
  const VerificationRouteArgs({
    this.key,
    required this.isPhoneNumber,
    required this.phoneNumber,
    required this.countryCode,
    required this.email,
  });

  final _i46.Key? key;

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
/// [_i39.WalletScreen]
class WalletRoute extends _i41.PageRouteInfo<void> {
  const WalletRoute({List<_i41.PageRouteInfo>? children})
      : super(
          WalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return const _i39.WalletScreen();
    },
  );
}

/// generated route for
/// [_i40.WelcomeScreen]
class WelcomeRoute extends _i41.PageRouteInfo<void> {
  const WelcomeRoute({List<_i41.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static _i41.PageInfo page = _i41.PageInfo(
    name,
    builder: (data) {
      return const _i40.WelcomeScreen();
    },
  );
}
