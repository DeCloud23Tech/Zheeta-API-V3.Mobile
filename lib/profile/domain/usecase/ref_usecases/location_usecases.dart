import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/profile/data/model/address_from_location_model.dart';
import 'package:zheeta/profile/data/request/location_coordinate_from_address_request.dart';
import 'package:zheeta/profile/domain/repository/access_restriction_repository.dart';
import 'package:zheeta/profile/domain/repository/location_repository.dart';

class GetAddressFromLocationCoordinate
    extends UsecaseWithParams<AddressFromLocationModel, GetAddressParameter> {
  const GetAddressFromLocationCoordinate(this._repo);

  final LocationRepository _repo;

  @override
  ResultFuture<AddressFromLocationModel> call(
          GetAddressParameter params) async =>
      await _repo.getAddressFromLocationCoordinateRepo(
          longitude: params.longitude, latitude: params.latitude);
}

class GetLocationCoordinateFromAddress
    extends UsecaseWithParams<void, LocationCoordinateFromAddressRequest> {
  const GetLocationCoordinateFromAddress(this._repo);

  final LocationRepository _repo;

  @override
  ResultFuture<void> call(LocationCoordinateFromAddressRequest params) async =>
      await _repo.getLocationCoordinateFromAddressRepo(params);
}

class GetAddressParameter {
  double longitude;
  double latitude;

  GetAddressParameter({required this.latitude, required this.longitude});
}
