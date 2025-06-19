import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/services/api/api_manager.dart';
import 'package:zheeta/features/buddy_events/data/datasource/event_datasource.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_event_id.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_events_feed.dart';
import 'package:zheeta/features/buddy_events/data/model/create_buddy_event.dart';
import 'package:zheeta/features/buddy_events/data/model/created_buddy_event.dart';
import 'package:zheeta/features/buddy_events/data/model/joined_buddy_event.dart';
import 'package:zheeta/features/buddy_events/data/request/buddy_event_report_request.dart';
import 'package:zheeta/features/buddy_events/data/request/create_buddy_event_request.dart';
import 'package:zheeta/features/buddy_events/data/request/update_buddy_event_request.dart';

@prod
@Singleton(as: EventDataSource)
class EventDataSourceImpl implements EventDataSource {
  final Api _api;

  EventDataSourceImpl(this._api);

  @override
  Future<List<CreatedBuddyEvent>> getAllCreatedEvents({
    required int pageNumber,
    required int pageSize,
    String? userId,
  }) async {
    final url = userId != null
        ? '/buddy-event/created?userId=$userId&PageNumber=$pageNumber&PageSize=$pageSize'
        : '/buddy-event/created?PageNumber=$pageNumber&PageSize=$pageSize';

    var response = await _api.dio.get(
      url,
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => CreatedBuddyEvent.fromJson(json)).toList();
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<List<JoinedBuddyEvent>> getAllJoinedEvents(
      {required int pageNumber, required int pageSize}) async {
    var response = await _api.dio.get(
      '/buddy-event/joined-events?PageNumber=$pageNumber&PageSize=$pageSize',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => JoinedBuddyEvent.fromJson(json)).toList();
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<CreateBuddyEventData> createBuddyEvent(
      CreateBuddyEventRequest request) async {
    // Convert list fields to multiple key-value pairs in FormData
    Map<String, dynamic> convertListToForm(List<String>? list, String key) {
      if (list == null || list.isEmpty) return {};
      return {key: list};
    }

    // Prepare FormData
    FormData formData = FormData.fromMap({
      "CreatorId": request.creatorId,
      "Category": request.category,
      "Title": request.title,
      "Description": request.description,
      "NoOfBuddiesWanted": request.noOfBuddiesWanted.toString(),
      "StartDate": request.startDate.toIso8601String(),
      "DurationOrLengthInHrs": request.durationOrLengthInHrs.toString(),
      "EventMainPhoto": await MultipartFile.fromFile(request.eventMainPhoto,
          filename: request.eventMainPhoto.split('/').last),
      "EventLocationAddress": request.eventLocationAddress,
      "EventCity": request.eventCity,
      "EventState": request.eventState,
      "EventCountry": request.eventCountry,
      "BuddyEventType": request.buddyEventType.toString(),
      if (request.buddyEventType == 2) "EventFee": request.eventFee.toString(),
      "IsPromoted": request.isPromoted.toString(),
      "Gender": request.gender,
      "TargetCountry": request.targetCountry,
      "MaritalStatus": request.maritalStatus,
      "Occupation": request.occupation,
      "EventOtherPhotos": request.eventOtherPhotos != null
          ? [
              for (String path in request.eventOtherPhotos!)
                await MultipartFile.fromFile(path,
                    filename: path.split('/').last)
            ]
          : [],
      "TagList": request.tagList,
      ...convertListToForm(request.eventItems, "EventItems"),
      ...convertListToForm(request.eventGuidelines, "EventGuidelines"),
    });

    var response = await _api.dio.post(
      '/buddy-event/create',
      options: Options(
        contentType: Headers.multipartFormDataContentType,
      ),
      data: formData,
    );

    if (response.statusCode == 200 && response.data?['statusCode'] == 201) {
      return CreateBuddyEventData.fromJson(response.data['data']);
    } else {
      throw DioException.badResponse(
        statusCode: response.data?['statusCode'] ?? 400,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<void> deleteBuddyEvent(String eventId) async {
    var response = await _api.dio.delete(
      '/buddy-event/delete/$eventId',
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
  Future<List<BuddyEvent>> getBuddyEventsFeed({
    required int pageNumber,
    required int pageSize,
  }) async {
    var response = await _api.dio.get(
      '/buddy-event/feeds',
      queryParameters: {
        'PageNumber': pageNumber,
        'PageSize': pageSize,
      },
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => BuddyEvent.fromJson(json)).toList();
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }


  @override
  Future<void> shareBuddyEvent({
    required String eventId,
    required String posterId,
    required List<String> userIds,
  }) async {
    var response = await _api.dio.post(
      '/buddy-event/share',
      data: {
        'eventId': eventId,
        'posterId': posterId,
        'userIds': userIds,
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
  Future<void> updateBuddyEvent({
    required String eventId,
    required UpdateBuddyEventRequest request,
  }) async {
    var response = await _api.dio.put(
      '/buddy-event/update',
      data: {
        'eventId': eventId,
        ...request.toJson(),
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
  Future<BuddyEventId> getBuddyEventDetails(
      {required String eventId, required String creatorId}) async {
    var response = await _api.dio.get(
      '/buddy-event/$eventId/get/$creatorId',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return BuddyEventId.fromJson(response.data['data']);
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<void> reportBuddyEvent(BuddyEventReportRequest request) async {
    var response = await _api.dio.post(
      '/buddy-event/report',
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
