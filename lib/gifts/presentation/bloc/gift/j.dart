// part of 'gift_cubit.dart';
//
//
//
// abstract class GiftState extends Equatable {
//   const GiftState();
//
//   @override
//   List<Object?> get props => [];
// }
//
// class GiftInitial extends GiftState {
//   @override
//   List<Object> get props => [];
// }
//
// class GiftsLoading extends GiftState {
//   @override
//   List<Object> get props => [];
// }
//
// class GiftsError extends GiftState {
//   final String errorMessage;
//
//   const GiftsError(this.errorMessage);
//
//   @override
//   List<Object> get props => [errorMessage];
// }
//
// class GiftsSuccess extends GiftState {
//   final List<GiftModel> gifts;
//   final bool hasReachedMax;
//
//   const GiftsSuccess(this.gifts,  this.hasReachedMax);
//
//   @override
//   List<Object> get props => [gifts, hasReachedMax];
// }
//
// class ReceivedGiftsSuccess extends GiftState {
//   final List<ReceivedGiftModel> gifts;
//   final bool hasReachedMax;
//
//   const ReceivedGiftsSuccess(this.gifts,  this.hasReachedMax);
//
//   @override
//   List<Object> get props => [gifts, hasReachedMax];
// }
//
// class GiftRedeemed extends GiftState {
//   final GiftResponseModel response;
//
//   const GiftRedeemed(this.response);
//
//   @override
//   List<Object> get props => [response];
// }
//
// class GiftSent extends GiftState {
//   final GiftResponseModel response;
//
//   const GiftSent(this.response);
//
//   @override
//   List<Object> get props => [response];
// }
//
// class SentGiftsSuccess extends GiftState {
//   final List<SentGiftModel> gifts;
//   final bool hasReachedMax;
//
//   const SentGiftsSuccess(this.gifts,  this.hasReachedMax);
//
//   @override
//   List<Object> get props => [gifts, hasReachedMax];
// }
