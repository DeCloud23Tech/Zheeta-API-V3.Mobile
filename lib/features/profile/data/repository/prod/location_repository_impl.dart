
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/errors/error.dart';
import 'package:zheeta/common/errors/exception.dart';
import 'package:zheeta/features/profile/data/datasource/location_datasource.dart';
import 'package:zheeta/features/profile/data/model/address_from_location_model.dart';
import 'package:zheeta/features/profile/data/request/location_coordinate_from_address_request.dart';
import 'package:zheeta/features/profile/domain/repository/location_repository.dart';

@prod
@LazySingleton(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {
  final LocationDataSource _datasource;
  LocationRepositoryImpl(this._datasource);

  @override
  ResultFuture<AddressFromLocationModel> getAddressFromLocationCoordinateRepo(
      {required double latitude, required double longitude}) async {
    try {
      final result = await _datasource.getAddressFromLocationCoordinateNew(
          latitude: latitude, longitude: longitude);

      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid getLocationCoordinateFromAddressRepo(
      LocationCoordinateFromAddressRequest request) async {
    try {
      final result =
          await _datasource.getLocationCoordinateFromAddressNew(request);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }
}
