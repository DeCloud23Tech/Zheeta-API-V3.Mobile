import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/network/api.dart';
import 'package:zheeta/features/buddy_events/data/datasources/i_event_message_datasource.dart';
import 'package:zheeta/features/buddy_events/data/datasources/i_event_search_datasource.dart';
import 'package:zheeta/features/buddy_events/data/models/buddy_event_message.dart';
import 'package:zheeta/features/buddy_events/data/models/buddy_search_response.dart';
import 'package:zheeta/features/buddy_events/data/requests/buddy_event_send_message_request.dart';

@prod
@Singleton(as: IEventMessageDataSource)
class EventMessageDataSourceImpl implements IEventMessageDataSource {
  final Api _api;

  EventMessageDataSourceImpl(this._api);

  @override
  Future<List<BuddyEventMessage>> getBuddyEventMessages(
      {required String eventId,
      required String eventCreatorId,
      int? pageNumber,
      int? pageSize}) async {
    var response = await _api.dio.get(
      '/buddy-event/$eventId/get-messages/$eventCreatorId?PageNumber=$pageNumber&PageSize=$pageSize',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => BuddyEventMessage.fromJson(json)).toList();
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<void> deleteBuddyEventMessage(
      {required String buddyEventId, required String messageId}) async {
    var response = await _api.dio.post(
      '/buddy-event/delete-message',
      data: {
        'buddyEventId': buddyEventId,
        'messageId': messageId,
      },
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode != 200) {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<void> sendMessageRequest(BuddyEventSendMessageRequest request) async {
    var response = await _api.dio.post(
      '/buddy-event/send-message',
      data: request.toJson(),
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode != 200 || response.data?['statusCode'] != 201) {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }
}
