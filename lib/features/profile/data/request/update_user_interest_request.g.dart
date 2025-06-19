// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_interest_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserInterestRequest _$UpdateUserInterestRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateUserInterestRequest(
      userId: json['userId'] as String,
      interestIds: (json['interestIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$UpdateUserInterestRequestToJson(
        UpdateUserInterestRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'interestIds': instance.interestIds,
    };
