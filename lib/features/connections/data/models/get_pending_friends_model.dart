import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_pending_friends_model.freezed.dart';
part 'get_pending_friends_model.g.dart';

@freezed
abstract class FriendRequestModel with _$FriendRequestModel {
  factory FriendRequestModel({
    required String id,
    required String requesterId,
    required String recieverId,
    required DateTime createDate,
    required int requestType,
    required String requesterName,
    required String requesterUserName,
    required String requesterProfilePicture,
    required int requesterAge,
    required String requesterGender,
  }) = _FriendRequestModel;

  factory FriendRequestModel.fromJson(Map<String, dynamic> json) =>
      _$FriendRequestModelFromJson(json);
}

@freezed
abstract class GetPendingFriendsModel with _$GetPendingFriendsModel {
  factory GetPendingFriendsModel({
    required List<FriendRequestModel> data,
  }) = _GetPendingFriendsModel;

  factory GetPendingFriendsModel.fromJson(Map<String, dynamic> json) =>
      _$GetPendingFriendsModelFromJson(json);
}
