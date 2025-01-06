import '../../../app/common/type_def.dart';
import '../../data/model/gift_model.dart';
import '../../data/model/received_gift_model.dart';
import '../../data/model/gift_response_model.dart';
import '../../data/model/sent_gift_model.dart';
import '../../data/request/send_gift_request_model.dart';

abstract class GiftRepository {
  ResultFuture<List<GiftModel>> getAllGifts(
      {required int pageNumber, required int pageSize});

  ResultFuture<GiftModel> getGiftById(String id);

  ResultVoid redeemGift(String giftId);

  ResultFuture<GiftResponseModel> deliverGift(String giftId);

  ResultFuture<List<ReceivedGiftModel>> getAllReceivedGifts(
      {required int pageNumber, required int pageSize});

  ResultFuture<List<SentGiftModel>> getAllSentGifts(
      {required int pageNumber, required int pageSize});

  ResultVoid sendGift(SendGiftRequestModel request);
}
