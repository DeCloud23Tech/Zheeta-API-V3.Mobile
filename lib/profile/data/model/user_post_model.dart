import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_post_model.freezed.dart';

part 'user_post_model.g.dart';

@freezed
class UserPostModel with _$UserPostModel {
  factory UserPostModel({
    dynamic mediaCollectionURL,
  }) = _UserPostModel;

  factory UserPostModel.fromJson(Map<String, dynamic> json) =>
      _$UserPostModelFromJson(json);
}

@freezed
class UserPostListModel with _$UserPostListModel {
  factory UserPostListModel({
    required List<UserPostModel> data,
  }) = _UserPostListModel;

  factory UserPostListModel.fromJson(Map<String, dynamic> json) =>
      _$UserPostListModelFromJson(json);
}
