import 'package:freezed_annotation/freezed_annotation.dart';

part 'pay_out_model.freezed.dart';
part 'pay_out_model.g.dart';

@freezed
class PayoutData with _$PayoutData {
  factory PayoutData({
    required bool status,
    required String message,
    required String provider,
    String? errors,
  }) = _PayoutData;

  factory PayoutData.fromJson(Map<String, dynamic> json) =>
      _$PayoutDataFromJson(json);
}
