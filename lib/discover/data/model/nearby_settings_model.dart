
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nearby_settings_model.freezed.dart';
part 'nearby_settings_model.g.dart';

@freezed
class NearbySettingsModel with _$NearbySettingsModel {
  factory NearbySettingsModel({
    required int statusCode,
    required String message,
    required bool success,
    required int totalCount,
    required NearbySettingsDataModel data,
  }) = _NearbySettingsModel;

  factory NearbySettingsModel.fromJson(Map<String, dynamic> json) =>
      _$NearbySettingsModelFromJson(json);
}

@freezed
class NearbySettingsDataModel with _$NearbySettingsDataModel {
  factory NearbySettingsDataModel({
    required int id,
    required int radiusInKm,
  }) = _NearbySettingsDataModel;

  factory NearbySettingsDataModel.fromJson(Map<String, dynamic> json) =>
      _$NearbySettingsDataModelFromJson(json);
}
