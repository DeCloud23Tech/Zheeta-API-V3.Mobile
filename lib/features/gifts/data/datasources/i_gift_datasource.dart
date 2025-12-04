import 'package:zheeta/features/gifts/data/models/gift_model.dart';
import 'package:zheeta/features/gifts/data/models/gift_response_model.dart';
import 'package:zheeta/features/gifts/data/models/received_gift_model.dart';
import 'package:zheeta/features/gifts/data/models/sent_gift_model.dart';
import 'package:zheeta/features/gifts/data/requests/send_gift_request_model.dart';

abstract class IGiftDataSource {
  Future<List<GiftModel>> getAllGifts(
      {required int pageNumber, required int pageSize});

  Future<GiftModel> getGiftById(String id);

  Future<void> redeemGift(String giftId);

  Future<GiftResponseModel> deliverGift(String giftId);

  Future<List<ReceivedGiftModel>> getAllReceivedGifts(
      {required int pageNumber, required int pageSize});

  Future<List<SentGiftModel>> getAllSentGifts(
      {required int pageNumber, required int pageSize});

  Future<void> sendGift(SendGiftRequestModel request);
}
