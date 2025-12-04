import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_payment_link_model.freezed.dart';
part 'generate_payment_link_model.g.dart';

@freezed
abstract class GeneratePaymentLinkData with _$GeneratePaymentLinkData {
  const factory GeneratePaymentLinkData({
    required String paymentProvider,
    required PaymentGenerationData paymentGenerationData,
    VerificationData? verificationData,
    required int statusCode,
    required String message,
    required bool success,
    dynamic
        data, // Keeps the data type dynamic for cases where data is null or holds other types.
  }) = _GeneratePaymentLinkData;

  factory GeneratePaymentLinkData.fromJson(Map<String, dynamic> json) =>
      _$GeneratePaymentLinkDataFromJson(json);
}

@freezed
abstract class PaymentGenerationData with _$PaymentGenerationData {
  const factory PaymentGenerationData({
    required String id,
    required String paymentLink,
    String? addressToPayTo,
    required String currencyToPay,
    required double amountToPay,
    required double amountOfZheetaCoins,
  }) = _PaymentGenerationData;

  factory PaymentGenerationData.fromJson(Map<String, dynamic> json) =>
      _$PaymentGenerationDataFromJson(json);
}

@freezed
abstract class VerificationData with _$VerificationData {
  const factory VerificationData() = _VerificationData;

  factory VerificationData.fromJson(Map<String, dynamic> json) =>
      _$VerificationDataFromJson(json);
}
