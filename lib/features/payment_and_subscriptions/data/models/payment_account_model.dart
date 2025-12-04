import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_account_model.freezed.dart';
part 'payment_account_model.g.dart';

@freezed
abstract class PaymentAccount with _$PaymentAccount {
  factory PaymentAccount({
    required String id,
    required String userId,
    required String firstName,
    required String lastName,
    required String countryIso2Code,
    required String payOutType,
    required String currency,
    String? bankId,
    String? bankName,
    String? bankCode,
    String? branchCode,
    String? accountNumber,
    String? routingNumber,
    String? swiftCode,
    String? mobileMoneyAccount,
    String? paypalAddress,
    String? cryptoCoinName,
    String? cryptoCoinAddress,
  }) = _PaymentAccount;

  factory PaymentAccount.fromJson(Map<String, dynamic> json) =>
      _$PaymentAccountFromJson(json);
}
