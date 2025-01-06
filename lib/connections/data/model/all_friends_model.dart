import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_friends_model.freezed.dart';
part 'all_friends_model.g.dart';

@freezed
class FriendModel with _$FriendModel {
  factory FriendModel({
    required String userAId,
    required String friendId,
    required String friendUsername,
    required String friendProfilePicture,
    required bool friendBlockStatus,
  }) = _FriendModel;

  factory FriendModel.fromJson(Map<String, dynamic> json) => _$FriendModelFromJson(json);
}

@freezed
class FriendsListModel with _$FriendsListModel {
  factory FriendsListModel({
    required List<FriendModel> data,
  }) = _FriendsListModel;

  factory FriendsListModel.fromJson(Map<String, dynamic> json) => _$FriendsListModelFromJson(json);
}
