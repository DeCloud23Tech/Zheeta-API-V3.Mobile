import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_model.freezed.dart';
part 'subscription_model.g.dart';

@freezed
class SubscriptionModel with _$SubscriptionModel {
  factory SubscriptionModel({
    required int id,
    required String name,
    required String description,
    required int fee,
    required bool allowMessaging,
    required int noMatchesPerDay,
    required int noOfPostPerDay,
    required int noNearbyPerWeek,
    required bool allowWithdrawal,
    required bool allowMultipleMediaInPost,
    required int maxNumberOfMediaInPost,
    required bool allowVideoMediaCategoryInPost,
    required bool allowCreateCommunity,
    required bool accessPeopleNearby,
  }) = _SubscriptionModel;

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) => _$SubscriptionModelFromJson(json);
}

@freezed
class SubscriptionListModel with _$SubscriptionListModel {
  factory SubscriptionListModel({
    required List<SubscriptionModel> data,
  }) = _SubscriptionListModel;

  factory SubscriptionListModel.fromJson(Map<String, dynamic> json) => _$SubscriptionListModelFromJson(json);
}
