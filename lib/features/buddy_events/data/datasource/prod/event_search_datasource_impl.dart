import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/services/api/api_manager.dart';
import 'package:zheeta/features/buddy_events/data/datasource/event_search_datasource.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_search_response.dart';

@prod
@Singleton(as: EventSearchDataSource)
class EventSearchDatasourceImpl implements EventSearchDataSource {
  final Api _api;

  EventSearchDatasourceImpl(this._api);

  @override
  Future<BuddySearchResponse> searchBuddyEvent(
      {required String searchWord,
      required int pageNumber,
      required int pageSize}) async {
    var response = await _api.dio.get(
      '/buddy-event/search?searchWord=$searchWord&PageNumber=$pageNumber&PageSize=$pageSize',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return BuddySearchResponse.fromJson(response.data);
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }
}
