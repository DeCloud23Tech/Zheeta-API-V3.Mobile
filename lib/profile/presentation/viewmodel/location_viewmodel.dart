import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/mixins/location_helper.dart';
import 'package:zheeta/app/common/mixins/validation_helper.dart';
import 'package:zheeta/app/common/notify/notify_user.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';
import 'package:zheeta/profile/domain/usecase/location_usecase.dart';
import 'package:zheeta/profile/presentation/state/location_state.dart';

final locationViewModelProvider = StateNotifierProvider<LocationViewModel, LocationState>((ref) {
  final _locationUseCase = locator<LocationUseCase>();
  return LocationViewModel(_locationUseCase);
});

class LocationViewModel extends StateNotifier<LocationState> with LocationHelperMixin, ValidationHelperMixin {
  final LocationUseCase _locationUseCase;
  LocationViewModel(this._locationUseCase)
      : super(
          LocationState(
            getAddressFromLocationCoordinateState: State.init(),
            getLocationCoordinateFromAddressState: State.init(),
            getCurrentLocationState: State.init(),
          ),
        );

  double? _latitude;
  double? _longitude;

  bool _isValidLatLong() {
    if (_latitude != null && _longitude != null) {
      return true;
    }
    return false;
  }

  Future<bool> getCurrentLocation() async {
    state = state.setGetCurrentLocationState(State.loading());
    try {
      final result = await getLocation();

      if (result != null) {
        _latitude = result.latitude;
        _longitude = result.longitude;

        state = state.setGetCurrentLocationState(State.success(result));
        await getAddressFromLocationCoordinate();
        return true;
      } else {
        state = state.setGetCurrentLocationState(State.error(Exception('Unable to get current location')));
        return false;
      }
    } on Exception catch (e) {
      state = state.setGetCurrentLocationState(State.error(e));
      NotifyUser.showSnackbar(e.toString());
      return false;
    }
  }

  Future<bool> getAddressFromLocationCoordinate() async {
    if (_isValidLatLong()) {
      state = state.setGetAddressFromLocationCoordinateState(State.loading());
      try {
        final result = await _locationUseCase.getAddressFromLocationCoordinateUseCase(latitude: _latitude!, longitude: _longitude!);
        state = state.setGetAddressFromLocationCoordinateState(State.success(result));

        return true;
      } on Exception catch (e) {
        state = state.setGetAddressFromLocationCoordinateState(State.error(e));
        NotifyUser.showSnackbar(e.toString());
        return false;
      }
    } else {
      NotifyUser.showSnackbar('Invalid Latitude and Longitude');
      return false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _latitude = null;
    _longitude = null;
  }
}
