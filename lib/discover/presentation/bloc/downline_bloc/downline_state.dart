part of 'downline_cubit.dart';

enum DownlineStatus { initial, loading, loaded, error }

class DownlineState extends Equatable {
  final DownlineStatus status;
  final List<UserDownlineModel> downlines;
  final bool hasReachedMax;
  final String? errorMessage;
  final bool isFetching;
  final int currentPage;

  const DownlineState({
    this.status = DownlineStatus.initial,
    this.downlines = const [],
    this.hasReachedMax = false,
    this.errorMessage,
    this.isFetching = false,
    this.currentPage = 1,
  });

  DownlineState copyWith({
    DownlineStatus? status,
    List<UserDownlineModel>? downlines,
    bool? hasReachedMax,
    String? errorMessage,
    bool? isFetching,
    int? currentPage,
  }) {
    return DownlineState(
      status: status ?? this.status,
      downlines: downlines ?? this.downlines,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
      isFetching: isFetching ?? this.isFetching,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object?> get props => [status, downlines, hasReachedMax, errorMessage, isFetching, currentPage];
}
