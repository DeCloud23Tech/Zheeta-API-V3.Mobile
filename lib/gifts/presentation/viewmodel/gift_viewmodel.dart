import 'package:injectable/injectable.dart';
import 'package:zheeta/gifts/presentation/bloc/gift/gift_cubit.dart';

import '../../../app/router/app_router.dart';
import '../../../app/router/app_router.gr.dart';
import '../../data/request/send_gift_request_model.dart';

@prod
@LazySingleton()
class GiftViewModel {
  final GiftCubit _giftCubit;

  GiftViewModel(this._giftCubit);

  GiftState get state => _giftCubit.state;

  Stream<GiftState> get stateStream => _giftCubit.stream;

  void fetchAllGifts() {
    _giftCubit.getAllGiftsCubit();
  }

  void searchGifts(String query) {
    // _giftCubit.searchGifts(query);
  }

  void fetchNextPage() {
    _giftCubit.fetchNextPage();
  }

  void fetchAllReceivedGifts() {
    _giftCubit.getAllReceivedGiftsCubit();
  }

  void fetchNextReceivedPage() {
    _giftCubit.fetchNextReceivedPage();
  }

  void resetReceivedGiftsPage() {
    _giftCubit.resetCurrentReceivedPage();
  }

  void fetchAllSentGifts() {
    _giftCubit.getAllSentGiftsCubit();
  }

  void fetchNextSentPage() {
    _giftCubit.fetchNextSentPage();
  }

  void resetSentGiftsPage() {
    _giftCubit.resetCurrentSentPage();
  }

  void sendGift(SendGiftRequestModel request) {
    _giftCubit.sendGiftCubit(request);

    router.popAndPush(GiftSuccessRoute());
  }

  void redeemGift(String giftId) {
    _giftCubit.redeemGiftCubit(giftId);
  }
}
