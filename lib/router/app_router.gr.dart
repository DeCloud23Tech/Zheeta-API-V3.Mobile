// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i61;
import 'package:collection/collection.dart' as _i68;
import 'package:flutter/cupertino.dart' as _i65;
import 'package:flutter/material.dart' as _i62;
import 'package:zheeta/features/app/presentation/screens/empty_route.dart'
    as _i9;
import 'package:zheeta/features/app/presentation/screens/home_screen.dart'
    as _i20;
import 'package:zheeta/features/authentication/data/requests/reset_password_request.dart'
    as _i69;
import 'package:zheeta/features/authentication/presentation/screens/forgot_screen.dart'
    as _i15;
import 'package:zheeta/features/authentication/presentation/screens/reset_password_otp_screen.dart'
    as _i46;
import 'package:zheeta/features/authentication/presentation/screens/reset_password_screen.dart'
    as _i47;
import 'package:zheeta/features/authentication/presentation/screens/signin_screen.dart'
    as _i50;
import 'package:zheeta/features/authentication/presentation/screens/signup_screen.dart'
    as _i51;
import 'package:zheeta/features/authentication/presentation/screens/verification_screen.dart'
    as _i55;
import 'package:zheeta/features/authentication/presentation/screens/verification_welcome_screen.dart'
    as _i56;
import 'package:zheeta/features/buddy_events/presentation/screens/create_event/create_event_screen.dart'
    as _i6;
import 'package:zheeta/features/buddy_events/presentation/screens/create_event/event_preview_screen.dart'
    as _i13;
import 'package:zheeta/features/buddy_events/presentation/screens/create_event/steps/date_time_location_screen.dart'
    as _i7;
import 'package:zheeta/features/buddy_events/presentation/screens/create_event/steps/event_info_screen.dart'
    as _i12;
import 'package:zheeta/features/buddy_events/presentation/screens/create_event/steps/guide_lines_screen.dart'
    as _i19;
import 'package:zheeta/features/buddy_events/presentation/screens/create_event/steps/target_insight_screen.dart'
    as _i52;
import 'package:zheeta/features/buddy_events/presentation/screens/event_details/event_details_screen.dart'
    as _i10;
import 'package:zheeta/features/buddy_events/presentation/screens/event_verification/event_verification_screen.dart'
    as _i14;
import 'package:zheeta/features/buddy_events/presentation/screens/events_feed/event_feed_screen.dart'
    as _i11;
import 'package:zheeta/features/buddy_events/presentation/screens/profile_boost/profile_boost_view_screen.dart'
    as _i37;
import 'package:zheeta/features/buddy_events/presentation/screens/user_buddy_events/my_buddy_events_screen.dart'
    as _i24;
import 'package:zheeta/features/connections/presentation/screens/downlines/downlines_screen.dart'
    as _i8;
import 'package:zheeta/features/connections/presentation/screens/downlines/referee_list_screen.dart'
    as _i45;
import 'package:zheeta/features/connections/presentation/screens/finder/user_finder_screen.dart'
    as _i54;
import 'package:zheeta/features/connections/presentation/screens/friends/friend_requests_screen.dart'
    as _i16;
import 'package:zheeta/features/connections/presentation/screens/friends/friend_screen.dart'
    as _i17;
import 'package:zheeta/features/discover/presentation/screens/nearby_search_screen.dart'
    as _i26;
import 'package:zheeta/features/gifts/data/models/gift_model.dart' as _i66;
import 'package:zheeta/features/gifts/presentation/screens/gift_shop/gift_shop_product_screen.dart'
    as _i33;
import 'package:zheeta/features/gifts/presentation/screens/gift_shop/gift_shop_screen.dart'
    as _i18;
import 'package:zheeta/features/gifts/presentation/screens/user_gifts/my_gift_screen.dart'
    as _i25;
import 'package:zheeta/features/gifts/presentation/screens/user_gifts/redeem_gift_details_screen.dart'
    as _i44;
import 'package:zheeta/features/messages/data/models/chat_recipients_model.dart'
    as _i63;
import 'package:zheeta/features/messages/presentation/screens/chat_conversation_screen.dart'
    as _i4;
import 'package:zheeta/features/messages/presentation/screens/chat_messages.dart'
    as _i5;
import 'package:zheeta/features/notification/presentation/screens/notification_screen.dart'
    as _i27;
import 'package:zheeta/features/payment_and_subscriptions/data/models/generate_payment_link_model.dart'
    as _i64;
import 'package:zheeta/features/payment_and_subscriptions/presentation/screens/fund_wallet/payment_link_screen.dart'
    as _i28;
import 'package:zheeta/features/payment_and_subscriptions/presentation/screens/fund_wallet/payment_type_screen.dart'
    as _i29;
import 'package:zheeta/features/payment_and_subscriptions/presentation/screens/payout_accounts/payout_account_screen.dart'
    as _i30;
import 'package:zheeta/features/payment_and_subscriptions/presentation/screens/payout_accounts/payout_create_account.dart'
    as _i31;
import 'package:zheeta/features/payment_and_subscriptions/presentation/screens/payout_accounts/payout_menu_screen.dart'
    as _i32;
import 'package:zheeta/features/payment_and_subscriptions/presentation/screens/subscription_and_charges/charges_screen.dart'
    as _i3;
import 'package:zheeta/features/payment_and_subscriptions/presentation/screens/subscription_and_charges/membership_subscription_screen.dart'
    as _i23;
import 'package:zheeta/features/profile/data/models/matched_profile_boost_model.dart'
    as _i67;
import 'package:zheeta/features/profile/data/models/user_profile_model.dart'
    as _i70;
import 'package:zheeta/features/profile/presentation/screens/profile/profile_screen.dart'
    as _i41;
import 'package:zheeta/features/profile/presentation/screens/profile_boost/profile_boost_insight_screen.dart'
    as _i35;
import 'package:zheeta/features/profile/presentation/screens/profile_boost/profile_boost_screen.dart'
    as _i36;
import 'package:zheeta/features/profile/presentation/screens/profile_create/about_screen.dart'
    as _i1;
import 'package:zheeta/features/profile/presentation/screens/profile_create/bio_data_screen.dart'
    as _i2;
import 'package:zheeta/features/profile/presentation/screens/profile_create/location_screen.dart'
    as _i22;
import 'package:zheeta/features/profile/presentation/screens/profile_create/profile_carousel_screen.dart'
    as _i38;
import 'package:zheeta/features/profile/presentation/screens/profile_create/profilephoto_screen.dart'
    as _i42;
import 'package:zheeta/features/profile/presentation/screens/profile_edit/profile_access_screen.dart_screen.dart'
    as _i34;
import 'package:zheeta/features/profile/presentation/screens/profile_edit/profile_edit_carousel_screen.dart'
    as _i39;
import 'package:zheeta/features/profile/presentation/screens/profile_edit/profile_edit_screen.dart'
    as _i40;
import 'package:zheeta/features/profile/presentation/screens/profile_view/profile_view_screen.dart'
    as _i43;
import 'package:zheeta/features/splash_screen/presentation/views/intro.dart'
    as _i21;
import 'package:zheeta/features/splash_screen/presentation/views/welcome.dart'
    as _i58;
import 'package:zheeta/features/wallet_and_transactions/presentation/screens/transactions/transactions_screen.dart'
    as _i53;
import 'package:zheeta/features/wallet_and_transactions/presentation/screens/wallet-transfer/send_coin_details_screen.dart'
    as _i48;
import 'package:zheeta/features/wallet_and_transactions/presentation/screens/wallet-transfer/send_coin_screen.dart'
    as _i49;
import 'package:zheeta/features/wallet_and_transactions/presentation/screens/wallet_screen.dart'
    as _i57;
import 'package:zheeta/features/wallet_and_transactions/presentation/screens/withdrawal/withdrawal_payout_account_screen.dart'
    as _i59;
import 'package:zheeta/features/wallet_and_transactions/presentation/screens/withdrawal/withdrawal_screen.dart'
    as _i60;

/// generated route for
/// [_i1.AboutScreen]
class AboutRoute extends _i61.PageRouteInfo<void> {
  const AboutRoute({List<_i61.PageRouteInfo>? children})
      : super(AboutRoute.name, initialChildren: children);

  static const String name = 'AboutRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i1.AboutScreen();
    },
  );
}

/// generated route for
/// [_i2.BioDataScreen]
class BioDataRoute extends _i61.PageRouteInfo<void> {
  const BioDataRoute({List<_i61.PageRouteInfo>? children})
      : super(BioDataRoute.name, initialChildren: children);

  static const String name = 'BioDataRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i2.BioDataScreen();
    },
  );
}

/// generated route for
/// [_i3.ChargeListScreen]
class ChargeListRoute extends _i61.PageRouteInfo<void> {
  const ChargeListRoute({List<_i61.PageRouteInfo>? children})
      : super(ChargeListRoute.name, initialChildren: children);

  static const String name = 'ChargeListRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i3.ChargeListScreen();
    },
  );
}

/// generated route for
/// [_i4.ChatConversationScreen]
class ChatConversationRoute extends _i61.PageRouteInfo<void> {
  const ChatConversationRoute({List<_i61.PageRouteInfo>? children})
      : super(ChatConversationRoute.name, initialChildren: children);

  static const String name = 'ChatConversationRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i4.ChatConversationScreen();
    },
  );
}

/// generated route for
/// [_i5.ChatMessagesScreen]
class ChatMessagesRoute extends _i61.PageRouteInfo<ChatMessagesRouteArgs> {
  ChatMessagesRoute({
    _i62.Key? key,
    required _i63.Recipient recipient,
    List<_i61.PageRouteInfo>? children,
  }) : super(
          ChatMessagesRoute.name,
          args: ChatMessagesRouteArgs(key: key, recipient: recipient),
          initialChildren: children,
        );

  static const String name = 'ChatMessagesRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatMessagesRouteArgs>();
      return _i5.ChatMessagesScreen(key: args.key, recipient: args.recipient);
    },
  );
}

class ChatMessagesRouteArgs {
  const ChatMessagesRouteArgs({this.key, required this.recipient});

  final _i62.Key? key;

  final _i63.Recipient recipient;

  @override
  String toString() {
    return 'ChatMessagesRouteArgs{key: $key, recipient: $recipient}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChatMessagesRouteArgs) return false;
    return key == other.key && recipient == other.recipient;
  }

  @override
  int get hashCode => key.hashCode ^ recipient.hashCode;
}

/// generated route for
/// [_i6.CreateEventScreen]
class CreateEventRoute extends _i61.PageRouteInfo<void> {
  const CreateEventRoute({List<_i61.PageRouteInfo>? children})
      : super(CreateEventRoute.name, initialChildren: children);

  static const String name = 'CreateEventRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i6.CreateEventScreen();
    },
  );
}

/// generated route for
/// [_i7.DateTimeLocationScreen]
class DateTimeLocationRoute extends _i61.PageRouteInfo<void> {
  const DateTimeLocationRoute({List<_i61.PageRouteInfo>? children})
      : super(DateTimeLocationRoute.name, initialChildren: children);

  static const String name = 'DateTimeLocationRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i7.DateTimeLocationScreen();
    },
  );
}

/// generated route for
/// [_i8.DownlinesScreen]
class DownlinesRoute extends _i61.PageRouteInfo<void> {
  const DownlinesRoute({List<_i61.PageRouteInfo>? children})
      : super(DownlinesRoute.name, initialChildren: children);

  static const String name = 'DownlinesRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i8.DownlinesScreen();
    },
  );
}

/// generated route for
/// [_i9.EmptyScreen]
class EmptyRoute extends _i61.PageRouteInfo<void> {
  const EmptyRoute({List<_i61.PageRouteInfo>? children})
      : super(EmptyRoute.name, initialChildren: children);

  static const String name = 'EmptyRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return _i61.WrappedRoute(child: const _i9.EmptyScreen());
    },
  );
}

/// generated route for
/// [_i10.EventDetailsScreen]
class EventDetailsRoute extends _i61.PageRouteInfo<EventDetailsRouteArgs> {
  EventDetailsRoute({
    _i62.Key? key,
    required String? id,
    required String? creatorId,
    List<_i61.PageRouteInfo>? children,
  }) : super(
          EventDetailsRoute.name,
          args: EventDetailsRouteArgs(key: key, id: id, creatorId: creatorId),
          initialChildren: children,
        );

  static const String name = 'EventDetailsRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventDetailsRouteArgs>();
      return _i10.EventDetailsScreen(
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

  final _i62.Key? key;

  final String? id;

  final String? creatorId;

  @override
  String toString() {
    return 'EventDetailsRouteArgs{key: $key, id: $id, creatorId: $creatorId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EventDetailsRouteArgs) return false;
    return key == other.key && id == other.id && creatorId == other.creatorId;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode ^ creatorId.hashCode;
}

/// generated route for
/// [_i11.EventFeedPage]
class EventFeedRoute extends _i61.PageRouteInfo<void> {
  const EventFeedRoute({List<_i61.PageRouteInfo>? children})
      : super(EventFeedRoute.name, initialChildren: children);

  static const String name = 'EventFeedRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i11.EventFeedPage();
    },
  );
}

/// generated route for
/// [_i12.EventInfoScreen]
class EventInfoRoute extends _i61.PageRouteInfo<void> {
  const EventInfoRoute({List<_i61.PageRouteInfo>? children})
      : super(EventInfoRoute.name, initialChildren: children);

  static const String name = 'EventInfoRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i12.EventInfoScreen();
    },
  );
}

/// generated route for
/// [_i13.EventPreviewScreen]
class EventPreviewRoute extends _i61.PageRouteInfo<EventPreviewRouteArgs> {
  EventPreviewRoute({
    _i62.Key? key,
    required _i13.EventPreview event,
    List<_i61.PageRouteInfo>? children,
  }) : super(
          EventPreviewRoute.name,
          args: EventPreviewRouteArgs(key: key, event: event),
          initialChildren: children,
        );

  static const String name = 'EventPreviewRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventPreviewRouteArgs>();
      return _i13.EventPreviewScreen(key: args.key, event: args.event);
    },
  );
}

class EventPreviewRouteArgs {
  const EventPreviewRouteArgs({this.key, required this.event});

  final _i62.Key? key;

  final _i13.EventPreview event;

  @override
  String toString() {
    return 'EventPreviewRouteArgs{key: $key, event: $event}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EventPreviewRouteArgs) return false;
    return key == other.key && event == other.event;
  }

  @override
  int get hashCode => key.hashCode ^ event.hashCode;
}

/// generated route for
/// [_i14.EventVerificationScreen]
class EventVerificationRoute extends _i61.PageRouteInfo<void> {
  const EventVerificationRoute({List<_i61.PageRouteInfo>? children})
      : super(EventVerificationRoute.name, initialChildren: children);

  static const String name = 'EventVerificationRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i14.EventVerificationScreen();
    },
  );
}

/// generated route for
/// [_i15.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i61.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i61.PageRouteInfo>? children})
      : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i15.ForgotPasswordScreen();
    },
  );
}

/// generated route for
/// [_i16.FriendRequestsScreen]
class FriendRequestsRoute extends _i61.PageRouteInfo<void> {
  const FriendRequestsRoute({List<_i61.PageRouteInfo>? children})
      : super(FriendRequestsRoute.name, initialChildren: children);

  static const String name = 'FriendRequestsRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i16.FriendRequestsScreen();
    },
  );
}

/// generated route for
/// [_i17.FriendScreen]
class FriendRoute extends _i61.PageRouteInfo<void> {
  const FriendRoute({List<_i61.PageRouteInfo>? children})
      : super(FriendRoute.name, initialChildren: children);

  static const String name = 'FriendRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i17.FriendScreen();
    },
  );
}

/// generated route for
/// [_i18.GiftShopScreen]
class GiftShopRoute extends _i61.PageRouteInfo<void> {
  const GiftShopRoute({List<_i61.PageRouteInfo>? children})
      : super(GiftShopRoute.name, initialChildren: children);

  static const String name = 'GiftShopRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i18.GiftShopScreen();
    },
  );
}

/// generated route for
/// [_i19.GuidelinesItemsScreen]
class GuidelinesItemsRoute extends _i61.PageRouteInfo<void> {
  const GuidelinesItemsRoute({List<_i61.PageRouteInfo>? children})
      : super(GuidelinesItemsRoute.name, initialChildren: children);

  static const String name = 'GuidelinesItemsRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i19.GuidelinesItemsScreen();
    },
  );
}

/// generated route for
/// [_i20.HomeScreen]
class HomeRoute extends _i61.PageRouteInfo<void> {
  const HomeRoute({List<_i61.PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i20.HomeScreen();
    },
  );
}

/// generated route for
/// [_i21.IntroScreen]
class IntroRoute extends _i61.PageRouteInfo<void> {
  const IntroRoute({List<_i61.PageRouteInfo>? children})
      : super(IntroRoute.name, initialChildren: children);

  static const String name = 'IntroRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i21.IntroScreen();
    },
  );
}

/// generated route for
/// [_i22.LocationScreen]
class LocationRoute extends _i61.PageRouteInfo<void> {
  const LocationRoute({List<_i61.PageRouteInfo>? children})
      : super(LocationRoute.name, initialChildren: children);

  static const String name = 'LocationRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i22.LocationScreen();
    },
  );
}

/// generated route for
/// [_i23.MembershipSubscriptionScreen]
class MembershipSubscriptionRoute extends _i61.PageRouteInfo<void> {
  const MembershipSubscriptionRoute({List<_i61.PageRouteInfo>? children})
      : super(MembershipSubscriptionRoute.name, initialChildren: children);

  static const String name = 'MembershipSubscriptionRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i23.MembershipSubscriptionScreen();
    },
  );
}

/// generated route for
/// [_i24.MyBuddyEventsScreen]
class MyBuddyEventsRoute extends _i61.PageRouteInfo<void> {
  const MyBuddyEventsRoute({List<_i61.PageRouteInfo>? children})
      : super(MyBuddyEventsRoute.name, initialChildren: children);

  static const String name = 'MyBuddyEventsRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i24.MyBuddyEventsScreen();
    },
  );
}

/// generated route for
/// [_i25.MyGiftScreen]
class MyGiftRoute extends _i61.PageRouteInfo<void> {
  const MyGiftRoute({List<_i61.PageRouteInfo>? children})
      : super(MyGiftRoute.name, initialChildren: children);

  static const String name = 'MyGiftRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i25.MyGiftScreen();
    },
  );
}

/// generated route for
/// [_i26.NearbySearchScreen]
class NearbySearchRoute extends _i61.PageRouteInfo<void> {
  const NearbySearchRoute({List<_i61.PageRouteInfo>? children})
      : super(NearbySearchRoute.name, initialChildren: children);

  static const String name = 'NearbySearchRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i26.NearbySearchScreen();
    },
  );
}

/// generated route for
/// [_i27.NotificationScreen]
class NotificationRoute extends _i61.PageRouteInfo<void> {
  const NotificationRoute({List<_i61.PageRouteInfo>? children})
      : super(NotificationRoute.name, initialChildren: children);

  static const String name = 'NotificationRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i27.NotificationScreen();
    },
  );
}

/// generated route for
/// [_i28.PaymentLinkScreen]
class PaymentLinkRoute extends _i61.PageRouteInfo<PaymentLinkRouteArgs> {
  PaymentLinkRoute({
    _i62.Key? key,
    required _i64.GeneratePaymentLinkData? paymentLinkData,
    List<_i61.PageRouteInfo>? children,
  }) : super(
          PaymentLinkRoute.name,
          args:
              PaymentLinkRouteArgs(key: key, paymentLinkData: paymentLinkData),
          initialChildren: children,
        );

  static const String name = 'PaymentLinkRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PaymentLinkRouteArgs>();
      return _i28.PaymentLinkScreen(
        key: args.key,
        paymentLinkData: args.paymentLinkData,
      );
    },
  );
}

class PaymentLinkRouteArgs {
  const PaymentLinkRouteArgs({this.key, required this.paymentLinkData});

  final _i62.Key? key;

  final _i64.GeneratePaymentLinkData? paymentLinkData;

  @override
  String toString() {
    return 'PaymentLinkRouteArgs{key: $key, paymentLinkData: $paymentLinkData}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PaymentLinkRouteArgs) return false;
    return key == other.key && paymentLinkData == other.paymentLinkData;
  }

  @override
  int get hashCode => key.hashCode ^ paymentLinkData.hashCode;
}

/// generated route for
/// [_i29.PaymentTypeScreen]
class PaymentTypeRoute extends _i61.PageRouteInfo<void> {
  const PaymentTypeRoute({List<_i61.PageRouteInfo>? children})
      : super(PaymentTypeRoute.name, initialChildren: children);

  static const String name = 'PaymentTypeRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i29.PaymentTypeScreen();
    },
  );
}

/// generated route for
/// [_i30.PayoutAccountScreen]
class PayoutAccountRoute extends _i61.PageRouteInfo<void> {
  const PayoutAccountRoute({List<_i61.PageRouteInfo>? children})
      : super(PayoutAccountRoute.name, initialChildren: children);

  static const String name = 'PayoutAccountRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i30.PayoutAccountScreen();
    },
  );
}

/// generated route for
/// [_i31.PayoutCreateAccount]
class PayoutCreateAccount extends _i61.PageRouteInfo<void> {
  const PayoutCreateAccount({List<_i61.PageRouteInfo>? children})
      : super(PayoutCreateAccount.name, initialChildren: children);

  static const String name = 'PayoutCreateAccount';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i31.PayoutCreateAccount();
    },
  );
}

/// generated route for
/// [_i32.PayoutMenuScreen]
class PayoutMenuRoute extends _i61.PageRouteInfo<void> {
  const PayoutMenuRoute({List<_i61.PageRouteInfo>? children})
      : super(PayoutMenuRoute.name, initialChildren: children);

  static const String name = 'PayoutMenuRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i32.PayoutMenuScreen();
    },
  );
}

/// generated route for
/// [_i33.ProductDetailsScreen]
class ProductDetailsRoute extends _i61.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i65.Key? key,
    required _i66.GiftModel gift,
    List<_i61.PageRouteInfo>? children,
  }) : super(
          ProductDetailsRoute.name,
          args: ProductDetailsRouteArgs(key: key, gift: gift),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailsRouteArgs>();
      return _i33.ProductDetailsScreen(key: args.key, gift: args.gift);
    },
  );
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({this.key, required this.gift});

  final _i65.Key? key;

  final _i66.GiftModel gift;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, gift: $gift}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductDetailsRouteArgs) return false;
    return key == other.key && gift == other.gift;
  }

  @override
  int get hashCode => key.hashCode ^ gift.hashCode;
}

/// generated route for
/// [_i34.ProfileAccessManagementScreen]
class ProfileAccessManagementRoute extends _i61.PageRouteInfo<void> {
  const ProfileAccessManagementRoute({List<_i61.PageRouteInfo>? children})
      : super(ProfileAccessManagementRoute.name, initialChildren: children);

  static const String name = 'ProfileAccessManagementRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i34.ProfileAccessManagementScreen();
    },
  );
}

/// generated route for
/// [_i35.ProfileBoostInsightScreen]
class ProfileBoostInsightRoute
    extends _i61.PageRouteInfo<ProfileBoostInsightRouteArgs> {
  ProfileBoostInsightRoute({
    _i62.Key? key,
    required String userName,
    List<_i61.PageRouteInfo>? children,
  }) : super(
          ProfileBoostInsightRoute.name,
          args: ProfileBoostInsightRouteArgs(key: key, userName: userName),
          initialChildren: children,
        );

  static const String name = 'ProfileBoostInsightRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileBoostInsightRouteArgs>();
      return _i35.ProfileBoostInsightScreen(
        key: args.key,
        userName: args.userName,
      );
    },
  );
}

class ProfileBoostInsightRouteArgs {
  const ProfileBoostInsightRouteArgs({this.key, required this.userName});

  final _i62.Key? key;

  final String userName;

  @override
  String toString() {
    return 'ProfileBoostInsightRouteArgs{key: $key, userName: $userName}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProfileBoostInsightRouteArgs) return false;
    return key == other.key && userName == other.userName;
  }

  @override
  int get hashCode => key.hashCode ^ userName.hashCode;
}

/// generated route for
/// [_i36.ProfileBoostScreen]
class ProfileBoostRoute extends _i61.PageRouteInfo<void> {
  const ProfileBoostRoute({List<_i61.PageRouteInfo>? children})
      : super(ProfileBoostRoute.name, initialChildren: children);

  static const String name = 'ProfileBoostRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i36.ProfileBoostScreen();
    },
  );
}

/// generated route for
/// [_i37.ProfileBoostViewScreen]
class ProfileBoostViewRoute
    extends _i61.PageRouteInfo<ProfileBoostViewRouteArgs> {
  ProfileBoostViewRoute({
    _i62.Key? key,
    required _i67.ProfileBoostModel profile,
    required List<_i67.ProfileBoostModel> profiles,
    List<_i61.PageRouteInfo>? children,
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

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileBoostViewRouteArgs>();
      return _i37.ProfileBoostViewScreen(
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

  final _i62.Key? key;

  final _i67.ProfileBoostModel profile;

  final List<_i67.ProfileBoostModel> profiles;

  @override
  String toString() {
    return 'ProfileBoostViewRouteArgs{key: $key, profile: $profile, profiles: $profiles}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProfileBoostViewRouteArgs) return false;
    return key == other.key &&
        profile == other.profile &&
        const _i68.ListEquality().equals(profiles, other.profiles);
  }

  @override
  int get hashCode =>
      key.hashCode ^
      profile.hashCode ^
      const _i68.ListEquality().hash(profiles);
}

/// generated route for
/// [_i38.ProfileCarouselScreen]
class ProfileCarouselRoute extends _i61.PageRouteInfo<void> {
  const ProfileCarouselRoute({List<_i61.PageRouteInfo>? children})
      : super(ProfileCarouselRoute.name, initialChildren: children);

  static const String name = 'ProfileCarouselRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i38.ProfileCarouselScreen();
    },
  );
}

/// generated route for
/// [_i39.ProfileEditCarouselScreen]
class ProfileEditCarouselRoute extends _i61.PageRouteInfo<void> {
  const ProfileEditCarouselRoute({List<_i61.PageRouteInfo>? children})
      : super(ProfileEditCarouselRoute.name, initialChildren: children);

  static const String name = 'ProfileEditCarouselRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i39.ProfileEditCarouselScreen();
    },
  );
}

/// generated route for
/// [_i40.ProfileEditScreen]
class ProfileEditRoute extends _i61.PageRouteInfo<ProfileEditRouteArgs> {
  ProfileEditRoute({
    _i62.Key? key,
    required int activeTab,
    List<_i61.PageRouteInfo>? children,
  }) : super(
          ProfileEditRoute.name,
          args: ProfileEditRouteArgs(key: key, activeTab: activeTab),
          initialChildren: children,
        );

  static const String name = 'ProfileEditRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileEditRouteArgs>();
      return _i40.ProfileEditScreen(key: args.key, activeTab: args.activeTab);
    },
  );
}

class ProfileEditRouteArgs {
  const ProfileEditRouteArgs({this.key, required this.activeTab});

  final _i62.Key? key;

  final int activeTab;

  @override
  String toString() {
    return 'ProfileEditRouteArgs{key: $key, activeTab: $activeTab}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProfileEditRouteArgs) return false;
    return key == other.key && activeTab == other.activeTab;
  }

  @override
  int get hashCode => key.hashCode ^ activeTab.hashCode;
}

/// generated route for
/// [_i41.ProfilePage]
class ProfileRoute extends _i61.PageRouteInfo<void> {
  const ProfileRoute({List<_i61.PageRouteInfo>? children})
      : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i41.ProfilePage();
    },
  );
}

/// generated route for
/// [_i42.ProfilePhotoScreen]
class ProfilePhotoRoute extends _i61.PageRouteInfo<void> {
  const ProfilePhotoRoute({List<_i61.PageRouteInfo>? children})
      : super(ProfilePhotoRoute.name, initialChildren: children);

  static const String name = 'ProfilePhotoRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i42.ProfilePhotoScreen();
    },
  );
}

/// generated route for
/// [_i43.ProfileViewScreen]
class ProfileViewRoute extends _i61.PageRouteInfo<ProfileViewRouteArgs> {
  ProfileViewRoute({
    _i62.Key? key,
    required String profileId,
    String? blockOrUnBlockId,
    String? userId,
    List<_i61.PageRouteInfo>? children,
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

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileViewRouteArgs>();
      return _i43.ProfileViewScreen(
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

  final _i62.Key? key;

  final String profileId;

  final String? blockOrUnBlockId;

  final String? userId;

  @override
  String toString() {
    return 'ProfileViewRouteArgs{key: $key, profileId: $profileId, blockOrUnBlockId: $blockOrUnBlockId, userId: $userId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProfileViewRouteArgs) return false;
    return key == other.key &&
        profileId == other.profileId &&
        blockOrUnBlockId == other.blockOrUnBlockId &&
        userId == other.userId;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      profileId.hashCode ^
      blockOrUnBlockId.hashCode ^
      userId.hashCode;
}

/// generated route for
/// [_i44.RedeemGiftDetailScreen]
class RedeemGiftDetailRoute
    extends _i61.PageRouteInfo<RedeemGiftDetailRouteArgs> {
  RedeemGiftDetailRoute({
    _i62.Key? key,
    required double totalAmount,
    required String giftId,
    List<_i61.PageRouteInfo>? children,
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

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RedeemGiftDetailRouteArgs>();
      return _i44.RedeemGiftDetailScreen(
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

  final _i62.Key? key;

  final double totalAmount;

  final String giftId;

  @override
  String toString() {
    return 'RedeemGiftDetailRouteArgs{key: $key, totalAmount: $totalAmount, giftId: $giftId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RedeemGiftDetailRouteArgs) return false;
    return key == other.key &&
        totalAmount == other.totalAmount &&
        giftId == other.giftId;
  }

  @override
  int get hashCode => key.hashCode ^ totalAmount.hashCode ^ giftId.hashCode;
}

/// generated route for
/// [_i45.RefereeListScreen]
class RefereeListRoute extends _i61.PageRouteInfo<void> {
  const RefereeListRoute({List<_i61.PageRouteInfo>? children})
      : super(RefereeListRoute.name, initialChildren: children);

  static const String name = 'RefereeListRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i45.RefereeListScreen();
    },
  );
}

/// generated route for
/// [_i46.ResetPasswordOtpScreen]
class ResetPasswordOtpRoute
    extends _i61.PageRouteInfo<ResetPasswordOtpRouteArgs> {
  ResetPasswordOtpRoute({
    _i62.Key? key,
    required String email,
    List<_i61.PageRouteInfo>? children,
  }) : super(
          ResetPasswordOtpRoute.name,
          args: ResetPasswordOtpRouteArgs(key: key, email: email),
          initialChildren: children,
        );

  static const String name = 'ResetPasswordOtpRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResetPasswordOtpRouteArgs>();
      return _i46.ResetPasswordOtpScreen(key: args.key, email: args.email);
    },
  );
}

class ResetPasswordOtpRouteArgs {
  const ResetPasswordOtpRouteArgs({this.key, required this.email});

  final _i62.Key? key;

  final String email;

  @override
  String toString() {
    return 'ResetPasswordOtpRouteArgs{key: $key, email: $email}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ResetPasswordOtpRouteArgs) return false;
    return key == other.key && email == other.email;
  }

  @override
  int get hashCode => key.hashCode ^ email.hashCode;
}

/// generated route for
/// [_i47.ResetPasswordScreen]
class ResetPasswordRoute extends _i61.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    _i62.Key? key,
    required _i69.ResetPasswordRequest request,
    List<_i61.PageRouteInfo>? children,
  }) : super(
          ResetPasswordRoute.name,
          args: ResetPasswordRouteArgs(key: key, request: request),
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResetPasswordRouteArgs>();
      return _i47.ResetPasswordScreen(key: args.key, request: args.request);
    },
  );
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({this.key, required this.request});

  final _i62.Key? key;

  final _i69.ResetPasswordRequest request;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key, request: $request}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ResetPasswordRouteArgs) return false;
    return key == other.key && request == other.request;
  }

  @override
  int get hashCode => key.hashCode ^ request.hashCode;
}

/// generated route for
/// [_i48.SendCoinDetailsScreen]
class SendCoinDetailsRoute
    extends _i61.PageRouteInfo<SendCoinDetailsRouteArgs> {
  SendCoinDetailsRoute({
    _i62.Key? key,
    required String receiverId,
    required String receiverUsername,
    required double amount,
    required String message,
    List<_i61.PageRouteInfo>? children,
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

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SendCoinDetailsRouteArgs>();
      return _i48.SendCoinDetailsScreen(
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

  final _i62.Key? key;

  final String receiverId;

  final String receiverUsername;

  final double amount;

  final String message;

  @override
  String toString() {
    return 'SendCoinDetailsRouteArgs{key: $key, receiverId: $receiverId, receiverUsername: $receiverUsername, amount: $amount, message: $message}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SendCoinDetailsRouteArgs) return false;
    return key == other.key &&
        receiverId == other.receiverId &&
        receiverUsername == other.receiverUsername &&
        amount == other.amount &&
        message == other.message;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      receiverId.hashCode ^
      receiverUsername.hashCode ^
      amount.hashCode ^
      message.hashCode;
}

/// generated route for
/// [_i49.SendCoinScreen]
class SendCoinRoute extends _i61.PageRouteInfo<void> {
  const SendCoinRoute({List<_i61.PageRouteInfo>? children})
      : super(SendCoinRoute.name, initialChildren: children);

  static const String name = 'SendCoinRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i49.SendCoinScreen();
    },
  );
}

/// generated route for
/// [_i50.SignInScreen]
class SignInRoute extends _i61.PageRouteInfo<void> {
  const SignInRoute({List<_i61.PageRouteInfo>? children})
      : super(SignInRoute.name, initialChildren: children);

  static const String name = 'SignInRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i50.SignInScreen();
    },
  );
}

/// generated route for
/// [_i51.SignUpScreen]
class SignUpRoute extends _i61.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    _i62.Key? key,
    String? referralCode,
    List<_i61.PageRouteInfo>? children,
  }) : super(
          SignUpRoute.name,
          args: SignUpRouteArgs(key: key, referralCode: referralCode),
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignUpRouteArgs>(
        orElse: () => const SignUpRouteArgs(),
      );
      return _i51.SignUpScreen(key: args.key, referralCode: args.referralCode);
    },
  );
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key, this.referralCode});

  final _i62.Key? key;

  final String? referralCode;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key, referralCode: $referralCode}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SignUpRouteArgs) return false;
    return key == other.key && referralCode == other.referralCode;
  }

  @override
  int get hashCode => key.hashCode ^ referralCode.hashCode;
}

/// generated route for
/// [_i52.TargetInsightsScreen]
class TargetInsightsRoute extends _i61.PageRouteInfo<void> {
  const TargetInsightsRoute({List<_i61.PageRouteInfo>? children})
      : super(TargetInsightsRoute.name, initialChildren: children);

  static const String name = 'TargetInsightsRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i52.TargetInsightsScreen();
    },
  );
}

/// generated route for
/// [_i53.TransactionsScreen]
class TransactionsRoute extends _i61.PageRouteInfo<void> {
  const TransactionsRoute({List<_i61.PageRouteInfo>? children})
      : super(TransactionsRoute.name, initialChildren: children);

  static const String name = 'TransactionsRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i53.TransactionsScreen();
    },
  );
}

/// generated route for
/// [_i54.UserFinderScreen]
class UserFinderRoute extends _i61.PageRouteInfo<void> {
  const UserFinderRoute({List<_i61.PageRouteInfo>? children})
      : super(UserFinderRoute.name, initialChildren: children);

  static const String name = 'UserFinderRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i54.UserFinderScreen();
    },
  );
}

/// generated route for
/// [_i55.VerificationScreen]
class VerificationRoute extends _i61.PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({
    _i62.Key? key,
    required bool isPhoneNumber,
    required String phoneNumber,
    String? countryCode,
    required String email,
    List<_i61.PageRouteInfo>? children,
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

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerificationRouteArgs>();
      return _i55.VerificationScreen(
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
    this.countryCode,
    required this.email,
  });

  final _i62.Key? key;

  final bool isPhoneNumber;

  final String phoneNumber;

  final String? countryCode;

  final String email;

  @override
  String toString() {
    return 'VerificationRouteArgs{key: $key, isPhoneNumber: $isPhoneNumber, phoneNumber: $phoneNumber, countryCode: $countryCode, email: $email}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VerificationRouteArgs) return false;
    return key == other.key &&
        isPhoneNumber == other.isPhoneNumber &&
        phoneNumber == other.phoneNumber &&
        countryCode == other.countryCode &&
        email == other.email;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      isPhoneNumber.hashCode ^
      phoneNumber.hashCode ^
      countryCode.hashCode ^
      email.hashCode;
}

/// generated route for
/// [_i56.VerificationWelcomeScreen]
class VerificationWelcomeRoute extends _i61.PageRouteInfo<void> {
  const VerificationWelcomeRoute({List<_i61.PageRouteInfo>? children})
      : super(VerificationWelcomeRoute.name, initialChildren: children);

  static const String name = 'VerificationWelcomeRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i56.VerificationWelcomeScreen();
    },
  );
}

/// generated route for
/// [_i57.WalletScreen]
class WalletRoute extends _i61.PageRouteInfo<void> {
  const WalletRoute({List<_i61.PageRouteInfo>? children})
      : super(WalletRoute.name, initialChildren: children);

  static const String name = 'WalletRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i57.WalletScreen();
    },
  );
}

/// generated route for
/// [_i58.WelcomeScreen]
class WelcomeRoute extends _i61.PageRouteInfo<WelcomeRouteArgs> {
  WelcomeRoute({
    _i62.Key? key,
    _i70.UserProfileModel? profile,
    List<_i61.PageRouteInfo>? children,
  }) : super(
          WelcomeRoute.name,
          args: WelcomeRouteArgs(key: key, profile: profile),
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WelcomeRouteArgs>(
        orElse: () => const WelcomeRouteArgs(),
      );
      return _i58.WelcomeScreen(key: args.key, profile: args.profile);
    },
  );
}

class WelcomeRouteArgs {
  const WelcomeRouteArgs({this.key, this.profile});

  final _i62.Key? key;

  final _i70.UserProfileModel? profile;

  @override
  String toString() {
    return 'WelcomeRouteArgs{key: $key, profile: $profile}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WelcomeRouteArgs) return false;
    return key == other.key && profile == other.profile;
  }

  @override
  int get hashCode => key.hashCode ^ profile.hashCode;
}

/// generated route for
/// [_i59.WithdrawalPayoutAccountScreen]
class WithdrawalPayoutAccountRoute extends _i61.PageRouteInfo<void> {
  const WithdrawalPayoutAccountRoute({List<_i61.PageRouteInfo>? children})
      : super(WithdrawalPayoutAccountRoute.name, initialChildren: children);

  static const String name = 'WithdrawalPayoutAccountRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i59.WithdrawalPayoutAccountScreen();
    },
  );
}

/// generated route for
/// [_i60.WithdrawalScreen]
class WithdrawalRoute extends _i61.PageRouteInfo<WithdrawalRouteArgs> {
  WithdrawalRoute({
    _i62.Key? key,
    required String account,
    required String accountNumber,
    List<_i61.PageRouteInfo>? children,
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

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WithdrawalRouteArgs>();
      return _i60.WithdrawalScreen(
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

  final _i62.Key? key;

  final String account;

  final String accountNumber;

  @override
  String toString() {
    return 'WithdrawalRouteArgs{key: $key, account: $account, accountNumber: $accountNumber}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WithdrawalRouteArgs) return false;
    return key == other.key &&
        account == other.account &&
        accountNumber == other.accountNumber;
  }

  @override
  int get hashCode => key.hashCode ^ account.hashCode ^ accountNumber.hashCode;
}
