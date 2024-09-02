// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:injectable/injectable.dart';
// import 'package:zheeta/gifts/data/model/gift_model.dart';
// import 'package:zheeta/gifts/domain/usecase/get_gifts_usecase.dart';
//
// import '../../../../app/common/param/pagination_param.dart';
// import '../../../data/model/gift_response_model.dart';
// import '../../../data/model/received_gift_model.dart';
// import '../../../data/model/sent_gift_model.dart';
// import '../../../data/request/send_gift_request_model.dart';
// import '../../../domain/usecase/deliver_gift_usecase.dart';
// import '../../../domain/usecase/received_gift_usecase.dart';
// import '../../../domain/usecase/redeem_gift_usecase.dart';
// import '../../../domain/usecase/send_gift_usecase.dart';
// import '../../../domain/usecase/sent_gift_usecase.dart';
//
// part 'gift_state.dart';
//
// @prod
// @LazySingleton()
// class GiftCubit extends Cubit<GiftState> {
//   final GetAllGifts getAllGifts;
//   final GetAllReceivedGifts getAllReceivedGifts;
//   final RedeemGift redeemGift;
//   final DeliverGift deliverGift;
//   final SendGiftUseCase sendGiftUseCase;
//   final GetAllSentGifts getAllSentGifts;
//
//
//
//   GiftCubit({
//     required this.getAllGifts,
//     required this.getAllReceivedGifts,
//     required this.redeemGift,
//     required this.deliverGift,
//     required this.sendGiftUseCase,
//     required this.getAllSentGifts,
//   }) : super(GiftInitial());
//
//   Future<void> fetchGifts({bool isRefresh = false}) async {
//
//     emit(GiftsLoading());
//
//     var result =
//         await getAllGifts(PaginationParam(pageNo: currentPage, pageSize: 10));
//     result.fold(
//       (fail) {
//         emit(GiftsError(fail.message));
//       },
//       (success) {
//         ));
//
//
//       },
//     );
//   }
//
//   Future<void> fetchReceivedGifts({bool isRefresh = false}) async {
//
//     emit(GiftsLoading());
//
//     var result = await getAllReceivedGifts(
//         PaginationParam(pageNo: currentPage, pageSize: 10));
//     result.fold(
//       (fail) {
//         emit(GiftsError(fail.message));
//       },
//       (success) {
//
//
//
//       },
//     );
//   }
//
//   Future<void> fetchSentGifts({bool isRefresh = false}) async {
//     emit(GiftsLoading());
//
//     var result = await getAllSentGifts(
//         PaginationParam(pageNo: currentPage, pageSize: 10));
//     result.fold(
//       (fail) {
//         emit(GiftsError(fail.message));
//       },
//       (success) {
//
//
//     );
//   }
//
//   Future<void> redeemGiftCubit(String giftId) async {
//     emit(GiftsLoading());
//     var result = await redeemGift(giftId);
//     result.fold(
//       (fail) {
//         emit(GiftsError(fail.message));
//       },
//       (success) {
//         emit(GiftRedeemed(success));
//       },
//     );
//   }
//
//
//   Future<void> deliverGiftCubit(String giftId) async {
//     emit(GiftsLoading());
//     var result = await deliverGift(giftId);
//     result.fold(
//           (fail) {
//         emit(GiftsError(fail.message));
//       },
//           (success) {
//         emit(GiftRedeemed(success));
//       },
//     );
//   }
//
//   Future<void> sendGiftCubit(SendGiftRequestModel request) async {
//     emit(GiftsLoading());
//     var result = await sendGiftUseCase(request);
//     print(request);
//     print(result);
//     result.fold(
//       (fail) {
//         emit(GiftsError(fail.message));
//       },
//       (success) {
//
//         print(success);
//         emit(GiftSent(success));
//       },
//     );
//   }
// }
