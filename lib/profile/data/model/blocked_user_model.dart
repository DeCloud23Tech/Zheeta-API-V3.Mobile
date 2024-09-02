import 'package:freezed_annotation/freezed_annotation.dart';

part 'blocked_user_model.freezed.dart';
part 'blocked_user_model.g.dart';

@freezed
class BlockedUser with _$BlockedUser {
  const factory BlockedUser({
    required String userName,
    required String fullName,
    required int age,
    required String city,
    required String country,
    required String gender,
    required String profilePhotoURL,
    required String blockedUserId,
  }) = _BlockedUser;

  factory BlockedUser.fromJson(Map<String, dynamic> json) =>
      _$BlockedUserFromJson(json);
}

@freezed
class BlockedUsersResponse with _$BlockedUsersResponse {
  const factory BlockedUsersResponse({
    required List<BlockedUser> data,
  }) = _BlockedUsersResponse;

  factory BlockedUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$BlockedUsersResponseFromJson(json);
}
