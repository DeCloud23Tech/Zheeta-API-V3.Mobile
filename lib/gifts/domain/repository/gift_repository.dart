import '../../../app/common/type_def.dart';
import '../../data/model/gift_model.dart';
import '../../data/model/received_gift_model.dart';
import '../../data/model/gift_response_model.dart';
import '../../data/model/sent_gift_model.dart';
import '../../data/request/send_gift_request_model.dart';


abstract class GiftRepository {
  ResultFuture<GiftListModel> getAllGifts(int page);
  ResultFuture<GiftModel> getGiftById(String id);
  ResultFuture<GiftResponseModel> redeemGiftById(String giftId);
  ResultFuture<ReceivedGiftListModel> getAllReceivedGifts(int page);
  ResultFuture<SentGiftListModel> getAllSentGifts(int page);
  ResultFuture<GiftResponseModel> sendGift(SendGiftRequestModel request);
}
