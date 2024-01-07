import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_model.freezed.dart';
part 'country_model.g.dart';

@freezed
class CountryModel with _$CountryModel {
  @JsonSerializable()
  factory CountryModel({
    required String code,
    required String code2Iso,
    required String name,
    required String phoneCode,
    required String currency,
  }) = _CountryModel;

  factory CountryModel.fromJson(Map<String, dynamic> json) => _$CountryModelFromJson(json);
}

@freezed
class CountryListModel with _$CountryListModel {
  @JsonSerializable(explicitToJson: true)
  factory CountryListModel({
    required List<CountryModel> data,
  }) = _CountryListModel;

  factory CountryListModel.fromJson(Map<String, dynamic> json) => _$CountryListModelFromJson(json);
}
