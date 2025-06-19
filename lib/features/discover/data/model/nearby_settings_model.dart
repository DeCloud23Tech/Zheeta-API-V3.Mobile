
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nearby_settings_model.freezed.dart';
part 'nearby_settings_model.g.dart';

@freezed
class NearbySettingsModel with _$NearbySettingsModel {
  factory NearbySettingsModel({
    required int id,
    required int radiusInKm,
  }) = _NearbySettingsModel;

  factory NearbySettingsModel.fromJson(Map<String, dynamic> json) =>
      _$NearbySettingsModelFromJson(json);
}

