// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_interest_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserUnterestRequest _$UpdateUserUnterestRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateUserUnterestRequest(
      userId: json['userId'] as String,
      interestIds:
          (json['interestIds'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$UpdateUserUnterestRequestToJson(
        UpdateUserUnterestRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'interestIds': instance.interestIds,
    };
