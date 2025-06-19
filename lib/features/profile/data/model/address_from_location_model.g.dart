// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_from_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressFromLocationModelImpl _$$AddressFromLocationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AddressFromLocationModelImpl(
      streetNumber: json['streetNumber'],
      address: json['address'],
      country: json['country'],
      state: json['state'],
      city: json['city'],
      postalCode: json['postalCode'],
    );

Map<String, dynamic> _$$AddressFromLocationModelImplToJson(
        _$AddressFromLocationModelImpl instance) =>
    <String, dynamic>{
      'streetNumber': instance.streetNumber,
      'address': instance.address,
      'country': instance.country,
      'state': instance.state,
      'city': instance.city,
      'postalCode': instance.postalCode,
    };
