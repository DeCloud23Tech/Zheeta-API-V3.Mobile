import 'package:freezed_annotation/freezed_annotation.dart';

part 'nearby_model.freezed.dart';
part 'nearby_model.g.dart';

@freezed
class NearbyDataModel with _$NearbyDataModel {
  factory NearbyDataModel({
    required String id,
    required String username,
    String? profilePhotoURL,
    required String location,
    required double distance,
    required int age,
    required String gender,
    required int totalWeight,
  }) = _NearbyDataModel;

  factory NearbyDataModel.fromJson(Map<String, dynamic> json) =>
      _$NearbyDataModelFromJson(json);
}

@freezed
class NearbyListDataModel with _$NearbyListDataModel {
  const factory NearbyListDataModel({
    required List<NearbyDataModel> data,
  }) = _NearbyListDataModel;

  factory NearbyListDataModel.fromJson(Map<String, dynamic> json) =>
      _$NearbyListDataModelFromJson(json);
}
