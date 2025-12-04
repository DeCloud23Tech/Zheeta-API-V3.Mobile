import 'package:flutter/material.dart';

// Function to get the color for a notification type
Color getNotificationColor(String notificationType) {
  // Define a map for notification type colors
  const notificationColors = {
    'ActivityPost': Color(0xFFFF8960),
    'ActivityComment': Color(0xFFFFFFFF),
    'ActivityLike': Color(0xFFB0E57C), // Light green
    'ActivityPayment': Color(0xFFB39DDB), // Light purple
    'ReceiveFriendRequest': Color(0xFFFBFF4F),
    'ReceiveMoney': Color(0xFF80CBC4), // Light teal
    'ReceiveGift': Color(0xFF8DBBFF),
    'Transaction': Color(0xFFFAA1D1),
    'ReferralRegistration': Color(0xFFFFD54F), // Amber
  };

  // Return the color from the map, or a default color if the type is not found
  return notificationColors[notificationType] ?? Colors.grey;
}

// Enum for NotificationType
enum NotificationType {
  activityPost,
  activityComment,
  activityLike,
  activityPayment,
  receiveFriendRequest,
  receiveMoney,
  receiveGift,
  transaction,
  referralRegistration,
}

// Extension on NotificationType to get an integer value
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
    }
  }
}

extension NotificationTypeName on NotificationType {
  String get label {
    switch (this) {
      case NotificationType.activityPost:
        return 'ActivityPost';
      case NotificationType.activityComment:
        return 'ActivityComment';
      case NotificationType.activityLike:
        return 'ActivityLike';
      case NotificationType.activityPayment:
        return 'ActivityPayment';
      case NotificationType.receiveFriendRequest:
        return 'ReceiveFriendRequest';
      case NotificationType.receiveMoney:
        return 'ReceiveMoney';
      case NotificationType.receiveGift:
        return 'ReceiveGift';
      case NotificationType.transaction:
        return 'Transaction';
      case NotificationType.referralRegistration:
        return 'ReferralRegistration';
    }
  }
}

int? mapTypeStringToInt(String type) {
  switch (type) {
    case 'ActivityPost':
      return NotificationType.activityPost.value;
    case 'ActivityComment':
      return NotificationType.activityComment.value;
    case 'ActivityLike':
      return NotificationType.activityLike.value;
    case 'ActivityPayment':
      return NotificationType.activityPayment.value;
    case 'ReceiveFriendRequest':
      return NotificationType.receiveFriendRequest.value;
    case 'ReceiveMoney':
      return NotificationType.receiveMoney.value;
    case 'ReceiveGift':
      return NotificationType.receiveGift.value;
    case 'Transaction':
      return NotificationType.transaction.value;
    case 'ReferralRegistration':
      return NotificationType.referralRegistration.value;
    default:
      return null; // fallback if no match
  }
}
