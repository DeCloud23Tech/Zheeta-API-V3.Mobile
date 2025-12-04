// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_from_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddressFromLocationModel _$AddressFromLocationModelFromJson(
        Map<String, dynamic> json) =>
    _AddressFromLocationModel(
      streetNumber: json['streetNumber'],
      address: json['address'],
      country: json['country'],
      state: json['state'],
      city: json['city'],
      postalCode: json['postalCode'],
    );

Map<String, dynamic> _$AddressFromLocationModelToJson(
        _AddressFromLocationModel instance) =>
    <String, dynamic>{
      'streetNumber': instance.streetNumber,
      'address': instance.address,
      'country': instance.country,
      'state': instance.state,
      'city': instance.city,
      'postalCode': instance.postalCode,
    };
