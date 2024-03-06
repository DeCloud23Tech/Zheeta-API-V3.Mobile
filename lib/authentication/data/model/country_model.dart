import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_model.freezed.dart';
part 'country_model.g.dart';

@freezed
class CountryModel with _$CountryModel {
  @JsonSerializable()
  factory CountryModel({
    String? code,
    String? code2Iso,
    String? name,
    String? phoneCode,
    String? currency,
  }) = _CountryModel;

  factory CountryModel.fromJson(Map<String, dynamic> json) => _$CountryModelFromJson(json);
}

@freezed
class CountryListModel with _$CountryListModel {
  @JsonSerializable(explicitToJson: true)
  factory CountryListModel({
    List<CountryModel>? data,
  }) = _CountryListModel;

  factory CountryListModel.fromJson(Map<String, dynamic> json) => _$CountryListModelFromJson(json);
}
