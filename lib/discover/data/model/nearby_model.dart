import 'package:freezed_annotation/freezed_annotation.dart';


part 'nearby_model.freezed.dart';
part 'nearby_model.g.dart';


@freezed
class NearbyListModel with _$NearbyListModel {
  @JsonSerializable(explicitToJson: true)
  factory NearbyListModel({
    required List<NearbyDataModel> data,
  }) = _NearbyListModel;

  factory NearbyListModel.fromJson(Map<String, dynamic> json) =>
      _$NearbyListModelFromJson(json);
}

@freezed
class NearbyDataModel with _$NearbyDataModel {
  @JsonSerializable()
  factory NearbyDataModel({
    required String id,
    required String username,
    required String profilePhotoURL,
    required String location,
    required int distance,
    required int age,
    required String gender,
    required int totalWeight,
  }) = _NearbyDataModel;

  factory NearbyDataModel.fromJson(Map<String, dynamic> json) =>
      _$NearbyDataModelFromJson(json);
}