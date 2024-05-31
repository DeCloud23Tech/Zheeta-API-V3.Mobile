import 'package:json_annotation/json_annotation.dart';

enum SubscriptionType {
  @JsonValue(1)
  regular,
  @JsonValue(2)
  premium,
  @JsonValue(3)
  gold
}

extension SubscriptionTypeExtension on SubscriptionType {
  String get name {
    switch (this) {
      case SubscriptionType.regular:
        return 'Regular';
      case SubscriptionType.premium:
        return 'Premium';
      case SubscriptionType.gold:
        return 'Gold';
      default:
        return '';
    }
  }
}

enum SubscriptionStatus {
  @JsonValue(1)
  active,
  @JsonValue(0)
  inactive
}

extension SubscriptionStatusExtension on SubscriptionStatus {
  String get name {
    switch (this) {
      case SubscriptionStatus.active:
        return 'Active';
      case SubscriptionStatus.inactive:
        return 'Inactive';
      default:
        return '';
    }
  }
}
