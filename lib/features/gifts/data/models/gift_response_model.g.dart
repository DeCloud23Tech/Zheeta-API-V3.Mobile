// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GiftResponseModel _$GiftResponseModelFromJson(Map<String, dynamic> json) =>
    _GiftResponseModel(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      success: json['success'] as bool,
    );

Map<String, dynamic> _$GiftResponseModelToJson(_GiftResponseModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'success': instance.success,
    };
