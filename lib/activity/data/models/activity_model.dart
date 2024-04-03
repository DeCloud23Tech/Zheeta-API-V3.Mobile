import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_model.freezed.dart';
part 'activity_model.g.dart';

@freezed
class ActivityModel with _$ActivityModel {
  @JsonSerializable()
  factory ActivityModel({
    dynamic totalPostCoin,
    dynamic posterId,
    dynamic id,
    dynamic caption,
    dynamic location,
    dynamic mediaCollectionURL,
    dynamic tagCollection,
    dynamic redirectUrl,
    dynamic unlikeCount,
    dynamic likeCount,
    dynamic commentCount,
    dynamic status,
    dynamic lastModifiedDate,
  }) = _ActivityModel;

  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);
}

@freezed
class ActivityListModel with _$ActivityListModel {
  @JsonSerializable(explicitToJson: true)
  factory ActivityListModel({
    List<ActivityModel>? data,
  }) = _ActivityListModel;

  factory ActivityListModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityListModelFromJson(json);
}
