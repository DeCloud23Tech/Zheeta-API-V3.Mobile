import 'package:zheeta/profile/data/request/location_coordinate_from_address_request.dart';

abstract class LocationRepository {
  getAddressFromLocationCoordinateRepo({
    required double latitude,
    required double longitude,
  });
  getLocationCoordinateFromAddressRepo(LocationCoordinateFromAddressRequest request);
}
