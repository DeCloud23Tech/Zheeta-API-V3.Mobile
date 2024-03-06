// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      userId: json['userId'],
      notificationType: $enumDecodeNullable(
          _$NotificationTypeEnumMap, json['notificationType']),
      content: json['content'],
      userProfilePicUrl: json['userProfilePicUrl'],
      isRead: json['isRead'],
      notificationTypeValueId: json['notificationTypeValueId'],
      id: json['id'],
      partitionKey: json['partitionKey'],
      lastModifiedDate: json['lastModifiedDate'],
      createdDate: json['createdDate'],
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'notificationType': _$NotificationTypeEnumMap[instance.notificationType],
      'content': instance.content,
      'userProfilePicUrl': instance.userProfilePicUrl,
      'isRead': instance.isRead,
      'notificationTypeValueId': instance.notificationTypeValueId,
      'id': instance.id,
      'partitionKey': instance.partitionKey,
      'lastModifiedDate': instance.lastModifiedDate,
      'createdDate': instance.createdDate,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.all: 'all',
  NotificationType.activityPost: 'ActivityPost',
  NotificationType.activityComment: 'ActivityComment',
  NotificationType.activityLike: 'ActivityLike',
  NotificationType.activityPayment: 'ActivityPayment',
  NotificationType.receiveFriendRequest: 'ReceiveFriendRequest',
  NotificationType.receiveMoney: 'ReceiveMoney',
  NotificationType.receiveGift: 'ReceiveGift',
  NotificationType.transaction: 'Transaction',
  NotificationType.referralRegistration: 'ReferralRegistration',
  NotificationType.sharedActivityPost: 'SharedActivityPost',
  NotificationType.communityPost: 'CommunityPost',
  NotificationType.comeBack: 'ComeBack',
};

_$NotificationListModelImpl _$$NotificationListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationListModelImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NotificationListModelImplToJson(
        _$NotificationListModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
