import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
class MessageModel with _$MessageModel {
  const factory MessageModel({
    required String id,
    required String senderId,
    required String recipientId,
    String? message,
    String? mediaUrl,
    required String partitionKey,
    required DateTime timestamp,
    required DateTime createdDate,
    required DateTime lastModifiedDate,
    required bool isRead,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);
}
