// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_out_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PayoutData _$PayoutDataFromJson(Map<String, dynamic> json) => _PayoutData(
      status: json['status'] as bool,
      message: json['message'] as String,
      provider: json['provider'] as String,
      errors: json['errors'] as String?,
    );

Map<String, dynamic> _$PayoutDataToJson(_PayoutData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'provider': instance.provider,
      'errors': instance.errors,
    };
