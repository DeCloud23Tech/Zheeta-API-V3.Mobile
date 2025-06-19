// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i58;
import 'package:flutter/cupertino.dart' as _i60;
import 'package:flutter/material.dart' as _i59;
import 'package:zheeta/features/authentication/data/request/reset_password_request.dart'
    as _i63;
import 'package:zheeta/features/authentication/presentation/views/forgot_screen.dart'
    as _i14;
import 'package:zheeta/features/authentication/presentation/views/reset_password_otp_screen.dart'
    as _i44;
import 'package:zheeta/features/authentication/presentation/views/reset_password_screen.dart'
    as _i45;
import 'package:zheeta/features/authentication/presentation/views/signin_screen.dart'
    as _i49;
import 'package:zheeta/features/authentication/presentation/views/signup_screen.dart'
    as _i50;
import 'package:zheeta/features/authentication/presentation/views/verification_screen.dart'
    as _i53;
import 'package:zheeta/features/buddy_events/presentation/views/create_event/create_event_screen.dart'
    as _i6;
import 'package:zheeta/features/buddy_events/presentation/views/create_event/event_preview_screen.dart'
    as _i12;
import 'package:zheeta/features/buddy_events/presentation/views/create_event/steps/date_time_location_screen.dart'
    as _i7;
import 'package:zheeta/features/buddy_events/presentation/views/create_event/steps/event_info_screen.dart'
    as _i11;
import 'package:zheeta/features/buddy_events/presentation/views/create_event/steps/guide_lines_screen.dart'
    as _i18;
import 'package:zheeta/features/buddy_events/presentation/views/create_event/steps/target_insight_screen.dart'
    as _i51;
import 'package:zheeta/features/buddy_events/presentation/views/event_verification/event_verification_screen.dart'
    as _i13;
import 'package:zheeta/features/buddy_events/presentation/views/events_feed/event_details_screen.dart'
    as _i9;
import 'package:zheeta/features/buddy_events/presentation/views/events_feed/event_feed_screen.dart'
    as _i10;
import 'package:zheeta/features/buddy_events/presentation/views/profile_boost/profile_boost_view_screen.dart'
    as _i35;
import 'package:zheeta/features/buddy_events/presentation/views/share_screen.dart'
    as _i48;
import 'package:zheeta/features/buddy_events/presentation/views/user_buddy_events/my_buddy_events_screen.dart'
    as _i23;
import 'package:zheeta/features/connections/presentation/views/downlines/downlines_screen.dart'
    as _i8;
import 'package:zheeta/features/connections/presentation/views/downlines/referee_list_screen.dart'
    as _i43;
import 'package:zheeta/features/connections/presentation/views/friends/friend_requests_screen.dart'
    as _i15;
import 'package:zheeta/features/connections/presentation/views/friends/friend_screen.dart'
    as _i16;
import 'package:zheeta/features/discover/presentation/views/nearby_search_screen.dart'
    as _i25;
import 'package:zheeta/features/gifts/data/model/gift_model.dart' as _i61;
import 'package:zheeta/features/gifts/presentation/views/gift_shop/giftshop_product_screen.dart'
    as _i31;
import 'package:zheeta/features/gifts/presentation/views/gift_shop/giftshop_screen.dart'
    as _i17;
import 'package:zheeta/features/gifts/presentation/views/user_gifts/mygift_screen.dart'
    as _i24;
import 'package:zheeta/features/gifts/presentation/views/user_gifts/redeem_gift_details_screen.dart'
    as _i42;
import 'package:zheeta/features/homepage/presentation/views/home_screen.dart'
    as _i19;
import 'package:zheeta/features/messages/presentation/views/chat_conversation_screen.dart'
    as _i4;
import 'package:zheeta/features/messages/presentation/views/chat_messages.dart'
    as _i5;
import 'package:zheeta/features/notification/presentation/views/notification_screen.dart'
    as _i26;
import 'package:zheeta/features/payment_and_subscriptions/presentation/views/fund_wallet/payment_type_screen.dart'
    as _i27;
import 'package:zheeta/features/payment_and_subscriptions/presentation/views/payout_accounts/payout_account_screen.dart'
    as _i28;
import 'package:zheeta/features/payment_and_subscriptions/presentation/views/payout_accounts/payout_create_account.dart'
    as _i29;
import 'package:zheeta/features/payment_and_subscriptions/presentation/views/payout_accounts/payout_menu_screen.dart'
    as _i30;
import 'package:zheeta/features/payment_and_subscriptions/presentation/views/subscription_and_charges/charges_screen.dart'
    as _i3;
import 'package:zheeta/features/payment_and_subscriptions/presentation/views/subscription_and_charges/membership_subscription_screen.dart'
    as _i22;
import 'package:zheeta/features/profile/data/model/matched_profile_boost_model.dart'
    as _i62;
import 'package:zheeta/features/profile/data/model/user_profile_model.dart'
    as _i64;
import 'package:zheeta/features/profile/presentation/views/profile/profile_screen.dart'
    as _i39;
import 'package:zheeta/features/profile/presentation/views/profile_boost/profile_boost_insight_screen.dart'
    as _i33;
import 'package:zheeta/features/profile/presentation/views/profile_boost/profile_boost_screen.dart'
    as _i34;
import 'package:zheeta/features/profile/presentation/views/profile_create/about_screen.dart'
    as _i1;
import 'package:zheeta/features/profile/presentation/views/profile_create/bio_data_screen.dart'
    as _i2;
import 'package:zheeta/features/profile/presentation/views/profile_create/location_screen.dart'
    as _i21;
import 'package:zheeta/features/profile/presentation/views/profile_create/profile_carousel_screen.dart'
    as _i36;
import 'package:zheeta/features/profile/presentation/views/profile_create/profilephoto_screen.dart'
    as _i40;
import 'package:zheeta/features/profile/presentation/views/profile_edit/profile_access_screen.dart_screen.dart'
    as _i32;
import 'package:zheeta/features/profile/presentation/views/profile_edit/profile_edit_carousel_screen.dart'
    as _i37;
import 'package:zheeta/features/profile/presentation/views/profile_edit/profile_edit_screen.dart'
    as _i38;
import 'package:zheeta/features/profile/presentation/views/profile_view/profile_view_screen.dart'
    as _i41;
import 'package:zheeta/features/splash_screen/presentation/views/intro.dart'
    as _i20;
import 'package:zheeta/features/splash_screen/presentation/views/welcome.dart'
    as _i55;
import 'package:zheeta/features/wallet_and_transactions/presentation/views/transactions/transactions_screen.dart'
    as _i52;
import 'package:zheeta/features/wallet_and_transactions/presentation/views/wallet-transfer/send_coin_details_screen.dart'
    as _i46;
import 'package:zheeta/features/wallet_and_transactions/presentation/views/wallet-transfer/send_coin_screen.dart'
    as _i47;
import 'package:zheeta/features/wallet_and_transactions/presentation/views/wallet_screen.dart'
    as _i54;
import 'package:zheeta/features/wallet_and_transactions/presentation/views/withdrawal/withdrawal_payout_account_screen.dart'
    as _i56;
import 'package:zheeta/features/wallet_and_transactions/presentation/views/withdrawal/withdrawal_screen.dart'
    as _i57;

/// generated route for
/// [_i1.AboutScreen]
class AboutRoute extends _i58.PageRouteInfo<void> {
  const AboutRoute({List<_i58.PageRouteInfo>? children})
    : super(AboutRoute.name, initialChildren: children);

  static const String name = 'AboutRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i1.AboutScreen();
    },
  );
}

/// generated route for
/// [_i2.BioDataScreen]
class BioDataRoute extends _i58.PageRouteInfo<void> {
  const BioDataRoute({List<_i58.PageRouteInfo>? children})
    : super(BioDataRoute.name, initialChildren: children);

  static const String name = 'BioDataRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i2.BioDataScreen();
    },
  );
}

/// generated route for
/// [_i3.ChargeListScreen]
class ChargeListRoute extends _i58.PageRouteInfo<void> {
  const ChargeListRoute({List<_i58.PageRouteInfo>? children})
    : super(ChargeListRoute.name, initialChildren: children);

  static const String name = 'ChargeListRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i3.ChargeListScreen();
    },
  );
}

/// generated route for
/// [_i4.ChatConversationScreen]
class ChatConversationRoute
    extends _i58.PageRouteInfo<ChatConversationRouteArgs> {
  ChatConversationRoute({
    _i59.Key? key,
    required String userName,
    required String profileId,
    required String currentUserId,
    List<_i58.PageRouteInfo>? children,
  }) : super(
         ChatConversationRoute.name,
         args: ChatConversationRouteArgs(
           key: key,
           userName: userName,
           profileId: profileId,
           currentUserId: currentUserId,
         ),
         initialChildren: children,
       );

  static const String name = 'ChatConversationRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatConversationRouteArgs>();
      return _i4.ChatConversationScreen(
        key: args.key,
        userName: args.userName,
        profileId: args.profileId,
        currentUserId: args.currentUserId,
      );
    },
  );
}

class ChatConversationRouteArgs {
  const ChatConversationRouteArgs({
    this.key,
    required this.userName,
    required this.profileId,
    required this.currentUserId,
  });

  final _i59.Key? key;

  final String userName;

  final String profileId;

  final String currentUserId;

  @override
  String toString() {
    return 'ChatConversationRouteArgs{key: $key, userName: $userName, profileId: $profileId, currentUserId: $currentUserId}';
  }
}

/// generated route for
/// [_i5.ChatMessagesPage]
class ChatMessagesRoute extends _i58.PageRouteInfo<void> {
  const ChatMessagesRoute({List<_i58.PageRouteInfo>? children})
    : super(ChatMessagesRoute.name, initialChildren: children);

  static const String name = 'ChatMessagesRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i5.ChatMessagesPage();
    },
  );
}

/// generated route for
/// [_i6.CreateEventScreen]
class CreateEventRoute extends _i58.PageRouteInfo<void> {
  const CreateEventRoute({List<_i58.PageRouteInfo>? children})
    : super(CreateEventRoute.name, initialChildren: children);

  static const String name = 'CreateEventRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i6.CreateEventScreen();
    },
  );
}

/// generated route for
/// [_i7.DateTimeLocationScreen]
class DateTimeLocationRoute extends _i58.PageRouteInfo<void> {
  const DateTimeLocationRoute({List<_i58.PageRouteInfo>? children})
    : super(DateTimeLocationRoute.name, initialChildren: children);

  static const String name = 'DateTimeLocationRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i7.DateTimeLocationScreen();
    },
  );
}

/// generated route for
/// [_i8.DownLinesScreen]
class DownLinesRoute extends _i58.PageRouteInfo<void> {
  const DownLinesRoute({List<_i58.PageRouteInfo>? children})
    : super(DownLinesRoute.name, initialChildren: children);

  static const String name = 'DownLinesRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i8.DownLinesScreen();
    },
  );
}

/// generated route for
/// [_i9.EventDetailsScreen]
class EventDetailsRoute extends _i58.PageRouteInfo<EventDetailsRouteArgs> {
  EventDetailsRoute({
    _i59.Key? key,
    required String? id,
    required String? creatorId,
    List<_i58.PageRouteInfo>? children,
  }) : super(
         EventDetailsRoute.name,
         args: EventDetailsRouteArgs(key: key, id: id, creatorId: creatorId),
         initialChildren: children,
       );

  static const String name = 'EventDetailsRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventDetailsRouteArgs>();
      return _i9.EventDetailsScreen(
        key: args.key,
        id: args.id,
        creatorId: args.creatorId,
      );
    },
  );
}

class EventDetailsRouteArgs {
  const EventDetailsRouteArgs({
    this.key,
    required this.id,
    required this.creatorId,
  });

  final _i59.Key? key;

  final String? id;

  final String? creatorId;

  @override
  String toString() {
    return 'EventDetailsRouteArgs{key: $key, id: $id, creatorId: $creatorId}';
  }
}

/// generated route for
/// [_i10.EventFeedPage]
class EventFeedRoute extends _i58.PageRouteInfo<void> {
  const EventFeedRoute({List<_i58.PageRouteInfo>? children})
    : super(EventFeedRoute.name, initialChildren: children);

  static const String name = 'EventFeedRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i10.EventFeedPage();
    },
  );
}

/// generated route for
/// [_i11.EventInfoScreen]
class EventInfoRoute extends _i58.PageRouteInfo<void> {
  const EventInfoRoute({List<_i58.PageRouteInfo>? children})
    : super(EventInfoRoute.name, initialChildren: children);

  static const String name = 'EventInfoRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i11.EventInfoScreen();
    },
  );
}

/// generated route for
/// [_i12.EventPreviewScreen]
class EventPreviewRoute extends _i58.PageRouteInfo<EventPreviewRouteArgs> {
  EventPreviewRoute({
    _i59.Key? key,
    required _i12.EventPreview event,
    List<_i58.PageRouteInfo>? children,
  }) : super(
         EventPreviewRoute.name,
         args: EventPreviewRouteArgs(key: key, event: event),
         initialChildren: children,
       );

  static const String name = 'EventPreviewRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventPreviewRouteArgs>();
      return _i12.EventPreviewScreen(key: args.key, event: args.event);
    },
  );
}

class EventPreviewRouteArgs {
  const EventPreviewRouteArgs({this.key, required this.event});

  final _i59.Key? key;

  final _i12.EventPreview event;

  @override
  String toString() {
    return 'EventPreviewRouteArgs{key: $key, event: $event}';
  }
}

/// generated route for
/// [_i13.EventVerificationScreen]
class EventVerificationRoute extends _i58.PageRouteInfo<void> {
  const EventVerificationRoute({List<_i58.PageRouteInfo>? children})
    : super(EventVerificationRoute.name, initialChildren: children);

  static const String name = 'EventVerificationRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i13.EventVerificationScreen();
    },
  );
}

/// generated route for
/// [_i14.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i58.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i58.PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i14.ForgotPasswordScreen();
    },
  );
}

/// generated route for
/// [_i15.FriendRequestsScreen]
class FriendRequestsRoute extends _i58.PageRouteInfo<void> {
  const FriendRequestsRoute({List<_i58.PageRouteInfo>? children})
    : super(FriendRequestsRoute.name, initialChildren: children);

  static const String name = 'FriendRequestsRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i15.FriendRequestsScreen();
    },
  );
}

/// generated route for
/// [_i16.FriendScreen]
class FriendRoute extends _i58.PageRouteInfo<void> {
  const FriendRoute({List<_i58.PageRouteInfo>? children})
    : super(FriendRoute.name, initialChildren: children);

  static const String name = 'FriendRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i16.FriendScreen();
    },
  );
}

/// generated route for
/// [_i17.GiftShopScreen]
class GiftShopRoute extends _i58.PageRouteInfo<void> {
  const GiftShopRoute({List<_i58.PageRouteInfo>? children})
    : super(GiftShopRoute.name, initialChildren: children);

  static const String name = 'GiftShopRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i17.GiftShopScreen();
    },
  );
}

/// generated route for
/// [_i18.GuidelinesItemsScreen]
class GuidelinesItemsRoute extends _i58.PageRouteInfo<void> {
  const GuidelinesItemsRoute({List<_i58.PageRouteInfo>? children})
    : super(GuidelinesItemsRoute.name, initialChildren: children);

  static const String name = 'GuidelinesItemsRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i18.GuidelinesItemsScreen();
    },
  );
}

/// generated route for
/// [_i19.HomeScreen]
class HomeRoute extends _i58.PageRouteInfo<void> {
  const HomeRoute({List<_i58.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i19.HomeScreen();
    },
  );
}

/// generated route for
/// [_i20.IntroScreen]
class IntroRoute extends _i58.PageRouteInfo<void> {
  const IntroRoute({List<_i58.PageRouteInfo>? children})
    : super(IntroRoute.name, initialChildren: children);

  static const String name = 'IntroRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i20.IntroScreen();
    },
  );
}

/// generated route for
/// [_i21.LocationScreen]
class LocationRoute extends _i58.PageRouteInfo<void> {
  const LocationRoute({List<_i58.PageRouteInfo>? children})
    : super(LocationRoute.name, initialChildren: children);

  static const String name = 'LocationRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i21.LocationScreen();
    },
  );
}

/// generated route for
/// [_i22.MembershipSubscriptionScreen]
class MembershipSubscriptionRoute extends _i58.PageRouteInfo<void> {
  const MembershipSubscriptionRoute({List<_i58.PageRouteInfo>? children})
    : super(MembershipSubscriptionRoute.name, initialChildren: children);

  static const String name = 'MembershipSubscriptionRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i22.MembershipSubscriptionScreen();
    },
  );
}

/// generated route for
/// [_i23.MyBuddyEventsScreen]
class MyBuddyEventsRoute extends _i58.PageRouteInfo<void> {
  const MyBuddyEventsRoute({List<_i58.PageRouteInfo>? children})
    : super(MyBuddyEventsRoute.name, initialChildren: children);

  static const String name = 'MyBuddyEventsRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i23.MyBuddyEventsScreen();
    },
  );
}

/// generated route for
/// [_i24.MyGiftScreen]
class MyGiftRoute extends _i58.PageRouteInfo<void> {
  const MyGiftRoute({List<_i58.PageRouteInfo>? children})
    : super(MyGiftRoute.name, initialChildren: children);

  static const String name = 'MyGiftRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i24.MyGiftScreen();
    },
  );
}

/// generated route for
/// [_i25.NearbySearchScreen]
class NearbySearchRoute extends _i58.PageRouteInfo<void> {
  const NearbySearchRoute({List<_i58.PageRouteInfo>? children})
    : super(NearbySearchRoute.name, initialChildren: children);

  static const String name = 'NearbySearchRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i25.NearbySearchScreen();
    },
  );
}

/// generated route for
/// [_i26.NotificationScreen]
class NotificationRoute extends _i58.PageRouteInfo<void> {
  const NotificationRoute({List<_i58.PageRouteInfo>? children})
    : super(NotificationRoute.name, initialChildren: children);

  static const String name = 'NotificationRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i26.NotificationScreen();
    },
  );
}

/// generated route for
/// [_i27.PaymentTypesScreen]
class PaymentTypesRoute extends _i58.PageRouteInfo<void> {
  const PaymentTypesRoute({List<_i58.PageRouteInfo>? children})
    : super(PaymentTypesRoute.name, initialChildren: children);

  static const String name = 'PaymentTypesRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i27.PaymentTypesScreen();
    },
  );
}

/// generated route for
/// [_i28.PayoutAccountScreen]
class PayoutAccountRoute extends _i58.PageRouteInfo<void> {
  const PayoutAccountRoute({List<_i58.PageRouteInfo>? children})
    : super(PayoutAccountRoute.name, initialChildren: children);

  static const String name = 'PayoutAccountRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i28.PayoutAccountScreen();
    },
  );
}

/// generated route for
/// [_i29.PayoutCreateAccount]
class PayoutCreateAccount extends _i58.PageRouteInfo<void> {
  const PayoutCreateAccount({List<_i58.PageRouteInfo>? children})
    : super(PayoutCreateAccount.name, initialChildren: children);

  static const String name = 'PayoutCreateAccount';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i29.PayoutCreateAccount();
    },
  );
}

/// generated route for
/// [_i30.PayoutMenuScreen]
class PayoutMenuRoute extends _i58.PageRouteInfo<void> {
  const PayoutMenuRoute({List<_i58.PageRouteInfo>? children})
    : super(PayoutMenuRoute.name, initialChildren: children);

  static const String name = 'PayoutMenuRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i30.PayoutMenuScreen();
    },
  );
}

/// generated route for
/// [_i31.ProductDetailsScreen]
class ProductDetailsRoute extends _i58.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i60.Key? key,
    required _i61.GiftModel gift,
    List<_i58.PageRouteInfo>? children,
  }) : super(
         ProductDetailsRoute.name,
         args: ProductDetailsRouteArgs(key: key, gift: gift),
         initialChildren: children,
       );

  static const String name = 'ProductDetailsRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailsRouteArgs>();
      return _i31.ProductDetailsScreen(key: args.key, gift: args.gift);
    },
  );
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({this.key, required this.gift});

  final _i60.Key? key;

  final _i61.GiftModel gift;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, gift: $gift}';
  }
}

/// generated route for
/// [_i32.ProfileAccessManagementScreen]
class ProfileAccessManagementRoute extends _i58.PageRouteInfo<void> {
  const ProfileAccessManagementRoute({List<_i58.PageRouteInfo>? children})
    : super(ProfileAccessManagementRoute.name, initialChildren: children);

  static const String name = 'ProfileAccessManagementRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i32.ProfileAccessManagementScreen();
    },
  );
}

/// generated route for
/// [_i33.ProfileBoostInsightScreen]
class ProfileBoostInsightRoute
    extends _i58.PageRouteInfo<ProfileBoostInsightRouteArgs> {
  ProfileBoostInsightRoute({
    _i59.Key? key,
    required String userName,
    List<_i58.PageRouteInfo>? children,
  }) : super(
         ProfileBoostInsightRoute.name,
         args: ProfileBoostInsightRouteArgs(key: key, userName: userName),
         initialChildren: children,
       );

  static const String name = 'ProfileBoostInsightRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileBoostInsightRouteArgs>();
      return _i33.ProfileBoostInsightScreen(
        key: args.key,
        userName: args.userName,
      );
    },
  );
}

class ProfileBoostInsightRouteArgs {
  const ProfileBoostInsightRouteArgs({this.key, required this.userName});

  final _i59.Key? key;

  final String userName;

  @override
  String toString() {
    return 'ProfileBoostInsightRouteArgs{key: $key, userName: $userName}';
  }
}

/// generated route for
/// [_i34.ProfileBoostScreen]
class ProfileBoostRoute extends _i58.PageRouteInfo<void> {
  const ProfileBoostRoute({List<_i58.PageRouteInfo>? children})
    : super(ProfileBoostRoute.name, initialChildren: children);

  static const String name = 'ProfileBoostRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i34.ProfileBoostScreen();
    },
  );
}

/// generated route for
/// [_i35.ProfileBoostViewScreen]
class ProfileBoostViewRoute
    extends _i58.PageRouteInfo<ProfileBoostViewRouteArgs> {
  ProfileBoostViewRoute({
    _i59.Key? key,
    required _i62.ProfileBoostModel profile,
    required List<_i62.ProfileBoostModel> profiles,
    List<_i58.PageRouteInfo>? children,
  }) : super(
         ProfileBoostViewRoute.name,
         args: ProfileBoostViewRouteArgs(
           key: key,
           profile: profile,
           profiles: profiles,
         ),
         initialChildren: children,
       );

  static const String name = 'ProfileBoostViewRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileBoostViewRouteArgs>();
      return _i35.ProfileBoostViewScreen(
        key: args.key,
        profile: args.profile,
        profiles: args.profiles,
      );
    },
  );
}

class ProfileBoostViewRouteArgs {
  const ProfileBoostViewRouteArgs({
    this.key,
    required this.profile,
    required this.profiles,
  });

  final _i59.Key? key;

  final _i62.ProfileBoostModel profile;

  final List<_i62.ProfileBoostModel> profiles;

  @override
  String toString() {
    return 'ProfileBoostViewRouteArgs{key: $key, profile: $profile, profiles: $profiles}';
  }
}

/// generated route for
/// [_i36.ProfileCarouselScreen]
class ProfileCarouselRoute extends _i58.PageRouteInfo<void> {
  const ProfileCarouselRoute({List<_i58.PageRouteInfo>? children})
    : super(ProfileCarouselRoute.name, initialChildren: children);

  static const String name = 'ProfileCarouselRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i36.ProfileCarouselScreen();
    },
  );
}

/// generated route for
/// [_i37.ProfileEditCarouselScreen]
class ProfileEditCarouselRoute extends _i58.PageRouteInfo<void> {
  const ProfileEditCarouselRoute({List<_i58.PageRouteInfo>? children})
    : super(ProfileEditCarouselRoute.name, initialChildren: children);

  static const String name = 'ProfileEditCarouselRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i37.ProfileEditCarouselScreen();
    },
  );
}

/// generated route for
/// [_i38.ProfileEditScreen]
class ProfileEditRoute extends _i58.PageRouteInfo<ProfileEditRouteArgs> {
  ProfileEditRoute({
    _i59.Key? key,
    required int activeTab,
    List<_i58.PageRouteInfo>? children,
  }) : super(
         ProfileEditRoute.name,
         args: ProfileEditRouteArgs(key: key, activeTab: activeTab),
         initialChildren: children,
       );

  static const String name = 'ProfileEditRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileEditRouteArgs>();
      return _i38.ProfileEditScreen(key: args.key, activeTab: args.activeTab);
    },
  );
}

class ProfileEditRouteArgs {
  const ProfileEditRouteArgs({this.key, required this.activeTab});

  final _i59.Key? key;

  final int activeTab;

  @override
  String toString() {
    return 'ProfileEditRouteArgs{key: $key, activeTab: $activeTab}';
  }
}

/// generated route for
/// [_i39.ProfilePage]
class ProfileRoute extends _i58.PageRouteInfo<void> {
  const ProfileRoute({List<_i58.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i39.ProfilePage();
    },
  );
}

/// generated route for
/// [_i40.ProfilePhotoScreen]
class ProfilePhotoRoute extends _i58.PageRouteInfo<void> {
  const ProfilePhotoRoute({List<_i58.PageRouteInfo>? children})
    : super(ProfilePhotoRoute.name, initialChildren: children);

  static const String name = 'ProfilePhotoRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i40.ProfilePhotoScreen();
    },
  );
}

/// generated route for
/// [_i41.ProfileViewScreen]
class ProfileViewRoute extends _i58.PageRouteInfo<ProfileViewRouteArgs> {
  ProfileViewRoute({
    _i59.Key? key,
    required String profileId,
    String? blockOrUnBlockId,
    String? userId,
    List<_i58.PageRouteInfo>? children,
  }) : super(
         ProfileViewRoute.name,
         args: ProfileViewRouteArgs(
           key: key,
           profileId: profileId,
           blockOrUnBlockId: blockOrUnBlockId,
           userId: userId,
         ),
         initialChildren: children,
       );

  static const String name = 'ProfileViewRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileViewRouteArgs>();
      return _i41.ProfileViewScreen(
        key: args.key,
        profileId: args.profileId,
        blockOrUnBlockId: args.blockOrUnBlockId,
        userId: args.userId,
      );
    },
  );
}

class ProfileViewRouteArgs {
  const ProfileViewRouteArgs({
    this.key,
    required this.profileId,
    this.blockOrUnBlockId,
    this.userId,
  });

  final _i59.Key? key;

  final String profileId;

  final String? blockOrUnBlockId;

  final String? userId;

  @override
  String toString() {
    return 'ProfileViewRouteArgs{key: $key, profileId: $profileId, blockOrUnBlockId: $blockOrUnBlockId, userId: $userId}';
  }
}

/// generated route for
/// [_i42.RedeemGiftDetailScreen]
class RedeemGiftDetailRoute
    extends _i58.PageRouteInfo<RedeemGiftDetailRouteArgs> {
  RedeemGiftDetailRoute({
    _i59.Key? key,
    required double totalAmount,
    required String giftId,
    List<_i58.PageRouteInfo>? children,
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

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RedeemGiftDetailRouteArgs>();
      return _i42.RedeemGiftDetailScreen(
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

  final _i59.Key? key;

  final double totalAmount;

  final String giftId;

  @override
  String toString() {
    return 'RedeemGiftDetailRouteArgs{key: $key, totalAmount: $totalAmount, giftId: $giftId}';
  }
}

/// generated route for
/// [_i43.RefereeListScreen]
class RefereeListRoute extends _i58.PageRouteInfo<void> {
  const RefereeListRoute({List<_i58.PageRouteInfo>? children})
    : super(RefereeListRoute.name, initialChildren: children);

  static const String name = 'RefereeListRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i43.RefereeListScreen();
    },
  );
}

/// generated route for
/// [_i44.ResetPasswordOtpScreen]
class ResetPasswordOtpRoute
    extends _i58.PageRouteInfo<ResetPasswordOtpRouteArgs> {
  ResetPasswordOtpRoute({
    _i59.Key? key,
    required String email,
    List<_i58.PageRouteInfo>? children,
  }) : super(
         ResetPasswordOtpRoute.name,
         args: ResetPasswordOtpRouteArgs(key: key, email: email),
         initialChildren: children,
       );

  static const String name = 'ResetPasswordOtpRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResetPasswordOtpRouteArgs>();
      return _i44.ResetPasswordOtpScreen(key: args.key, email: args.email);
    },
  );
}

class ResetPasswordOtpRouteArgs {
  const ResetPasswordOtpRouteArgs({this.key, required this.email});

  final _i59.Key? key;

  final String email;

  @override
  String toString() {
    return 'ResetPasswordOtpRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i45.ResetPasswordScreen]
class ResetPasswordRoute extends _i58.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    _i59.Key? key,
    required _i63.ResetPasswordRequest request,
    List<_i58.PageRouteInfo>? children,
  }) : super(
         ResetPasswordRoute.name,
         args: ResetPasswordRouteArgs(key: key, request: request),
         initialChildren: children,
       );

  static const String name = 'ResetPasswordRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResetPasswordRouteArgs>();
      return _i45.ResetPasswordScreen(key: args.key, request: args.request);
    },
  );
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({this.key, required this.request});

  final _i59.Key? key;

  final _i63.ResetPasswordRequest request;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key, request: $request}';
  }
}

/// generated route for
/// [_i46.SendCoinDetailsScreen]
class SendCoinDetailsRoute
    extends _i58.PageRouteInfo<SendCoinDetailsRouteArgs> {
  SendCoinDetailsRoute({
    _i59.Key? key,
    required String receiverId,
    required String receiverUsername,
    required double amount,
    required String message,
    List<_i58.PageRouteInfo>? children,
  }) : super(
         SendCoinDetailsRoute.name,
         args: SendCoinDetailsRouteArgs(
           key: key,
           receiverId: receiverId,
           receiverUsername: receiverUsername,
           amount: amount,
           message: message,
         ),
         initialChildren: children,
       );

  static const String name = 'SendCoinDetailsRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SendCoinDetailsRouteArgs>();
      return _i46.SendCoinDetailsScreen(
        key: args.key,
        receiverId: args.receiverId,
        receiverUsername: args.receiverUsername,
        amount: args.amount,
        message: args.message,
      );
    },
  );
}

class SendCoinDetailsRouteArgs {
  const SendCoinDetailsRouteArgs({
    this.key,
    required this.receiverId,
    required this.receiverUsername,
    required this.amount,
    required this.message,
  });

  final _i59.Key? key;

  final String receiverId;

  final String receiverUsername;

  final double amount;

  final String message;

  @override
  String toString() {
    return 'SendCoinDetailsRouteArgs{key: $key, receiverId: $receiverId, receiverUsername: $receiverUsername, amount: $amount, message: $message}';
  }
}

/// generated route for
/// [_i47.SendCoinScreen]
class SendCoinRoute extends _i58.PageRouteInfo<void> {
  const SendCoinRoute({List<_i58.PageRouteInfo>? children})
    : super(SendCoinRoute.name, initialChildren: children);

  static const String name = 'SendCoinRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i47.SendCoinScreen();
    },
  );
}

/// generated route for
/// [_i48.ShareScreen]
class ShareRoute extends _i58.PageRouteInfo<void> {
  const ShareRoute({List<_i58.PageRouteInfo>? children})
    : super(ShareRoute.name, initialChildren: children);

  static const String name = 'ShareRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i48.ShareScreen();
    },
  );
}

/// generated route for
/// [_i49.SignInScreen]
class SignInRoute extends _i58.PageRouteInfo<void> {
  const SignInRoute({List<_i58.PageRouteInfo>? children})
    : super(SignInRoute.name, initialChildren: children);

  static const String name = 'SignInRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i49.SignInScreen();
    },
  );
}

/// generated route for
/// [_i50.SignUpScreen]
class SignUpRoute extends _i58.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    _i59.Key? key,
    String? referralCode,
    List<_i58.PageRouteInfo>? children,
  }) : super(
         SignUpRoute.name,
         args: SignUpRouteArgs(key: key, referralCode: referralCode),
         initialChildren: children,
       );

  static const String name = 'SignUpRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignUpRouteArgs>(
        orElse: () => const SignUpRouteArgs(),
      );
      return _i50.SignUpScreen(key: args.key, referralCode: args.referralCode);
    },
  );
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key, this.referralCode});

  final _i59.Key? key;

  final String? referralCode;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key, referralCode: $referralCode}';
  }
}

/// generated route for
/// [_i51.TargetInsightsScreen]
class TargetInsightsRoute extends _i58.PageRouteInfo<void> {
  const TargetInsightsRoute({List<_i58.PageRouteInfo>? children})
    : super(TargetInsightsRoute.name, initialChildren: children);

  static const String name = 'TargetInsightsRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i51.TargetInsightsScreen();
    },
  );
}

/// generated route for
/// [_i52.TransactionScreen]
class TransactionRoute extends _i58.PageRouteInfo<TransactionRouteArgs> {
  TransactionRoute({
    _i59.Key? key,
    String? userId,
    List<_i58.PageRouteInfo>? children,
  }) : super(
         TransactionRoute.name,
         args: TransactionRouteArgs(key: key, userId: userId),
         initialChildren: children,
       );

  static const String name = 'TransactionRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TransactionRouteArgs>(
        orElse: () => const TransactionRouteArgs(),
      );
      return _i52.TransactionScreen(key: args.key, userId: args.userId);
    },
  );
}

class TransactionRouteArgs {
  const TransactionRouteArgs({this.key, this.userId});

  final _i59.Key? key;

  final String? userId;

  @override
  String toString() {
    return 'TransactionRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i53.VerificationScreen]
class VerificationRoute extends _i58.PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({
    _i59.Key? key,
    required bool isPhoneNumber,
    required String phoneNumber,
    required String countryCode,
    required String email,
    List<_i58.PageRouteInfo>? children,
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

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerificationRouteArgs>();
      return _i53.VerificationScreen(
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

  final _i59.Key? key;

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
/// [_i54.WalletScreen]
class WalletRoute extends _i58.PageRouteInfo<void> {
  const WalletRoute({List<_i58.PageRouteInfo>? children})
    : super(WalletRoute.name, initialChildren: children);

  static const String name = 'WalletRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i54.WalletScreen();
    },
  );
}

/// generated route for
/// [_i55.WelcomeScreen]
class WelcomeRoute extends _i58.PageRouteInfo<WelcomeRouteArgs> {
  WelcomeRoute({
    _i59.Key? key,
    _i64.UserProfileModel? profile,
    List<_i58.PageRouteInfo>? children,
  }) : super(
         WelcomeRoute.name,
         args: WelcomeRouteArgs(key: key, profile: profile),
         initialChildren: children,
       );

  static const String name = 'WelcomeRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WelcomeRouteArgs>(
        orElse: () => const WelcomeRouteArgs(),
      );
      return _i55.WelcomeScreen(key: args.key, profile: args.profile);
    },
  );
}

class WelcomeRouteArgs {
  const WelcomeRouteArgs({this.key, this.profile});

  final _i59.Key? key;

  final _i64.UserProfileModel? profile;

  @override
  String toString() {
    return 'WelcomeRouteArgs{key: $key, profile: $profile}';
  }
}

/// generated route for
/// [_i56.WithdrawalPayoutAccountScreen]
class WithdrawalPayoutAccountRoute extends _i58.PageRouteInfo<void> {
  const WithdrawalPayoutAccountRoute({List<_i58.PageRouteInfo>? children})
    : super(WithdrawalPayoutAccountRoute.name, initialChildren: children);

  static const String name = 'WithdrawalPayoutAccountRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      return const _i56.WithdrawalPayoutAccountScreen();
    },
  );
}

/// generated route for
/// [_i57.WithdrawalScreen]
class WithdrawalRoute extends _i58.PageRouteInfo<WithdrawalRouteArgs> {
  WithdrawalRoute({
    _i59.Key? key,
    required String account,
    required String accountNumber,
    List<_i58.PageRouteInfo>? children,
  }) : super(
         WithdrawalRoute.name,
         args: WithdrawalRouteArgs(
           key: key,
           account: account,
           accountNumber: accountNumber,
         ),
         initialChildren: children,
       );

  static const String name = 'WithdrawalRoute';

  static _i58.PageInfo page = _i58.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WithdrawalRouteArgs>();
      return _i57.WithdrawalScreen(
        key: args.key,
        account: args.account,
        accountNumber: args.accountNumber,
      );
    },
  );
}

class WithdrawalRouteArgs {
  const WithdrawalRouteArgs({
    this.key,
    required this.account,
    required this.accountNumber,
  });

  final _i59.Key? key;

  final String account;

  final String accountNumber;

  @override
  String toString() {
    return 'WithdrawalRouteArgs{key: $key, account: $account, accountNumber: $accountNumber}';
  }
}
