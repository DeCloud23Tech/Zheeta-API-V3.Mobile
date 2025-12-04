import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_interest_model.freezed.dart';
part 'user_interest_model.g.dart';

@freezed
abstract class UserInterestModel with _$UserInterestModel {
  factory UserInterestModel({
    required dynamic id,
    required dynamic title,
  }) = _UserInterestModel;

  factory UserInterestModel.fromJson(Map<String, dynamic> json) =>
      _$UserInterestModelFromJson(json);
}

@freezed
abstract class UserInterestListModel with _$UserInterestListModel {
  factory UserInterestListModel({required List<UserInterestModel> data}) =
      _UserInterestListModel;

  factory UserInterestListModel.fromJson(Map<String, dynamic> json) =>
      _$UserInterestListModelFromJson(json);
}
