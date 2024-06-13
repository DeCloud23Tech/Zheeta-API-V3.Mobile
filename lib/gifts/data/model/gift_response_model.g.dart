// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GiftResponseModelImpl _$$GiftResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GiftResponseModelImpl(
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
      success: json['success'] as bool,
    );

Map<String, dynamic> _$$GiftResponseModelImplToJson(
        _$GiftResponseModelImpl instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'success': instance.success,
    };
