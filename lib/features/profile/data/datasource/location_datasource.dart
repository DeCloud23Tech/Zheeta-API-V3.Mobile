import 'package:zheeta/features/profile/data/model/address_from_location_model.dart';
import 'package:zheeta/features/profile/data/request/location_coordinate_from_address_request.dart';

abstract class LocationDataSource {
  Future<AddressFromLocationModel> getAddressFromLocationCoordinateNew({
    required double latitude,
    required double longitude,
  });
  Future<void> getLocationCoordinateFromAddressNew(
      LocationCoordinateFromAddressRequest request);
}
