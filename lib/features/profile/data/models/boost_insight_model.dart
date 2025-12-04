import 'package:freezed_annotation/freezed_annotation.dart';

part 'boost_insight_model.freezed.dart';
part 'boost_insight_model.g.dart';

@freezed
abstract class BoostInsightModel with _$BoostInsightModel {
  const factory BoostInsightModel({
    required String userId,
    required String photoUrlForAds,
    required String caption,
    required String targetCountry,
    required String targetGender,
    required String targetCity,
    required int minAge,
    required int maxAge,
    required int maritalStatus,
    required int targetUsersNumber,
    required int targetUsersReached,
    required int duration,
    required double adsCost,
  }) = _BoostInsightModel;

  factory BoostInsightModel.fromJson(Map<String, dynamic> json) =>
      _$BoostInsightModelFromJson(json);
}
