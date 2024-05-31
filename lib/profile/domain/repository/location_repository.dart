import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/profile/data/model/address_from_location_model.dart';
import 'package:zheeta/profile/data/request/location_coordinate_from_address_request.dart';

abstract class LocationRepository {
  ResultFuture<AddressFromLocationModel> getAddressFromLocationCoordinateRepo({
    required double latitude,
    required double longitude,
  });
  ResultVoid getLocationCoordinateFromAddressRepo(
      LocationCoordinateFromAddressRequest request);
}
