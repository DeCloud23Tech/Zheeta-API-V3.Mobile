import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_interest_model.freezed.dart';
part 'user_interest_model.g.dart';

@freezed
class UserInterestModel with _$UserInterestModel {
  @JsonSerializable()
  factory UserInterestModel({
    required dynamic id,
    required dynamic title,
  }) = _UserInterestModel;

  factory UserInterestModel.fromJson(Map<String, dynamic> json) => _$UserInterestModelFromJson(json);
}

@freezed
class UserInterestListModel with _$UserInterestListModel {
  @JsonSerializable(explicitToJson: true)
  factory UserInterestListModel({required List<UserInterestModel> data}) = _UserInterestListModel;

  factory UserInterestListModel.fromJson(Map<String, dynamic> json) => _$UserInterestListModelFromJson(json);
}
