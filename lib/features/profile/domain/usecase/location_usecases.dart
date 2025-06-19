import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/param/pagination_param.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/profile/data/model/address_from_location_model.dart';
import 'package:zheeta/features/profile/data/model/blocked_user_model.dart';
import 'package:zheeta/features/profile/data/request/location_coordinate_from_address_request.dart';
import 'package:zheeta/features/profile/domain/repository/location_repository.dart';
import 'package:zheeta/features/profile/domain/repository/user_profile_access_repository.dart';


@prod
@LazySingleton()
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

@prod
@LazySingleton()
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
