import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/gifts/data/model/gift_model.dart';
import 'package:zheeta/gifts/domain/usecase/get_gifts_usecase.dart';
import '../../../../app/common/param/pagination_param.dart';
import '../../../data/model/received_gift_model.dart';
import '../../../data/model/sent_gift_model.dart';
import '../../../domain/usecase/deliver_gift_usecase.dart';
import '../../../domain/usecase/received_gift_usecase.dart';
import '../../../domain/usecase/redeem_gift_usecase.dart';
import '../../../domain/usecase/send_gift_usecase.dart';
import '../../../domain/usecase/sent_gift_usecase.dart';

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

  static const _pageSize = 20;

  GiftCubit({
    required this.getAllGifts,
    required this.getAllReceivedGifts,
    required this.redeemGift,
    required this.deliverGift,
    required this.sendGiftUseCase,
    required this.getAllSentGifts,
  }) : super(GiftState());

  void reset() {
    emit(const GiftState());
  }

  Future<void> fetchGifts() async {
    if (state.isFetching || (state.hasReachedMax)) {
      print('Request already in progress or max pages reached.');
      return;
    }

    emit(state.copyWith(isFetching: true));

    try {
      final pageNo = state.currentPage + 1;
      final result = await getAllGifts(
        PaginationParam(pageNo: pageNo, pageSize: _pageSize),
      );
      result.fold(
        (fail) {
          emit(
            state.copyWith(
              status: GiftsStatus.error,
              errorMessage: fail.message,
              isFetching: false,
            ),
          );
        },
        (success) {
          emit(
            state.copyWith(
              status: GiftsStatus.success,
              gifts: List.of(state.gifts)..addAll(success),
              currentPage: pageNo,
              isFetching: false,
              hasReachedMax: success.isEmpty,
            ),
          );
        },
      );
    } catch (e) {
      print('Error fetching gifts: $e');
      emit(state.copyWith(status: GiftsStatus.error, isFetching: false));
    }
  }

  Future<void> fetchReceivedGifts() async {
    if (state.isFetching || state.hasReachedMax) {
      print('Request already in progress or max pages reached.');
      return;
    }

    emit(state.copyWith(isFetching: true));

    try {
      final pageNo = state.currentPage + 1;
      final result = await getAllReceivedGifts(
        PaginationParam(pageNo: pageNo, pageSize: _pageSize),
      );
      result.fold(
        (fail) {
          emit(
            state.copyWith(
              status: GiftsStatus.error,
              errorMessage: fail.message,
              isFetching: false,
            ),
          );
        },
        (success) {
          emit(
            state.copyWith(
              status: GiftsStatus.success,
              receivedGifts: List.of(state.receivedGifts)..addAll(success),
              currentPage: pageNo,
              isFetching: false,
              hasReachedMax: success.isEmpty,
            ),
          );
        },
      );
    } catch (e) {
      print('Error fetching received gifts: $e');
      emit(state.copyWith(status: GiftsStatus.error, isFetching: false));
    }
  }

  Future<void> fetchSentGifts() async {
    if (state.isFetching || state.hasReachedMax) {
      print('Request already in progress or max pages reached.');
      return;
    }

    emit(state.copyWith(isFetching: true));

    try {
      final pageNo = state.currentPage + 1;
      final result = await getAllSentGifts(
        PaginationParam(pageNo: pageNo, pageSize: _pageSize),
      );
      result.fold(
        (fail) {
          emit(
            state.copyWith(
              status: GiftsStatus.error,
              errorMessage: fail.message,
              isFetching: false,
            ),
          );
        },
        (success) {
          emit(
            state.copyWith(
              status: GiftsStatus.success,
              sentGifts: List.of(state.sentGifts)..addAll(success),
              currentPage: pageNo,
              isFetching: false,
              hasReachedMax: success.isEmpty,
            ),
          );
        },
      );
    } catch (e) {
      print('Error fetching sent gifts: $e');
      emit(state.copyWith(status: GiftsStatus.error, isFetching: false));
    }
  }

// Future<void> redeemGiftCubit(String giftId) async {
//   emit(state.copyWith(isFetching: true));
//   var result = await redeemGift(giftId);
//   result.fold(
//         (fail) {
//       emit(GiftState(errorMessage: fail.message));
//     },
//         (success) {
//       emit(GiftState(status: GiftsStatus.redeemed, redeemedGift: success));
//     },
//   );
// }

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

// Future<void> sendGiftCubit(SendGiftRequestModel request) async {
//   emit(state.copyWith(isFetching: true));
//   var result = await sendGiftUseCase(request);
//   result.fold(
//         (fail) {
//       emit(GiftState(errorMessage: fail.message));
//     },
//         (success) {
//       emit(GiftState(status: GiftsStatus.sent, sentGift: success));
//     },
//   );
// }
}
