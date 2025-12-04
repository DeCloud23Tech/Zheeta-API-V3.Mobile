import 'package:freezed_annotation/freezed_annotation.dart';

part 'interest_model.freezed.dart';
part 'interest_model.g.dart';

@freezed
abstract class InterestModel with _$InterestModel {
  factory InterestModel({
    dynamic id,
    dynamic title,
  }) = _InterestModel;

  factory InterestModel.fromJson(Map<String, dynamic> json) =>
      _$InterestModelFromJson(json);
}

@freezed
abstract class InterestListModel with _$InterestListModel {
  factory InterestListModel({
    List<InterestModel>? data,
  }) = _InterestListModel;

  factory InterestListModel.fromJson(Map<String, dynamic> json) =>
      _$InterestListModelFromJson(json);
}
