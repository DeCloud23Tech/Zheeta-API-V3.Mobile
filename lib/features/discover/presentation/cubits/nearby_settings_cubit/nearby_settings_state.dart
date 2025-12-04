part of 'nearby_settings_cubit.dart';

@immutable
class NearbySettingsState extends Equatable {
  final bool isLoading;
  final bool isUpdating;
  final NearbySettingsModel? settings;
  final String? errorMessage;

  const NearbySettingsState({
    this.isLoading = false,
    this.isUpdating = false,
    this.settings,
    this.errorMessage,
  });

  NearbySettingsState copyWith({
    bool? isLoading,
    bool? isUpdating,
    NearbySettingsModel? settings,
    String? errorMessage,
  }) {
    return NearbySettingsState(
      isLoading: isLoading ?? this.isLoading,
      isUpdating: isUpdating ?? this.isUpdating,
      settings: settings ?? this.settings,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, isUpdating, settings, errorMessage];
}
