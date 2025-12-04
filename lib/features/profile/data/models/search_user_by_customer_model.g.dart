// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_user_by_customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchUserByCustomerListModel _$SearchUserByCustomerListModelFromJson(
        Map<String, dynamic> json) =>
    _SearchUserByCustomerListModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      success: json['success'] as bool?,
      totalCount: (json['totalCount'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SearchUserByCustomer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchUserByCustomerListModelToJson(
        _SearchUserByCustomerListModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'success': instance.success,
      'totalCount': instance.totalCount,
      'data': instance.data,
    };

_SearchUserByCustomer _$SearchUserByCustomerFromJson(
        Map<String, dynamic> json) =>
    _SearchUserByCustomer(
      profileDisplayURL: json['profileDisplayURL'] as String?,
      username: json['username'] as String?,
      userId: json['userId'] as String?,
      isFullyVerified: json['isFullyVerified'] as bool?,
    );

Map<String, dynamic> _$SearchUserByCustomerToJson(
        _SearchUserByCustomer instance) =>
    <String, dynamic>{
      'profileDisplayURL': instance.profileDisplayURL,
      'username': instance.username,
      'userId': instance.userId,
      'isFullyVerified': instance.isFullyVerified,
    };
