import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/discover/data/datasource/nearby_datasource.dart';
import 'package:zheeta/discover/data/model/nearby_model.dart';
import 'package:zheeta/discover/data/model/nearby_settings_model.dart';

@prod
@Singleton(as: NearbyDataSource)
class NearbyDataSourceImpl implements NearbyDataSource {
  final Api _api;

  NearbyDataSourceImpl(this._api) {}

  @override
  Future<NearbyListModel> getNearbyProfiles() async {
    var response = await _api.dio.get(
      '/friends/get-people-nearby',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return NearbyListModel.fromJson(response.data);
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<NearbySettingsModel> getNearbySettings() async {
    var response = await _api.dio.get(
      'admin-settings/nearbysettings',
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
