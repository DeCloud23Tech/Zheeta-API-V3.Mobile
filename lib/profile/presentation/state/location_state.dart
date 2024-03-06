import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';
import 'package:zheeta/profile/data/model/address_from_location_model.dart';

part 'location_state.freezed.dart';

@freezed
class LocationState with _$LocationState {
  factory LocationState({
    required State<AddressFromLocationModel> getAddressFromLocationCoordinateState,
    required State getLocationCoordinateFromAddressState,
    required State<Position> getCurrentLocationState,
  }) = _LocationState;

  LocationState._();

  LocationState setGetAddressFromLocationCoordinateState(State<AddressFromLocationModel> state) => copyWith(getAddressFromLocationCoordinateState: state);
  LocationState setGetLocationCoordinateFromAddressState(State state) => copyWith(getLocationCoordinateFromAddressState: state);
  LocationState setGetCurrentLocationState(State<Position> state) => copyWith(getCurrentLocationState: state);
}
