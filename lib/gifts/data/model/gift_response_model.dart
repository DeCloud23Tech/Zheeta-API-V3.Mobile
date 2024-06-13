import 'package:freezed_annotation/freezed_annotation.dart';

part 'gift_response_model.freezed.dart';
part 'gift_response_model.g.dart';

@freezed
class GiftResponseModel with _$GiftResponseModel {
  factory GiftResponseModel({
    required int statusCode,
    required String message,
    required bool success,
  }) = _GiftResponseModel;

  factory GiftResponseModel.fromJson(Map<String, dynamic> json) => _$GiftResponseModelFromJson(json);
}
