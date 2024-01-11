import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_detail_model.freezed.dart';
part 'country_detail_model.g.dart';

@freezed
class CountryDetailModel with _$CountryDetailModel {
  @JsonSerializable()
  const factory CountryDetailModel({
    String? code,
    String? code2Iso,
    String? name,
    String? phoneCode,
    String? currency,
    List<String>? cities,
  }) = _CountryDetailModel;

  factory CountryDetailModel.fromJson(Map<String, dynamic> json) => _$CountryDetailModelFromJson(json);
}
