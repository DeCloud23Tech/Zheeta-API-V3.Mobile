import 'package:json_annotation/json_annotation.dart';

part 'location_coordinate_from_address_request.g.dart';

@JsonSerializable()
class LocationCoordinateFromAddressRequest {
  String streetNumber;
  String address;
  String country;
  String state;
  String city;
  String postalCode;

  LocationCoordinateFromAddressRequest({
    required this.streetNumber,
    required this.address,
    required this.country,
    required this.state,
    required this.city,
    required this.postalCode,
  });

  factory LocationCoordinateFromAddressRequest.fromJson(Map<String, dynamic> json) => _$LocationCoordinateFromAddressRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LocationCoordinateFromAddressRequestToJson(this);
}
