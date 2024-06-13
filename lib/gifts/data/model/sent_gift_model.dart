import 'package:freezed_annotation/freezed_annotation.dart';

part 'sent_gift_model.freezed.dart';
part 'sent_gift_model.g.dart';

@freezed
class SentGiftModel with _$SentGiftModel {
  factory SentGiftModel({
    required String id,
    required String giftId,
    required String title,
    required String imageFileURL,
    required int totalQuantity,
    required double totalAmount,
    required String senderId,
    required String senderUserName,
    required String receiverId,
    required String receiverUserName,
    required bool isRedeemed,
    required DateTime createdDate,
  }) = _SentGiftModel;

  factory SentGiftModel.fromJson(Map<String, dynamic> json) => _$SentGiftModelFromJson(json);
}

@freezed
class SentGiftListModel with _$SentGiftListModel {
  factory SentGiftListModel({
    required List<SentGiftModel> data,
  }) = _SentGiftListModel;

  factory SentGiftListModel.fromJson(Map<String, dynamic> json) => _$SentGiftListModelFromJson(json);
}
