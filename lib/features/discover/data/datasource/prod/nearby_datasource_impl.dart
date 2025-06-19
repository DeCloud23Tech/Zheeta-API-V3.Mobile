import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/services/api/api_manager.dart';
import 'package:zheeta/features/discover/data/datasource/nearby_datasource.dart';
import 'package:zheeta/features/discover/data/model/nearby_model.dart';
import 'package:zheeta/features/discover/data/model/nearby_settings_model.dart';
import 'package:zheeta/features/discover/data/request/nearby_update_request.dart';

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
          .map((item) => NearbyDataModel.fromJson(item as Map<String, dynamic>))
          .toList();
      return NearbyListDataModel(data: nearbyUsers);
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<NearbySettingsModel> getNearbySettings({required String userId}) async {
    var response = await _api.dio.get(
      '/nearby/settings/$userId',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200 && response.data['data'] != null) {
      return NearbySettingsModel.fromJson(response.data['data']);
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<void> nearbyUpdate(NearbyUpdateRequest request) async {
    final response = await _api.dio.put(
      '/nearby/update',
      data: request.toJson(),
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );

    if (response.statusCode != 200) {
      throw DioException.badResponse(
        statusCode: response.statusCode!,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }
}
