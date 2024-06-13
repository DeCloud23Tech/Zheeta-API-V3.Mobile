import 'package:zheeta/gifts/data/model/gift_model.dart';
import 'package:zheeta/gifts/data/model/gift_response_model.dart';
import 'package:zheeta/gifts/data/model/received_gift_model.dart';
import 'package:zheeta/gifts/data/model/sent_gift_model.dart';
import 'package:zheeta/gifts/data/request/send_gift_request_model.dart';

abstract class GiftDataSource {
  Future<GiftListModel> getAllGifts(int page);

  Future<GiftModel> getGiftById(String id);

  Future<GiftResponseModel> redeemGiftById(String giftId);

  Future<ReceivedGiftListModel> getAllReceivedGifts(int page);

  Future<SentGiftListModel> getAllSentGifts(int page);

  Future<GiftResponseModel> sendGift(SendGiftRequestModel request);
}
