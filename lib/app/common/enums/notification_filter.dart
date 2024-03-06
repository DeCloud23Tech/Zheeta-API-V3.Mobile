import 'package:freezed_annotation/freezed_annotation.dart';

enum NotificationType {
  all,
  @JsonValue('ActivityPost')
  activityPost,
  @JsonValue('ActivityComment')
  activityComment,
  @JsonValue('ActivityLike')
  activityLike,
  @JsonValue('ActivityPayment')
  activityPayment,
  @JsonValue('ReceiveFriendRequest')
  receiveFriendRequest,
  @JsonValue('ReceiveMoney')
  receiveMoney,
  @JsonValue('ReceiveGift')
  receiveGift,
  @JsonValue('Transaction')
  transaction,
  @JsonValue('ReferralRegistration')
  referralRegistration,
  @JsonValue('SharedActivityPost')
  sharedActivityPost,
  @JsonValue('CommunityPost')
  communityPost,
  @JsonValue('ComeBack')
  comeBack,
}

extension NotificationTypeExtension on NotificationType {
  int get value {
    switch (this) {
      case NotificationType.activityPost:
        return 1;
      case NotificationType.activityComment:
        return 2;
      case NotificationType.activityLike:
        return 3;
      case NotificationType.activityPayment:
        return 4;
      case NotificationType.receiveFriendRequest:
        return 5;
      case NotificationType.receiveMoney:
        return 6;
      case NotificationType.receiveGift:
        return 7;
      case NotificationType.transaction:
        return 8;
      case NotificationType.referralRegistration:
        return 9;
      case NotificationType.sharedActivityPost:
        return 10;
      case NotificationType.communityPost:
        return 11;
      case NotificationType.comeBack:
        return 12;
      default:
        return 0;
    }
  }

  String get name {
    switch (this) {
      case NotificationType.activityPost:
        return 'Activity';
      case NotificationType.activityComment:
        return 'Activity';
      case NotificationType.activityLike:
        return 'Activity';
      case NotificationType.activityPayment:
        return 'Payment';
      case NotificationType.receiveFriendRequest:
        return 'Friend Request';
      case NotificationType.receiveMoney:
        return 'Money';
      case NotificationType.receiveGift:
        return 'Gift';
      case NotificationType.transaction:
        return 'Transaction';
      case NotificationType.referralRegistration:
        return 'Referral';
      case NotificationType.sharedActivityPost:
        return 'Shared Post';
      case NotificationType.communityPost:
        return 'Community';
      case NotificationType.comeBack:
        return 'Come Back';
      default:
        return 'All';
    }
  }
}

enum NotificationDate {
  all,
  lastHour,
  today,
  last7Days,
  last30Days,
}

extension NotificationDateExtension on NotificationDate {
  String get name {
    switch (this) {
      case NotificationDate.lastHour:
        return 'Last Hour';
      case NotificationDate.today:
        return 'Today';
      case NotificationDate.last7Days:
        return 'Last 7 Days';
      case NotificationDate.last30Days:
        return 'Last 30 Days';
      default:
        return 'All';
    }
  }

  double get value {
    switch (this) {
      case NotificationDate.lastHour:
        Duration lastHour = Duration(hours: 1);
        double days = lastHour.inHours / 24.0;
        return days;
      case NotificationDate.today:
        DateTime now = DateTime.now();
        DateTime startOfDay = DateTime(now.year, now.month, now.day);
        int daysSinceStartOfDay = now.difference(startOfDay).inDays;
        return daysSinceStartOfDay.toDouble();
      case NotificationDate.last7Days:
        DateTime now = DateTime.now();
        DateTime sevenDaysAgo = now.subtract(Duration(days: 7));
        int daysDifference = now.difference(sevenDaysAgo).inDays;
        return daysDifference.toDouble();
      case NotificationDate.last30Days:
        DateTime now = DateTime.now();
        DateTime last30Days = now.subtract(Duration(days: 30));
        int daysDifference = now.difference(last30Days).inDays;
        return daysDifference.toDouble();
      default:
        return 0;
    }
  }
}
