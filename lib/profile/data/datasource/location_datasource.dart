import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/profile/data/request/location_coordinate_from_address_request.dart';

abstract class LocationDataSource {
  Future<Either<Error, MappedResponse>> getAddressFromLocationCoordinate({
    required double latitude,
    required double longitude,
  });
  Future<Either<Error, MappedResponse>> getLocationCoordinateFromAddress(LocationCoordinateFromAddressRequest request);
}
