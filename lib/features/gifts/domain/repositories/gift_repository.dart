import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/gifts/data/models/gift_model.dart';
import 'package:zheeta/features/gifts/data/models/gift_response_model.dart';
import 'package:zheeta/features/gifts/data/models/received_gift_model.dart';
import 'package:zheeta/features/gifts/data/models/sent_gift_model.dart';
import 'package:zheeta/features/gifts/data/requests/send_gift_request_model.dart';

abstract class IGiftRepository {
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
