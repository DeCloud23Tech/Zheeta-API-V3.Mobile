import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_payment_link_model.freezed.dart';
part 'generate_payment_link_model.g.dart';


@freezed
class GeneratePaymentLinkData with _$GeneratePaymentLinkData {
  factory GeneratePaymentLinkData({
    required String paymentProvider,
    required PaymentGenerationData paymentGenerationData,
    String? verificationData,
    required int statusCode,
    required String message,
    required bool success,
    dynamic data, // Use dynamic since it's nullable and unstructured in the JSON
  }) = _GeneratePaymentLinkData;

  factory GeneratePaymentLinkData.fromJson(Map<String, dynamic> json) =>
      _$GeneratePaymentLinkDataFromJson(json);
}

@freezed
class PaymentGenerationData with _$PaymentGenerationData {
  factory PaymentGenerationData({
    required String id,
    required String paymentLink,
    required String addressToPayTo,
    required String currencyToPay,
    required double amountToPay,
    required double amountOfZheetaCoins,
  }) = _PaymentGenerationData;

  factory PaymentGenerationData.fromJson(Map<String, dynamic> json) =>
      _$PaymentGenerationDataFromJson(json);
}
