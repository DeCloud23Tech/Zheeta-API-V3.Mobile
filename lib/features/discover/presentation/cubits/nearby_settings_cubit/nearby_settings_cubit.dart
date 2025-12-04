import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/discover/data/models/nearby_settings_model.dart';
import 'package:zheeta/features/discover/data/requests/nearby_update_request.dart';
import 'package:zheeta/features/discover/domain/usecases/nearby_settings_usecase.dart';
import 'package:zheeta/features/discover/domain/usecases/nearby_update_usecase.dart';

part 'nearby_settings_state.dart';

@prod
@injectable
class NearbySettingsCubit extends Cubit<NearbySettingsState> {
  final GetNearbySettings _getNearbySettings;
  final UpdateNearbySettings _updateNearbySettings;

  NearbySettingsCubit(
    this._getNearbySettings,
    this._updateNearbySettings,
  ) : super(const NearbySettingsState());

  /// Load nearby settings
  Future<void> loadSettings(String userId) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _getNearbySettings(userId);
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (settings) => emit(state.copyWith(isLoading: false, settings: settings)),
    );
  }

  /// Update nearby settings
  Future<void> updateSettings(NearbyUpdateRequest request) async {
    emit(state.copyWith(isUpdating: true, errorMessage: null));
    final result = await _updateNearbySettings(request);
    result.fold(
      (failure) => emit(
          state.copyWith(isUpdating: false, errorMessage: failure.message)),
      (_) async {
        // reload settings after update
        await loadSettings(request.userId);
        // no extra emit here, loadSettings will handle it
      },
    );
  }
}
