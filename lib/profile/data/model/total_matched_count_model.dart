import 'package:freezed_annotation/freezed_annotation.dart';

part 'total_matched_count_model.freezed.dart';
part 'total_matched_count_model.g.dart';

@freezed
class GetTotalMatchedCountResponse with _$GetTotalMatchedCountResponse {
  const factory GetTotalMatchedCountResponse({
    required int statusCode,
    required String message,
    required bool success,
    required int totalCount,
    required int data,
  }) = _GetTotalMatchedCountResponse;

  factory GetTotalMatchedCountResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTotalMatchedCountResponseFromJson(json);
}
