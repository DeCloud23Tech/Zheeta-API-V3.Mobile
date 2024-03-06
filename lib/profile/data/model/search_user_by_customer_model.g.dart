// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_user_by_customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchUserByCustomerModelImpl _$$SearchUserByCustomerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchUserByCustomerModelImpl(
      profileDisplayURL: json['profileDisplayURL'],
      username: json['username'],
      userId: json['userId'],
      isFullyVerified: json['isFullyVerified'],
    );

Map<String, dynamic> _$$SearchUserByCustomerModelImplToJson(
        _$SearchUserByCustomerModelImpl instance) =>
    <String, dynamic>{
      'profileDisplayURL': instance.profileDisplayURL,
      'username': instance.username,
      'userId': instance.userId,
      'isFullyVerified': instance.isFullyVerified,
    };

_$SearchUserByCustomerListModelImpl
    _$$SearchUserByCustomerListModelImplFromJson(Map<String, dynamic> json) =>
        _$SearchUserByCustomerListModelImpl(
          data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  SearchUserByCustomerModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$SearchUserByCustomerListModelImplToJson(
        _$SearchUserByCustomerListModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
