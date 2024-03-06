import 'package:injectable/injectable.dart';
import 'package:zheeta/profile/data/datasource/location_datasource.dart';
import 'package:zheeta/profile/data/model/address_from_location_model.dart';
import 'package:zheeta/profile/data/request/location_coordinate_from_address_request.dart';
import 'package:zheeta/profile/domain/repository/location_repository.dart';

@prod
@LazySingleton(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {
  final LocationDataSource _datasource;
  LocationRepositoryImpl(this._datasource);

  @override
  Future<AddressFromLocationModel> getAddressFromLocationCoordinateRepo({required double latitude, required double longitude}) async {
    final result = await _datasource.getAddressFromLocationCoordinate(latitude: latitude, longitude: longitude);
    return result.fold(
      (error) => throw new Exception(error.message),
      (value) => AddressFromLocationModel.fromJson(value['data']),
    );
  }

  @override
  getLocationCoordinateFromAddressRepo(LocationCoordinateFromAddressRequest request) async {
    final result = await _datasource.getLocationCoordinateFromAddress(request);
    return result.fold(
      (error) => throw new Exception(error.message),
      (value) => value,
    );
  }
}
