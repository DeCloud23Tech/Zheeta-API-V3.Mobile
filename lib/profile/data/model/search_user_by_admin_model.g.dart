// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_user_by_admin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchUserByAdminListModelImpl _$$SearchUserByAdminListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchUserByAdminListModelImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AllUserProfileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SearchUserByAdminListModelImplToJson(
        _$SearchUserByAdminListModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
