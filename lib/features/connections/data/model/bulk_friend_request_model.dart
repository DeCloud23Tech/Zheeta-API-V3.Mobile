import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zheeta/common/enums/type_of_request.dart';

part 'bulk_friend_request_model.freezed.dart';
part 'bulk_friend_request_model.g.dart';

@freezed
class BulkFriendRequestModel with _$BulkFriendRequestModel {
  factory BulkFriendRequestModel({
    required String recieverId,
    required int typeOfRequest,
  }) = _BulkFriendRequestModel;

  factory BulkFriendRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BulkFriendRequestModelFromJson(json);
}
