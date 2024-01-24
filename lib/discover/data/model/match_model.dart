import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_model.freezed.dart';
part 'match_model.g.dart';

@freezed
class MatchModel with _$MatchModel {
  @JsonSerializable()
  const factory MatchModel({
    dynamic id,
    dynamic username,
    dynamic profilePhotoURL,
    dynamic location,
    dynamic distance,
    dynamic age,
    dynamic gender,
    dynamic totalWeight,
  }) = _MatchModel;

  factory MatchModel.fromJson(Map<String, dynamic> json) => _$MatchModelFromJson(json);
}

@freezed
class MatchListModel with _$MatchListModel {
  @JsonSerializable(explicitToJson: true)
  const factory MatchListModel({
    List<MatchModel>? data,
  }) = _MatchListModel;

  factory MatchListModel.fromJson(Map<String, dynamic> json) => _$MatchListModelFromJson(json);
}
