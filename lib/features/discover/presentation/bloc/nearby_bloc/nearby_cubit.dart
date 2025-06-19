import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/param/pagination_param.dart';
import 'package:zheeta/features/discover/data/model/nearby_model.dart';
import 'package:zheeta/features/discover/data/model/nearby_settings_model.dart';
import 'package:zheeta/features/discover/data/request/nearby_update_request.dart';
import 'package:zheeta/features/discover/domain/usecase/ref/nearby_profiles_usecase.dart';
import 'package:zheeta/features/discover/domain/usecase/ref/nearby_settings_usecase.dart';
import 'package:zheeta/features/discover/domain/usecase/ref/nearby_update_usecase.dart';

part 'nearby_state.dart';

@prod
@LazySingleton()
class NearbyCubit extends Cubit<NearbyState> {
  final GetNearbyProfiles getNearbyProfiles;
  final GetNearbySettings getNearbySettings;
  final UpdateNearbySettings updateNearbySettings;

  NearbyCubit({
    required this.getNearbyProfiles,
    required this.getNearbySettings,
    required this.updateNearbySettings,
  }) : super(const NearbyState());

  Future<void> fetchNearbyProfilesCubit(PaginationParam param) async {
    final result = await getNearbyProfiles(param);
    result.fold(
      (failure) {
        emit(state.copyWith(
          status: NearbyStatus.error,
          errorMessage: failure.message, // Update error message
        ));
      },
      (success) {
        emit(state.copyWith(
          status: NearbyStatus.success,
          nearbyProfiles: success,
        ));
      },
    );
  }

  Future<void> fetchNearbySettingsCubit({required String userId}) async {
    final result = await getNearbySettings(userId);
    result.fold(
      (failure) => emit(state.copyWith(
        status: NearbyStatus.error,
        errorMessage: failure.message, // Handle error message
      )),
      (success) => emit(state.copyWith(
        status: NearbyStatus.settingsLoaded,
        settingsData: success,
        nearbyProfiles: state.nearbyProfiles,
      )),
    );
  }

  Future<void> updateNearbySettingsCubit(NearbyUpdateRequest request) async {
    emit(state.copyWith(status: NearbyStatus.loading));
    final result = await updateNearbySettings(request);

    result.fold(
      (failure) {
        emit(state.copyWith(
          status: NearbyStatus.error,
        ));
      },
      (_) {
        emit(state.copyWith(
          status: NearbyStatus.settingsUpdated,
          nearbyProfiles: state.nearbyProfiles,
          settingsData: state.settingsData,
        ));
      },
    );
  }
}
