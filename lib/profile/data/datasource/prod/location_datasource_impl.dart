import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/profile/data/datasource/location_datasource.dart';
import 'package:zheeta/profile/data/request/location_coordinate_from_address_request.dart';

@prod
@LazySingleton(as: LocationDataSource)
class LocationDataSourceImpl implements LocationDataSource {
  final ApiManager _apiManager;
  late final String? _authToken;

  LocationDataSourceImpl(this._apiManager) {
    _getAuthToken();
  }

  _getAuthToken() async {
    _authToken = (await sessionManager.get(SessionManagerKeys.authTokenString)) as String?;
  }

  @override
  Future<Either<Error, MappedResponse>> getAddressFromLocationCoordinate({required double latitude, required double longitude}) async {
    final response = await _apiManager.getHttp('/user/update-location/$latitude/$longitude', token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(response.message);
    }
  }

  @override
  Future<Either<Error, MappedResponse>> getLocationCoordinateFromAddress(LocationCoordinateFromAddressRequest request) async {
    final response = await _apiManager.getHttp('/user/update-address-location', body: request.toJson(), token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(response.message);
    }
  }
}
