import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/errors/error.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/type_def.dart';
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
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }

    // final result = await _datasource.getAddressFromLocationCoordinate(latitude: latitude, longitude: longitude);
    // return result.fold(
    //   (error) => throw new Exception(error.message),
    //   (value) => AddressFromLocationModel.fromJson(value['data']),
    // );
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
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
    // final result = await _datasource.getLocationCoordinateFromAddress(request);
    // return result.fold(
    //   (error) => throw new Exception(error.message),
    //   (value) => value,
    // );
  }
}
