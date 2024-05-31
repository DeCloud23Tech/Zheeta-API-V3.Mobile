import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_transaction_model.freezed.dart';
part 'user_transaction_model.g.dart';

@freezed
class UserTransactionModel with _$UserTransactionModel {
  @JsonSerializable()
  factory UserTransactionModel({
    dynamic userId,
    dynamic title,
    dynamic fromUsername,
    dynamic amount,
    dynamic transactionType,
    dynamic lastModifiedDate,
    dynamic createdDate,
  }) = _UserTransactionModel;

  factory UserTransactionModel.fromJson(Map<String, dynamic> json) => _$UserTransactionModelFromJson(json);
}

@freezed
class UserTransactionListModel with _$UserTransactionListModel {
  @JsonSerializable(explicitToJson: true)
  factory UserTransactionListModel({
    List<UserTransactionModel>? data,
  }) = _UserTransactionListModel;

  factory UserTransactionListModel.fromJson(Map<String, dynamic> json) => _$UserTransactionListModelFromJson(json);
}
