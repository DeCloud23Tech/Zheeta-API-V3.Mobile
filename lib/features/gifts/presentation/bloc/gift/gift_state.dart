part of 'gift_cubit.dart';

enum GiftsStatus { initial, loading, success, error, sentGift, redeemedGift }

class GiftState extends Equatable {
  final GiftsStatus status;
  final List<GiftModel> gifts;
  final List<ReceivedGiftModel> receivedGifts;
  final List<SentGiftModel> sentGifts;
  final String? errorMessage;

  const GiftState({
    this.status = GiftsStatus.initial,
    this.gifts = const [],
    this.receivedGifts = const [],
    this.sentGifts = const [],
    this.errorMessage,
  });

  GiftState copyWith({
    GiftsStatus? status,
    List<GiftModel>? gifts,
    List<ReceivedGiftModel>? receivedGifts,
    List<SentGiftModel>? sentGifts,
    String? errorMessage,
  }) {
    return GiftState(
      status: status ?? this.status,
      gifts: gifts ?? this.gifts,
      receivedGifts: receivedGifts ?? this.receivedGifts,
      sentGifts: sentGifts ?? this.sentGifts,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    gifts,
    receivedGifts,
    sentGifts,
    errorMessage,
  ];
}
