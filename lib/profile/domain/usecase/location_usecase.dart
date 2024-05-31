import 'package:zheeta/profile/data/model/address_from_location_model.dart';
import 'package:zheeta/profile/data/request/location_coordinate_from_address_request.dart';

abstract class LocationUseCase {
  Future<AddressFromLocationModel> getAddressFromLocationCoordinateUseCase({
    required double latitude,
    required double longitude,
  });
  getLocationCoordinateFromAddressUseCase(LocationCoordinateFromAddressRequest request);
}
