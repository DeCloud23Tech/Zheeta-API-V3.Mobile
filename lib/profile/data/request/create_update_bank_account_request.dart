import 'package:json_annotation/json_annotation.dart';

part 'create_update_bank_account_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class CreateUpdateBankAccountRequest {
  String userId;
  String accountCountry;
  String bankName;
  String bankCode;
  String accountNumber;
  String accountCurrency;
  String accountSwiftCode;
  String accountBICCode;
  String otherDetails;
  String accountName;

  CreateUpdateBankAccountRequest({
    required this.userId,
    required this.accountCountry,
    required this.bankName,
    required this.bankCode,
    required this.accountNumber,
    required this.accountCurrency,
    required this.accountSwiftCode,
    required this.accountBICCode,
    required this.otherDetails,
    required this.accountName,
  });

  factory CreateUpdateBankAccountRequest.fromJson(Map<String, dynamic> json) => _$CreateUpdateBankAccountRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUpdateBankAccountRequestToJson(this);
}
