part of 'gift_cubit.dart';

enum GiftsStatus { initial, loading, success, error }

class GiftState extends Equatable {
  final GiftsStatus status;
  final List<GiftModel> gifts;
  final List<ReceivedGiftModel> receivedGifts;
  final List<SentGiftModel> sentGifts;
  final int currentPage;
  final bool isFetching;
  final bool hasReachedMax;
  final String errorMessage;

  const GiftState({
    this.status = GiftsStatus.initial,
    this.gifts = const [],
    this.receivedGifts = const [],
    this.sentGifts = const [],
    this.currentPage = 0,
    this.isFetching = false,
    this.hasReachedMax = false,
    this.errorMessage = '',
  });

  GiftState copyWith({
    GiftsStatus? status,
    List<GiftModel>? gifts,
    List<ReceivedGiftModel>? receivedGifts,
    List<SentGiftModel>? sentGifts,
    int? currentPage,
    bool? isFetching,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return GiftState(
      status: status ?? this.status,
      gifts: gifts ?? this.gifts,
      receivedGifts: receivedGifts ?? this.receivedGifts,
      sentGifts: sentGifts ?? this.sentGifts,
      currentPage: currentPage ?? this.currentPage,
      isFetching: isFetching ?? this.isFetching,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
    status,
    gifts,
    receivedGifts,
    sentGifts,
    currentPage,
    isFetching,
    hasReachedMax,
    errorMessage,
  ];
}
