import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_countries_model.freezed.dart';
part 'payment_countries_model.g.dart';

@freezed
abstract class CountryData with _$CountryData {
  const factory CountryData({
    required String code,
    required String code2Iso,
    required String name,
    String? phoneCode,
    required String currency,
  }) = _CountryData;

  factory CountryData.fromJson(Map<String, dynamic> json) =>
      _$CountryDataFromJson(json);
}

@freezed
abstract class PaymentOption with _$PaymentOption {
  const factory PaymentOption({
    required String payment,
    required List<String> providers,
    required List<String> mandatory,
  }) = _PaymentOption;

  factory PaymentOption.fromJson(Map<String, dynamic> json) =>
      _$PaymentOptionFromJson(json);
}
