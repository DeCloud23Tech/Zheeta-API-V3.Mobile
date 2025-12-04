import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/profile/data/models/address_from_location_model.dart';
import 'package:zheeta/features/profile/data/requests/location_coordinate_from_address_request.dart';
import 'package:zheeta/features/profile/domain/usecases/location_usecases.dart';

part 'profile_location_state.dart';

@prod
@LazySingleton()
class ProfileLocationCubit extends Cubit<ProfileLocationState> {
  final GetAddressFromLocationCoordinate getAddressFromLocationCoordinate;
  final GetLocationCoordinateFromAddress getLocationCoordinateFromAddress;

  ProfileLocationCubit({
    required this.getAddressFromLocationCoordinate,
    required this.getLocationCoordinateFromAddress,
  }) : super(ProfileLocationInitial());

  Future<AddressFromLocationModel?> getAddressFromLocationCoordinateCubit(
      {required double longitude, required double latitude}) async {
    emit(ProfileLocationLoadingState());

    AddressFromLocationModel? data;
    var result = await getAddressFromLocationCoordinate(
        GetAddressParameter(latitude: latitude, longitude: longitude));
    result.fold(
      (fail) {
        emit(ProfileLocationErrorState(fail.message));
      },
      (success) {
        emit(ProfileGotAddressLocationState(success));
        data = success;
      },
    );

    return data;
  }

  Future<void> getLocationCoordinateFromAddressCubit(
      {required LocationCoordinateFromAddressRequest request}) async {
    emit(ProfileLocationLoadingState());
    var result = await getLocationCoordinateFromAddress(request);
    result.fold(
      (fail) {
        emit(ProfileLocationErrorState(fail.message));
      },
      (success) {
        emit(ProfileGotLocationCoordinateState());
      },
    );
  }
}
