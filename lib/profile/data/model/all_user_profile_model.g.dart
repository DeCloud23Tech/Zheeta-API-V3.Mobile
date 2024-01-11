// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllUserProfileModelImpl _$$AllUserProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AllUserProfileModelImpl(
      userId: json['userId'],
      userName: json['userName'],
      isFullyVerified: json['isFullyVerified'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      rolesCSV: json['rolesCSV'],
      createdDate: json['createdDate'],
      residentialAddress: json['residentialAddress'] == null
          ? null
          : ResidentialAddressData.fromJson(
              json['residentialAddress'] as Map<String, dynamic>),
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      isBlocked: json['isBlocked'],
      subscriptionPlan: json['subscriptionPlan'],
    );

Map<String, dynamic> _$$AllUserProfileModelImplToJson(
        _$AllUserProfileModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'isFullyVerified': instance.isFullyVerified,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'rolesCSV': instance.rolesCSV,
      'createdDate': instance.createdDate,
      'residentialAddress': instance.residentialAddress,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'isBlocked': instance.isBlocked,
      'subscriptionPlan': instance.subscriptionPlan,
    };

_$AllUserProfileListModelImpl _$$AllUserProfileListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AllUserProfileListModelImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AllUserProfileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AllUserProfileListModelImplToJson(
        _$AllUserProfileListModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
