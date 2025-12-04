import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/profile/data/models/address_from_location_model.dart';
import 'package:zheeta/features/profile/data/requests/location_coordinate_from_address_request.dart';
import 'package:zheeta/features/profile/domain/repositories/location_repository.dart';

@prod
@LazySingleton()
class GetAddressFromLocationCoordinate
    extends UsecaseWithParams<AddressFromLocationModel, GetAddressParameter> {
  const GetAddressFromLocationCoordinate(this._repo);

  final ILocationRepository _repo;

  @override
  ResultFuture<AddressFromLocationModel> call(
          GetAddressParameter params) async =>
      await _repo.getAddressFromLocationCoordinateRepo(
          longitude: params.longitude, latitude: params.latitude);
}

@prod
@LazySingleton()
class GetLocationCoordinateFromAddress
    extends UsecaseWithParams<void, LocationCoordinateFromAddressRequest> {
  const GetLocationCoordinateFromAddress(this._repo);

  final ILocationRepository _repo;

  @override
  ResultFuture<void> call(LocationCoordinateFromAddressRequest params) async =>
      await _repo.getLocationCoordinateFromAddressRepo(params);
}

class GetAddressParameter {
  double longitude;
  double latitude;

  GetAddressParameter({required this.latitude, required this.longitude});
}
