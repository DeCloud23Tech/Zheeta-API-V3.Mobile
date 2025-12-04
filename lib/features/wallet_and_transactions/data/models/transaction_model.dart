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
    required double amount,
    required String transactionType,
    required DateTime lastModifiedDate,
    required DateTime createdDate,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}
