import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/network/api.dart';
import 'package:zheeta/features/profile/data/datasources/i_location_datasource.dart';
import 'package:zheeta/features/profile/data/models/address_from_location_model.dart';
import 'package:zheeta/features/profile/data/requests/location_coordinate_from_address_request.dart';

@prod
@Singleton(as: ILocationDataSource)
class LocationDataSourceImpl implements ILocationDataSource {
  final Api _api;

  LocationDataSourceImpl(this._api);

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
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
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
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }
}
