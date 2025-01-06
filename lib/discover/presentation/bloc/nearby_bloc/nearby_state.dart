part of 'nearby_cubit.dart';

enum NearbyStatus { loading, success, error, settingsLoaded }

class NearbyState extends Equatable {
  final NearbyStatus status;
  final NearbyListDataModel nearbyProfiles;
  final NearbySettingsDataModel? settingsData;

  const NearbyState({
    this.status = NearbyStatus.loading,
    this.nearbyProfiles = const NearbyListDataModel(data: []),
    this.settingsData,
  });

  NearbyState copyWith({
    NearbyStatus? status,
    NearbyListDataModel? nearbyProfiles,
    NearbySettingsDataModel? settingsData,
  }) {
    return NearbyState(
      status: status ?? this.status,
      nearbyProfiles: nearbyProfiles ?? this.nearbyProfiles,
      settingsData: settingsData ?? this.settingsData,
    );
  }

  @override
  List<Object?> get props => [
        status,
        nearbyProfiles,
        settingsData,
      ];

  List<NearbyDataModel> get nearbyList => nearbyProfiles.data;
}
