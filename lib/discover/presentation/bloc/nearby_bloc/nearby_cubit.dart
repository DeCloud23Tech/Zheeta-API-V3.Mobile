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

  static const _pageSize = 20;

  NearbyCubit({
    required this.getNearbyProfiles,
    required this.getNearbySettings,
  }) : super(const NearbyState());

  void reset() {
    emit(const NearbyState());
  }

  void resetHasReachedMax() {
    emit(state.copyWith(hasReachedMax: false));
  }


  Future<void> fetchNearbyProfiles({int currentPage = 1}) async {
    if (state.isFetching || state.hasReachedMax) {
      print('Request already in progress or max pages reached.');
      return;
    }

    emit(state.copyWith(isFetching: true));

    try {
      List<NearbyDataModel> nearbyProfiles;

      if (state.status == NearbyStatus.loading) {
        print('Fetching initial page: $currentPage');
        nearbyProfiles = await _fetchNearbyProfiles(currentPage);
        emit(
          state.copyWith(
            status: NearbyStatus.success,
            nearbyProfiles: nearbyProfiles,
            currentPage: currentPage + 1,
            isFetching: false,
          ),
        );
      } else {
        print('Fetching next page: ${state.currentPage}');
        nearbyProfiles = await _fetchNearbyProfiles(state.currentPage);
        emit(
          nearbyProfiles.isEmpty
              ? state.copyWith(hasReachedMax: true, isFetching: false)
              : state.copyWith(
                  status: NearbyStatus.success,
                  nearbyProfiles: List.of(state.nearbyProfiles)
                    ..addAll(nearbyProfiles),
                  currentPage: state.currentPage + 1,
                  isFetching: false,
                ),
        );
      }
    } catch (e) {
      print('Error fetching profiles: $e');
      emit(state.copyWith(status: NearbyStatus.error, isFetching: false));
    }
  }

  Future<List<NearbyDataModel>> _fetchNearbyProfiles(int pageNo) async {
    print('Fetching profiles for page number: $pageNo');
    var result = await getNearbyProfiles(
      PaginationParam(pageNo: pageNo, pageSize: _pageSize),
    );
    return result.fold(
      (fail) => throw Exception('Error fetching nearby profiles'),
      (success) => success,
    );
  }

  Future<void> fetchNearbySettings() async {
    try {
      var result = await getNearbySettings();
      result.fold(
        (fail) => emit(state.copyWith(
          status: NearbyStatus.error,
          errorMessage: fail.message,
        )),
        (success) => emit(state.copyWith(
          status: NearbyStatus.settingsLoaded,
          settingsData: success.data,
        )),
      );
    } catch (e) {
      print('Error fetching settings: $e');
      emit(state.copyWith(status: NearbyStatus.error, isFetching: false));
    }
  }
}
