import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_detail_model.freezed.dart';
part 'country_detail_model.g.dart';

@freezed
class CountryDetailModel with _$CountryDetailModel {
  @JsonSerializable()
  factory CountryDetailModel({
    required String code,
    required String code2Iso,
    required String name,
    required String phoneCode,
    required String currency,
    required List<String> cities,
  }) = _CountryDetailModel;

  factory CountryDetailModel.fromJson(Map<String, dynamic> json) => _$CountryDetailModelFromJson(json);
}
