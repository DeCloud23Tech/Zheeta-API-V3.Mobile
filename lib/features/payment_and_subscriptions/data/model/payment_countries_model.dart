import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_countries_model.freezed.dart';
part 'payment_countries_model.g.dart';


@freezed
class CountryData with _$CountryData {
  const factory CountryData({
    String? countryName,
    required String countryCode,
    required String countryCurrency,
    required List<PaymentOption> paymentOptions,
  }) = _CountryData;

  factory CountryData.fromJson(Map<String, dynamic> json) =>
      _$CountryDataFromJson(json);
}

@freezed
class PaymentOption with _$PaymentOption {
  const factory PaymentOption({
    required String payment,
    required List<String> providers,
    required List<String> mandatory,
  }) = _PaymentOption;

  factory PaymentOption.fromJson(Map<String, dynamic> json) =>
      _$PaymentOptionFromJson(json);
}