import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/profile/data/models/address_from_location_model.dart';
import 'package:zheeta/features/profile/data/requests/location_coordinate_from_address_request.dart';

abstract class ILocationRepository {
  ResultFuture<AddressFromLocationModel> getAddressFromLocationCoordinateRepo({
    required double latitude,
    required double longitude,
  });

  ResultVoid getLocationCoordinateFromAddressRepo(
      LocationCoordinateFromAddressRequest request);
}
