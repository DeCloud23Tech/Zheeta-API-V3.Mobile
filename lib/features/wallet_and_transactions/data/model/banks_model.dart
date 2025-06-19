import 'package:freezed_annotation/freezed_annotation.dart';

part 'banks_model.freezed.dart';
part 'banks_model.g.dart';

@freezed
class BankModel with _$BankModel {
  factory BankModel({
    required String id,
    required String bankName,
    required String bankCode,
  }) = _BankModel;

  factory BankModel.fromJson(Map<String, dynamic> json) =>
      _$BankModelFromJson(json);
}
