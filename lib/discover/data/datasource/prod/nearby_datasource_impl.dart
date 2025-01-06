import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/discover/data/datasource/nearby_datasource.dart';
import 'package:zheeta/discover/data/model/nearby_model.dart';
import 'package:zheeta/discover/data/model/nearby_settings_model.dart';

@prod
@Singleton(as: NearbyDataSource)
class NearbyDataSourceImpl implements NearbyDataSource {
  final Api _api;

  NearbyDataSourceImpl(this._api) {}

  @override
  Future<NearbyListDataModel> getNearbyProfiles(
      {required int pageNumber, required int pageSize}) async {
    var response = await _api.dio.get(
      '/nearby/get-people-nearby?PageNumber=$pageNumber&PageSize=$pageSize',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      final List<dynamic> dataList = response.data['data'] ?? [];
      final List<NearbyDataModel> nearbyUsers = dataList
          .map((item) =>
          NearbyDataModel.fromJson(item as Map<String, dynamic>))
          .toList();
      return NearbyListDataModel(data: nearbyUsers);
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<NearbySettingsModel> getNearbySettings() async {
    var response = await _api.dio.get(
      '/nearby/settings',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return NearbySettingsModel.fromJson(response.data);
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }
}
