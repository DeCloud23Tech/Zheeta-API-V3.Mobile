part of 'nearby_cubit.dart';

enum NearbyStatus { loading, success, error, settingsLoaded }

class NearbyState extends Equatable {
  final NearbyStatus status;
  final List<NearbyDataModel> nearbyProfiles;
  final NearbySettingsDataModel? settingsData;
  final String? errorMessage;
  final bool isFetching;
  final int currentPage;
  final bool hasReachedMax;

  const NearbyState({
    this.status = NearbyStatus.loading,
    this.nearbyProfiles = const [],
    this.settingsData,
    this.errorMessage,
    this.isFetching = false,
    this.currentPage = 1,
    this.hasReachedMax = false,
  });

  NearbyState copyWith({
    NearbyStatus? status,
    List<NearbyDataModel>? nearbyProfiles,
    NearbySettingsDataModel? settingsData,
    String? errorMessage,
    bool? isFetching,
    int? currentPage,
    bool? hasReachedMax,
  }) {
    return NearbyState(
      status: status ?? this.status,
      nearbyProfiles: nearbyProfiles ?? this.nearbyProfiles,
      settingsData: settingsData ?? this.settingsData,
      errorMessage: errorMessage ?? this.errorMessage,
      isFetching: isFetching ?? this.isFetching,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [status, nearbyProfiles, settingsData, errorMessage, isFetching, currentPage, hasReachedMax];
}
