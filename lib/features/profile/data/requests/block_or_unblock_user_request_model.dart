import 'package:freezed_annotation/freezed_annotation.dart';

part 'block_or_unblock_user_request_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class BlockOrUnblockUserRequest {
  String userId;
  String blockOrUnblockUserId;

  BlockOrUnblockUserRequest({
    required this.userId,
    required this.blockOrUnblockUserId,
  });

  factory BlockOrUnblockUserRequest.fromJson(Map<String, dynamic> json) =>
      _$BlockOrUnblockUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BlockOrUnblockUserRequestToJson(this);
}
