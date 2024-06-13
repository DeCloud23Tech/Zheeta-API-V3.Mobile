import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/gifts/data/model/gift_model.dart';
import 'package:zheeta/gifts/domain/usecase/get_gifts_usecase.dart';

import '../../../data/model/gift_response_model.dart';
import '../../../data/model/received_gift_model.dart';
import '../../../data/model/sent_gift_model.dart';
import '../../../data/request/send_gift_request_model.dart';
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
  final RedeemGiftById redeemGiftById;
  final SendGiftUseCase sendGiftUseCase;
  final GetAllSentGifts getAllSentGifts;
  int _currentPage = 1;
  int _currentReceivedPage = 1;
  int _currentSentPage = 1;
  List<GiftModel> _allGifts = [];
  List<ReceivedGiftModel> _allReceivedGifts = [];
  List<SentGiftModel> _allSentGifts = [];

  GiftCubit({
    required this.getAllGifts,
    required this.getAllReceivedGifts,
    required this.redeemGiftById,
    required this.sendGiftUseCase,
    required this.getAllSentGifts,
  }) : super(GiftInitial());

  Future<GiftListModel?> getAllGiftsCubit({int page = 1}) async {
    resetCurrentPage(); // Reset before fetching all gifts
    emit(GiftsLoading());
    var result = await getAllGifts(page);
    GiftListModel? data;
    result.fold(
      (fail) {
        emit(GiftsError(fail.message));
      },
      (success) {
        _allGifts = success.data;
        emit(GiftsSuccess(success));
        data = success;
      },
    );
    return data;
  }

  void fetchNextPage() async {
    if (state is GiftsSuccess) {
      try {
        _currentPage++;
        final result = await getAllGifts(_currentPage);
        final currentData = (state as GiftsSuccess).gifts;
        result.fold(
          (fail) {
            _currentPage--;
            emit(GiftsError(fail.message));
          },
          (success) {
            _allGifts = currentData.data + success.data;
            emit(GiftsSuccess(GiftListModel(data: _allGifts)));
          },
        );
      } catch (e) {
        _currentPage--;
        emit(GiftsError(e.toString()));
      }
    }
  }

  void resetCurrentPage() {
    _currentPage = 1;
    _allGifts = List.from(_allGifts); // Ensure it's a mutable list
    _allGifts.clear(); // Now it's safe to clear
    emit(GiftInitial()); // Optionally emit initial state or any other state
  }


  void searchGifts(String query) async {
    emit(GiftsLoading());
    var result = await getAllGifts(1);
    result.fold(
      (fail) {
        emit(GiftsError(fail.message));
      },
      (success) {
        final filteredGifts = success.data
            .where((gift) =>
                gift.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
        emit(GiftsSuccess(GiftListModel(data: filteredGifts)));
      },
    );
  }

  Future<ReceivedGiftListModel?> getAllReceivedGiftsCubit(
      {int page = 1}) async {
    resetCurrentReceivedPage(); // Reset before fetching all received gifts
    emit(GiftsLoading());
    var result = await getAllReceivedGifts(page);
    ReceivedGiftListModel? data;
    result.fold(
      (fail) {
        emit(GiftsError(fail.message));
      },
      (success) {
        _allReceivedGifts = success.data;
        emit(ReceivedGiftsSuccess(success));
        data = success;
      },
    );
    return data;
  }

  void fetchNextReceivedPage() async {
    if (state is ReceivedGiftsSuccess) {
      try {
        _currentReceivedPage++;
        final result = await getAllReceivedGifts(_currentReceivedPage);
        final currentData = (state as ReceivedGiftsSuccess).gifts;
        result.fold(
          (fail) {
            _currentReceivedPage--;
            emit(GiftsError(fail.message));
          },
          (success) {
            _allReceivedGifts = currentData.data + success.data;
            emit(ReceivedGiftsSuccess(
                ReceivedGiftListModel(data: _allReceivedGifts)));
          },
        );
      } catch (e) {
        _currentReceivedPage--;
        emit(GiftsError(e.toString()));
      }
    }
  }

  void resetCurrentReceivedPage() {
    _currentReceivedPage = 1;
    _allReceivedGifts = List.from(_allReceivedGifts); // Ensure it's a mutable list
    _allReceivedGifts.clear(); // Now it's safe to clear
    emit(GiftInitial()); // Optionally emit initial state or any other state
  }


  Future<SentGiftListModel?> getAllSentGiftsCubit({int page = 1}) async {
    resetCurrentSentPage(); // Reset before fetching all sent gifts
    emit(GiftsLoading());
    var result = await getAllSentGifts(page);
    SentGiftListModel? data;
    result.fold(
      (fail) {
        emit(GiftsError(fail.message));
      },
      (success) {
        _allSentGifts = success.data;
        emit(SentGiftsSuccess(success));
        data = success;
      },
    );
    return data;
  }

  void fetchNextSentPage() async {
    if (state is SentGiftsSuccess) {
      try {
        _currentSentPage++;
        final result = await getAllSentGifts(_currentSentPage);
        final currentData = (state as SentGiftsSuccess).gifts;
        result.fold(
          (fail) {
            _currentSentPage--;
            emit(GiftsError(fail.message));
          },
          (success) {
            _allSentGifts = currentData.data + success.data;
            emit(SentGiftsSuccess(SentGiftListModel(data: _allSentGifts)));
          },
        );
      } catch (e) {
        _currentSentPage--;
        emit(GiftsError(e.toString()));
      }
    }
  }

  void resetCurrentSentPage() {
    _currentSentPage = 1;
    _allSentGifts = List.from(_allSentGifts); // Ensure it's a mutable list
    _allSentGifts.clear(); // Now it's safe to clear
    emit(GiftInitial()); // Optionally emit initial state or any other state
  }


  Future<void> redeemGiftCubit(String giftId) async {
    emit(GiftsLoading());
    var result = await redeemGiftById(giftId);
    result.fold(
      (fail) {
        emit(GiftsError(fail.message));
      },
      (success) {
        emit(GiftRedeemed(success));
      },
    );
  }

  Future<void> sendGiftCubit(SendGiftRequestModel request) async {
    emit(GiftsLoading());
    var result = await sendGiftUseCase(request);
    result.fold(
      (fail) {
        emit(GiftsError(fail.message));
      },
      (success) {
        emit(GiftSent(success));
      },
    );
  }
}
