import 'package:json_annotation/json_annotation.dart';

part 'nearby_update_request.g.dart';

@JsonSerializable()
class NearbyUpdateRequest {
  final String id;
  final String userId;
  final int radiusInKm;
  final double longitude;
  final double latitude;
  final String gender;

  NearbyUpdateRequest({
    required this.id,
    required this.userId,
    required this.radiusInKm,
    required this.longitude,
    required this.latitude,
    required this.gender,
  });

  factory NearbyUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$NearbyUpdateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$NearbyUpdateRequestToJson(this);
}
