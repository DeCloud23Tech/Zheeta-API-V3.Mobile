part of 'nearby_cubit.dart';

enum NearbyStatus { loading, success, error, settingsLoaded, settingsUpdated }

class NearbyState extends Equatable {
  final NearbyStatus status;
  final NearbyListDataModel nearbyProfiles;
  final NearbySettingsModel? settingsData;
  final String errorMessage;

  const NearbyState({
    this.status = NearbyStatus.loading,
    this.nearbyProfiles = const NearbyListDataModel(data: []),
    this.settingsData,
    this.errorMessage = '', // Default empty message
  });

  NearbyState copyWith({
    NearbyStatus? status,
    NearbyListDataModel? nearbyProfiles,
    NearbySettingsModel? settingsData,
    String? errorMessage,
  }) {
    return NearbyState(
      status: status ?? this.status,
      nearbyProfiles: nearbyProfiles ?? this.nearbyProfiles,
      settingsData: settingsData ?? this.settingsData,
      errorMessage: errorMessage ?? this.errorMessage, // Copy error message
    );
  }

  @override
  List<Object?> get props => [
    status,
    nearbyProfiles,
    settingsData,
    errorMessage,
  ];

  List<NearbyDataModel> get nearbyList => nearbyProfiles.data;
}
