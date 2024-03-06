import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zheeta/app/common/enums/notification_filter.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  @JsonSerializable()
  factory NotificationModel({
    dynamic userId,
    NotificationType? notificationType,
    dynamic content,
    dynamic userProfilePicUrl,
    dynamic isRead,
    dynamic notificationTypeValueId,
    dynamic id,
    dynamic partitionKey,
    dynamic lastModifiedDate,
    dynamic createdDate,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);
}

@freezed
class NotificationListModel with _$NotificationListModel {
  @JsonSerializable()
  factory NotificationListModel({
    List<NotificationModel>? data,
  }) = _NotificationListModel;

  factory NotificationListModel.fromJson(Map<String, dynamic> json) => _$NotificationListModelFromJson(json);
}
