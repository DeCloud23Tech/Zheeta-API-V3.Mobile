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
  ActivityPost,
  ActivityComment,
  ActivityLike,
  ActivityPayment,
  ReceiveFriendRequest,
  ReceiveMoney,
  ReceiveGift,
  Transaction,
  ReferralRegistration,
}

// Extension on NotificationType to get an integer value
extension NotificationTypeExtension on NotificationType {
  int get value {
    switch (this) {
      case NotificationType.ActivityPost:
        return 1;
      case NotificationType.ActivityComment:
        return 2;
      case NotificationType.ActivityLike:
        return 3;
      case NotificationType.ActivityPayment:
        return 4;
      case NotificationType.ReceiveFriendRequest:
        return 5;
      case NotificationType.ReceiveMoney:
        return 6;
      case NotificationType.ReceiveGift:
        return 7;
      case NotificationType.Transaction:
        return 8;
      case NotificationType.ReferralRegistration:
        return 9;
      default:
        return 0;
    }
  }
}
