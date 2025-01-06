import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/param/pagination_param.dart';
import 'package:zheeta/gifts/data/model/gift_model.dart';
import 'package:zheeta/gifts/data/model/received_gift_model.dart';
import 'package:zheeta/gifts/data/model/sent_gift_model.dart';
import 'package:zheeta/gifts/data/request/send_gift_request_model.dart';
import 'package:zheeta/gifts/domain/usecase/deliver_gift_usecase.dart';
import 'package:zheeta/gifts/domain/usecase/get_gifts_usecase.dart';
import 'package:zheeta/gifts/domain/usecase/received_gift_usecase.dart';
import 'package:zheeta/gifts/domain/usecase/redeem_gift_usecase.dart';
import 'package:zheeta/gifts/domain/usecase/send_gift_usecase.dart';
import 'package:zheeta/gifts/domain/usecase/sent_gift_usecase.dart';

part 'gift_state.dart';

@prod
@LazySingleton()
class GiftCubit extends Cubit<GiftState> {
  final GetAllGifts getAllGifts;
  final GetAllReceivedGifts getAllReceivedGifts;
  final RedeemGift redeemGift;
  final DeliverGift deliverGift;
  final SendGiftUseCase sendGiftUseCase;
  final GetAllSentGifts getAllSentGifts;

  GiftCubit({
    required this.getAllGifts,
    required this.getAllReceivedGifts,
    required this.redeemGift,
    required this.deliverGift,
    required this.sendGiftUseCase,
    required this.getAllSentGifts,
  }) : super(GiftState());

  Future<void> resetGiftCubit() async {
    emit(GiftState()); // Reset to initial state
  }


  Future<void> fetchGifts(PaginationParam request) async {
    emit(state.copyWith(status: GiftsStatus.loading));
    final result = await getAllGifts(request);
    result.fold(
      (fail) {
        emit(
          state.copyWith(status: GiftsStatus.error),
        );
      },
      (success) {
        emit(
          state.copyWith(
            status: GiftsStatus.success,
            gifts: success,
          ),
          //List.of(state.gifts)..addAll(success)),
        );
      },
    );
  }

  Future<void> fetchReceivedGifts(PaginationParam request) async {
    emit(state.copyWith(status: GiftsStatus.loading));
    final result = await getAllReceivedGifts(request);
    result.fold(
      (fail) {
        emit(
          state.copyWith(status: GiftsStatus.error),
        );
      },
      (success) {
        emit(
          state.copyWith(status: GiftsStatus.success, receivedGifts: success),
        );
      },
    );
  }

  Future<void> fetchSentGifts(PaginationParam request) async {
    emit(state.copyWith(status: GiftsStatus.loading));
    final result = await getAllSentGifts(request);
    result.fold(
      (fail) {
        emit(
          state.copyWith(status: GiftsStatus.error),
        );
      },
      (success) {
        emit(
          state.copyWith(status: GiftsStatus.success, sentGifts: success),
        );
      },
    );
  }

  Future<void> redeemGiftCubit(String giftId) async {
    emit(state.copyWith(status: GiftsStatus.loading));
    var result = await redeemGift(giftId);
    result.fold(
      (fail) {
        state.copyWith(status: GiftsStatus.error);
      },
      (success) {
        emit(GiftState(status: GiftsStatus.redeemedGift));
      },
    );
  }

// Future<void> deliverGiftCubit(String giftId) async {
//   emit(state.copyWith(isFetching: true));
//   var result = await deliverGift(giftId);
//   result.fold(
//         (fail) {
//       emit(GiftState(errorMessage: fail.message));
//     },
//         (success) {
//       emit(GiftState(status: GiftsStatus.delivered, deliveredGift: success));
//     },
//   );
// }

  Future<void> sendGiftCubit(SendGiftRequestModel request) async {
    emit(state.copyWith(status: GiftsStatus.loading));
    var result = await sendGiftUseCase(request);
    // print(result);
    result.fold(
      (fail) {
        print(fail);

        state.copyWith(status: GiftsStatus.error);
      },
      (success) {
        print('success');

        emit(GiftState(status: GiftsStatus.sentGift));
      },
    );
  }
}
