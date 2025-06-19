import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_recipients_model.freezed.dart';
part 'chat_recipients_model.g.dart';

@freezed
class ChatRecipients with _$ChatRecipients {
  const factory ChatRecipients({
    required List<Recipient> data,
  }) = _ChatRecipients;

  factory ChatRecipients.fromJson(Map<String, dynamic> json) =>
      _$ChatRecipientsFromJson(json);
}

@freezed
class Recipient with _$Recipient {
  const factory Recipient({
    required UserProfile userProfile,
    required String lastUnreadMessage,
    required String lastUnreadMessageTime,
    required int unreadMessageCount,
  }) = _Recipient;

  factory Recipient.fromJson(Map<String, dynamic> json) =>
      _$RecipientFromJson(json);
}

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String firstName,
    required String lastName,
    required String profilePhotoURL,
    required int profileStatus,
    required String lastSeenTime,
    required bool isOnline,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
