// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_coordinate_from_address_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationCoordinateFromAddressRequest
    _$LocationCoordinateFromAddressRequestFromJson(Map<String, dynamic> json) =>
        LocationCoordinateFromAddressRequest(
          streetNumber: json['streetNumber'] as String,
          address: json['address'] as String,
          country: json['country'] as String,
          state: json['state'] as String,
          city: json['city'] as String,
          postalCode: json['postalCode'] as String,
        );

Map<String, dynamic> _$LocationCoordinateFromAddressRequestToJson(
        LocationCoordinateFromAddressRequest instance) =>
    <String, dynamic>{
      'streetNumber': instance.streetNumber,
      'address': instance.address,
      'country': instance.country,
      'state': instance.state,
      'city': instance.city,
      'postalCode': instance.postalCode,
    };
