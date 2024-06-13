import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_gift_request_model.freezed.dart';

part 'send_gift_request_model.g.dart';

@freezed
class SendGiftRequestModel with _$SendGiftRequestModel {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
  factory SendGiftRequestModel({
    required String giftId,
    required int totalQuantity,
    required String receiverUsername,
    String? message,
  }) = _SendGiftRequestModel;

  factory SendGiftRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SendGiftRequestModelFromJson(json);
}
