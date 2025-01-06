import 'package:freezed_annotation/freezed_annotation.dart';

part 'pay_out_model.freezed.dart';
part 'pay_out_model.g.dart';

@freezed
class PayoutDataModel with _$PayoutDataModel {
  factory PayoutDataModel({
    required bool status,
    required String message,
    required String provider,
    String? errors,
  }) = _PayoutDataModel;

  factory PayoutDataModel.fromJson(Map<String, dynamic> json) =>
      _$PayoutDataModelFromJson(json);
}
