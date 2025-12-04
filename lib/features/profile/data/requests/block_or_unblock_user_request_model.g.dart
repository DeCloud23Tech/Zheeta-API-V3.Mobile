// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_or_unblock_user_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockOrUnblockUserRequest _$BlockOrUnblockUserRequestFromJson(
        Map<String, dynamic> json) =>
    BlockOrUnblockUserRequest(
      userId: json['UserId'] as String,
      blockOrUnblockUserId: json['BlockOrUnblockUserId'] as String,
    );

Map<String, dynamic> _$BlockOrUnblockUserRequestToJson(
        BlockOrUnblockUserRequest instance) =>
    <String, dynamic>{
      'UserId': instance.userId,
      'BlockOrUnblockUserId': instance.blockOrUnblockUserId,
    };
