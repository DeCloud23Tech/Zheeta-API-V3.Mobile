import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_model.freezed.dart';
part 'subscription_model.g.dart';

@freezed
abstract class SubscriptionModel with _$SubscriptionModel {
  const factory SubscriptionModel({
    required int id,
    required String name,
    String? description,
    required double fee,
    required bool allowMessaging,
    required bool allowWithdrawal,
    required bool accessPeopleNearby,
    required int noMatchesPerDay,
    required int noOfBuddyEventPerWeek,
    required int noNearbyPerWeek,
    required int noOfChatMessagePerWeek,
    @Default([]) List<String> features,
  }) = _SubscriptionModel;

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionModelFromJson(json);
}

@freezed
abstract class SubscriptionListModel with _$SubscriptionListModel {
  factory SubscriptionListModel({
    required List<SubscriptionModel> data,
  }) = _SubscriptionListModel;

  factory SubscriptionListModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionListModelFromJson(json);
}
