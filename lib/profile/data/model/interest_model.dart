import 'package:freezed_annotation/freezed_annotation.dart';

part 'interest_model.freezed.dart';
part 'interest_model.g.dart';

@freezed
class InterestModel with _$InterestModel {
  @JsonSerializable()
  factory InterestModel({
    dynamic id,
    dynamic title,
  }) = _InterestModel;

  factory InterestModel.fromJson(Map<String, dynamic> json) => _$InterestModelFromJson(json);
}

@freezed
class InterestListModel with _$InterestListModel {
  @JsonSerializable(explicitToJson: true)
  factory InterestListModel({
    List<InterestModel>? data,
  }) = _InterestListModel;

  factory InterestListModel.fromJson(Map<String, dynamic> json) => _$InterestListModelFromJson(json);
}
