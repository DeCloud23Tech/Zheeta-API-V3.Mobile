import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/mixins/location_helper.dart';
import 'package:zheeta/app/common/mixins/validation_helper.dart';
import 'package:zheeta/app/common/notify/notify_user.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';
import 'package:zheeta/profile/domain/usecase/location_usecase.dart';
import 'package:zheeta/profile/presentation/state/location_state.dart';

final locationViewModelProvider = StateNotifierProvider.autoDispose<LocationViewModel, LocationState>((ref) {
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
    setLocalState = localState?.setGetCurrentLocationState(State.loading());
    try {
      final result = await getLocation();

      if (result != null) {
        _latitude = result.latitude;
        _longitude = result.longitude;

        await sessionManager.set(SessionManagerKeys.latitude, _latitude);
        await sessionManager.set(SessionManagerKeys.longitude, _longitude);

        setLocalState = localState?.setGetCurrentLocationState(State.success(result));
        await getAddressFromLocationCoordinate();
        return true;
      } else {
        setLocalState = localState?.setGetCurrentLocationState(State.error(Exception('Unable to get current location')));
        return false;
      }
    } on Exception catch (e) {
      setLocalState = localState?.setGetCurrentLocationState(State.error(e));
      NotifyUser.showSnackbar(e.toString());

      return false;
    }
  }

  Future<bool> getAddressFromLocationCoordinate() async {
    if (_isValidLatLong()) {
      setLocalState = localState?.setGetAddressFromLocationCoordinateState(State.loading());
      try {
        final result = await _locationUseCase.getAddressFromLocationCoordinateUseCase(latitude: _latitude!, longitude: _longitude!);
        setLocalState = localState?.setGetAddressFromLocationCoordinateState(State.success(result));

        return true;
      } on Exception catch (e) {
        setLocalState = localState?.setGetAddressFromLocationCoordinateState(State.error(e));
        return false;
      }
    } else {
      NotifyUser.showSnackbar('Invalid Latitude and Longitude');
      return false;
    }
  }

  LocationState? get localState => mounted ? state : null;
  void set setLocalState(LocationState? value) => mounted
      ? value != null
          ? state = value
          : null
      : null;

  @override
  void dispose() {
    super.dispose();
    _latitude = null;
    _longitude = null;
  }
}
