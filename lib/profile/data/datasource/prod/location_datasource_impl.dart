import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/profile/data/datasource/location_datasource.dart';
import 'package:zheeta/profile/data/model/address_from_location_model.dart';
import 'package:zheeta/profile/data/request/location_coordinate_from_address_request.dart';

@prod
@Singleton(as: LocationDataSource)
class LocationDataSourceImpl implements LocationDataSource {
  final ApiManager _apiManager;
  late final String? _authToken;
  final Api _api;

  LocationDataSourceImpl(this._apiManager, this._api) {
    _getAuthToken();
  }

  _getAuthToken() async {
    _authToken = (await sessionManager.get(SessionManagerKeys.authTokenString))
        as String?;
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>>
      getAddressFromLocationCoordinate(
          {required double latitude, required double longitude}) async {
    final response = await _apiManager.getHttp(
        '/user/update-location/$latitude/$longitude',
        token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>>
      getLocationCoordinateFromAddress(
          LocationCoordinateFromAddressRequest request) async {
    final response = await _apiManager.getHttp('/user/update-address-location',
        body: request.toJson(), token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<AddressFromLocationModel> getAddressFromLocationCoordinateNew(
      {required double latitude, required double longitude}) async {
    var response = await _api.dio.get(
      '/user/update-location/$latitude/$longitude',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return AddressFromLocationModel.fromJson(response.data['data']);
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<void> getLocationCoordinateFromAddressNew(
      LocationCoordinateFromAddressRequest request) async {
    var response = await _api.dio.get(
      '/user/update-address-location',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }
}
