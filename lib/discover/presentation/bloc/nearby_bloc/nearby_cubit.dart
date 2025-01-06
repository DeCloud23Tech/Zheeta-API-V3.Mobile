import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/common/param/pagination_param.dart';
import '../../../../discover/data/model/nearby_model.dart';
import '../../../../discover/domain/usecase/ref/nearby_profiles_usecase.dart';
import '../../../../discover/domain/usecase/ref/nearby_settings_usecase.dart';
import '../../../data/model/nearby_settings_model.dart';

part 'nearby_state.dart';

@prod
@LazySingleton()
class NearbyCubit extends Cubit<NearbyState> {
  final GetNearbyProfiles getNearbyProfiles;
  final GetNearbySettings getNearbySettings;

  NearbyCubit({
    required this.getNearbyProfiles,
    required this.getNearbySettings,
  }) : super(const NearbyState());

  Future<void> fetchNearbyProfiles(PaginationParam param) async {
    emit(state.copyWith(status: NearbyStatus.loading));
    final result = await getNearbyProfiles(param);
    result.fold(
      (failure) {
        emit(state.copyWith(
          status: NearbyStatus.error,
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

  Future<void> fetchNearbySettings() async {
    var result = await getNearbySettings();
    result.fold(
      (fail) => emit(state.copyWith(
        status: NearbyStatus.error,
      )),
      (success) => emit(state.copyWith(
        status: NearbyStatus.settingsLoaded,
        settingsData: success.data,
      )),
    );
  }
}
