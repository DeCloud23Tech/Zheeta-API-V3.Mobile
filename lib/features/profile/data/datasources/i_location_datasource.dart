import 'package:zheeta/features/profile/data/models/address_from_location_model.dart';
import 'package:zheeta/features/profile/data/requests/location_coordinate_from_address_request.dart';

abstract class ILocationDataSource {
  Future<AddressFromLocationModel> getAddressFromLocationCoordinateNew({
    required double latitude,
    required double longitude,
  });
  Future<void> getLocationCoordinateFromAddressNew(
      LocationCoordinateFromAddressRequest request);
}
