import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/profile/data/model/address_from_location_model.dart';
import 'package:zheeta/profile/data/request/location_coordinate_from_address_request.dart';

abstract class LocationDataSource {
  Future<Either<ErrorResponse, MappedResponse>>
      getAddressFromLocationCoordinate({
    required double latitude,
    required double longitude,
  });
  Future<Either<ErrorResponse, MappedResponse>>
      getLocationCoordinateFromAddress(
          LocationCoordinateFromAddressRequest request);

  Future<AddressFromLocationModel> getAddressFromLocationCoordinateNew({
    required double latitude,
    required double longitude,
  });
  Future<void> getLocationCoordinateFromAddressNew(
      LocationCoordinateFromAddressRequest request);
}
