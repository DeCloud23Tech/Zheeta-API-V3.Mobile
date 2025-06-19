import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/services/api/api_manager.dart';
import 'package:zheeta/features/buddy_events/data/datasource/event_message_datasource.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_event_message.dart';
import 'package:zheeta/features/buddy_events/data/request/buddy_event_send_message_request.dart';

@prod
@Singleton(as: EventMessageDataSource)
class EventMessageDataSourceImpl implements EventMessageDataSource {
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
