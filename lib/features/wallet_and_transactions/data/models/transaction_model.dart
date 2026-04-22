// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
abstract class TransactionModel with _$TransactionModel {
  factory TransactionModel({
    required String id,
    required String userId,
    required String title,
    required String fromUsername,
    @JsonKey(name: 'coinAmount') required double amount,
    required String transactionType,
    @JsonKey(defaultValue: '') required String status,
    required DateTime lastModifiedDate,
    required DateTime createdDate,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}
