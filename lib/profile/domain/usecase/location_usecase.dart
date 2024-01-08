import 'package:zheeta/profile/data/request/location_coordinate_from_address_request.dart';

abstract class LocationUseCase {
  getAddressFromLocationCoordinateUseCase({
    required double latitude,
    required double longitude,
  });
  getLocationCoordinateFromAddressUseCase(LocationCoordinateFromAddressRequest request);
}
