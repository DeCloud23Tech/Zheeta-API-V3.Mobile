import 'package:freezed_annotation/freezed_annotation.dart';

part 'bulk_friend_request_model.freezed.dart';
part 'bulk_friend_request_model.g.dart';

@freezed
abstract class BulkFriendRequestModel with _$BulkFriendRequestModel {
  factory BulkFriendRequestModel({
    required String recieverId,
    required int typeOfRequest,
  }) = _BulkFriendRequestModel;

  factory BulkFriendRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BulkFriendRequestModelFromJson(json);
}
