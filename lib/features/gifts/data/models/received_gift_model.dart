import 'package:freezed_annotation/freezed_annotation.dart';

part 'received_gift_model.freezed.dart';
part 'received_gift_model.g.dart';

@freezed
abstract class ReceivedGiftModel with _$ReceivedGiftModel {
  factory ReceivedGiftModel({
    required String id,
    required String giftId,
    required String title,
    required String imageFileURL,
    required int totalQuantity,
    required double totalAmount,
    required String senderId,
    required String? senderUserName,
    required String receiverId,
    required String? receiverUserName,
    required bool isRedeemed,
    required DateTime createdDate,
  }) = _ReceivedGiftModel;

  factory ReceivedGiftModel.fromJson(Map<String, dynamic> json) =>
      _$ReceivedGiftModelFromJson(json);
}
