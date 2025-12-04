import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
abstract class NotificationModel with _$NotificationModel {
  factory NotificationModel({
    required String userId,
    String?
        notificationType, // Use String since "Transaction" is a string in JSON
    required String content,
    String? userProfilePicUrl,
    required bool isRead,
    String? notificationTypeValueId,
    required String id,
    String? partitionKey,
    DateTime? lastModifiedDate,
    DateTime? createdDate,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
