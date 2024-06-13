part of 'gift_cubit.dart';

abstract class GiftState extends Equatable {
  const GiftState();
}

class GiftInitial extends GiftState {
  @override
  List<Object> get props => [];
}

class GiftsLoading extends GiftState {
  @override
  List<Object> get props => [];
}

class GiftsError extends GiftState {
  final String errorMessage;

  const GiftsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class GiftsSuccess extends GiftState {
  final GiftListModel gifts;

  const GiftsSuccess(this.gifts);

  @override
  List<Object> get props => [gifts];
}

class ReceivedGiftsSuccess extends GiftState {
  final ReceivedGiftListModel gifts;

  const ReceivedGiftsSuccess(this.gifts);

  @override
  List<Object> get props => [gifts];
}

class GiftRedeemed extends GiftState {
  final GiftResponseModel response;

  const GiftRedeemed(this.response);

  @override
  List<Object> get props => [response];
}

class GiftSent extends GiftState {
  final GiftResponseModel response;

  const GiftSent(this.response);

  @override
  List<Object> get props => [response];
}

class SentGiftsSuccess extends GiftState {
  final SentGiftListModel gifts;

  const SentGiftsSuccess(this.gifts);

  @override
  List<Object> get props => [gifts];
}
