part of 'gift_cubit.dart';

enum GiftsStatus { initial, loading, success, error, sentGift, redeemedGift }

class GiftState extends Equatable {
  final GiftsStatus status;
  final List<GiftModel> gifts;
  final List<ReceivedGiftModel> receivedGifts;
  final List<SentGiftModel> sentGifts;

  const GiftState({
    this.status = GiftsStatus.initial,
    this.gifts = const [],
    this.receivedGifts = const [],
    this.sentGifts = const [],
  });

  GiftState copyWith({
    GiftsStatus? status,
    List<GiftModel>? gifts,
    List<ReceivedGiftModel>? receivedGifts,
    List<SentGiftModel>? sentGifts,
  }) {
    return GiftState(
      status: status ?? this.status,
      gifts: gifts ?? this.gifts,
      receivedGifts: receivedGifts ?? this.receivedGifts,
      sentGifts: sentGifts ?? this.sentGifts,
    );
  }

  @override
  List<Object> get props => [
        status,
        gifts,
        receivedGifts,
        sentGifts,
      ];
}
