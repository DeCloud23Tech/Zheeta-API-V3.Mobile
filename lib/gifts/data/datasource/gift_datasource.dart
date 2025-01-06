import 'package:zheeta/gifts/data/model/gift_model.dart';
import 'package:zheeta/gifts/data/model/gift_response_model.dart';
import 'package:zheeta/gifts/data/model/received_gift_model.dart';
import 'package:zheeta/gifts/data/model/sent_gift_model.dart';
import 'package:zheeta/gifts/data/request/send_gift_request_model.dart';

abstract class GiftDataSource {
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
