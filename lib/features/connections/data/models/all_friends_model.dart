// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_friends_model.freezed.dart';
part 'all_friends_model.g.dart';

@freezed
abstract class FriendModel with _$FriendModel {
  factory FriendModel({
    @JsonKey(name: 'userAId', defaultValue: '') required String userId,
    required String friendId,
    required String friendUsername,
    @JsonKey(defaultValue: '') required String friendProfilePicture,
    required bool friendBlockStatus,
  }) = _FriendModel;

  factory FriendModel.fromJson(Map<String, dynamic> json) =>
      _$FriendModelFromJson(json);
}

@freezed
abstract class FriendsListModel with _$FriendsListModel {
  factory FriendsListModel({
    required List<FriendModel> data,
  }) = _FriendsListModel;

  factory FriendsListModel.fromJson(Map<String, dynamic> json) =>
      _$FriendsListModelFromJson(json);
}
