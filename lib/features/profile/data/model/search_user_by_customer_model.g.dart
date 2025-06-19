// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_user_by_customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchUserByCustomerListModelImpl
    _$$SearchUserByCustomerListModelImplFromJson(Map<String, dynamic> json) =>
        _$SearchUserByCustomerListModelImpl(
          statusCode: (json['statusCode'] as num?)?.toInt(),
          message: json['message'] as String?,
          success: json['success'] as bool?,
          totalCount: (json['totalCount'] as num?)?.toInt(),
          data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  SearchUserByCustomer.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$SearchUserByCustomerListModelImplToJson(
        _$SearchUserByCustomerListModelImpl instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'success': instance.success,
      'totalCount': instance.totalCount,
      'data': instance.data,
    };

_$SearchUserByCustomerImpl _$$SearchUserByCustomerImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchUserByCustomerImpl(
      profileDisplayURL: json['profileDisplayURL'] as String?,
      username: json['username'] as String?,
      userId: json['userId'] as String?,
      isFullyVerified: json['isFullyVerified'] as bool?,
    );

Map<String, dynamic> _$$SearchUserByCustomerImplToJson(
        _$SearchUserByCustomerImpl instance) =>
    <String, dynamic>{
      'profileDisplayURL': instance.profileDisplayURL,
      'username': instance.username,
      'userId': instance.userId,
      'isFullyVerified': instance.isFullyVerified,
    };
