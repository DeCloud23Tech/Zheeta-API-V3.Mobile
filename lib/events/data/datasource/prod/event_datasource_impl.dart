import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/events/data/datasource/event_datasource.dart';
import 'package:zheeta/events/data/model/created_buddy_event.dart';
import 'package:zheeta/events/data/model/buddy_events_feed.dart';
import 'package:zheeta/events/data/model/joined_buddy_event.dart';
import 'package:zheeta/events/data/request/create_buddy_event_request.dart';
import 'package:zheeta/events/data/request/process_join_request.dart';
import 'package:zheeta/events/data/request/update_buddy_event_request.dart';
import 'package:zheeta/events/domain/repository/event_repository.dart';

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
      throw ApiException(
        message: response.statusMessage!,
        statusCode: response.statusCode!,
      );
    }
  }

  @override
  Future<List<JoinedBuddyEvent>> getAllJoinedEvents(
      {required int pageNumber, required int pageSize}) async {
    var response = await _api.dio.get(
      '/buddy-event/created?PageNumber=$pageNumber&PageSize=$pageSize',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => JoinedBuddyEvent.fromJson(json)).toList();
    } else {
      throw ApiException(
        message: response.statusMessage!,
        statusCode: response.statusCode!,
      );
    }
  }

  @override
  Future<void> createBuddyEvent(CreateBuddyEventRequest request) async {
    var response = await _api.dio.post(
      '/buddy-event/create',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
      data: jsonEncode(request.toJson()),
    );
    if (response.statusCode != 200) {
      throw ApiException(
        message: response.statusMessage!,
        statusCode: response.statusCode!,
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
      throw ApiException(
        message: response.statusMessage!,
        statusCode: response.statusCode!,
      );
    }
  }

  // @override
  // Future<BuddyEventDetails> getBuddyEventDetails({
  //   required String eventId,
  //   required String creatorId,
  // }) async {
  //   var response = await _api.dio.get(
  //     '/buddy-event/$eventId/get/$creatorId',
  //     options: Options(
  //       contentType: Headers.jsonContentType,
  //     ),
  //   );
  //   if (response.statusCode == 200) {
  //     return BuddyEventDetails.fromJson(response.data['data']);
  //   } else {
  //     throw ApiException(
  //       message: response.statusMessage!,
  //       statusCode: response.statusCode!,
  //     );
  //   }
  // }

  // @override
  // Future<List<BuddyEventMember>> getBuddyEventMembers({
  //   required String eventId,
  //   int? pageNumber,
  //   int? pageSize,
  // }) async {
  //   var response = await _api.dio.get(
  //     '/buddy-event/$eventId/get-members',
  //     queryParameters: {
  //       'PageNumber': pageNumber,
  //       'PageSize': pageSize,
  //     },
  //     options: Options(
  //       contentType: Headers.jsonContentType,
  //     ),
  //   );
  //   if (response.statusCode == 200) {
  //     List<dynamic> data = response.data['data'] ?? [];
  //     return data.map((json) => BuddyEventMember.fromJson(json)).toList();
  //   } else {
  //     throw ApiException(
  //       message: response.statusMessage!,
  //       statusCode: response.statusCode!,
  //     );
  //   }
  // }
  //
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
      throw ApiException(
        message: response.statusMessage!,
        statusCode: response.statusCode!,
      );
    }
  }

  //
  // @override
  // Future<List<FriendCreatedBuddyEvent>> getEventsCreatedByFriends({
  //   required int pageNumber,
  //   required int pageSize,
  // }) async {
  //   var response = await _api.dio.get(
  //     '/buddy-event/created-by-friends',
  //     queryParameters: {
  //       'PageNumber': pageNumber,
  //       'PageSize': pageSize,
  //     },
  //     options: Options(
  //       contentType: Headers.jsonContentType,
  //     ),
  //   );
  //   if (response.statusCode == 200) {
  //     List<dynamic> data = response.data['data'] ?? [];
  //     return data
  //         .map((json) => FriendCreatedBuddyEvent.fromJson(json))
  //         .toList();
  //   } else {
  //     throw ApiException(
  //       message: response.statusMessage!,
  //       statusCode: response.statusCode!,
  //     );
  //   }
  // }
  //
  // @override
  // Future<List<JoinRequest>> getJoinRequests({
  //   required String eventId,
  //   int? pageNumber,
  //   int? pageSize,
  // }) async {
  //   var response = await _api.dio.get(
  //     '/buddy-event/$eventId/get-join-request',
  //     queryParameters: {
  //       'PageNumber': pageNumber,
  //       'PageSize': pageSize,
  //     },
  //     options: Options(
  //       contentType: Headers.jsonContentType,
  //     ),
  //   );
  //   if (response.statusCode == 200) {
  //     List<dynamic> data = response.data['data'] ?? [];
  //     return data.map((json) => JoinRequest.fromJson(json)).toList();
  //   } else {
  //     throw ApiException(
  //       message: response.statusMessage!,
  //       statusCode: response.statusCode!,
  //     );
  //   }
  // }

  @override
  Future<void> processJoinRequest(ProcessJoinRequest request) async {
    var response = await _api.dio.put(
      '/buddy-event/process-join-request',
      data: jsonEncode(request.toJson()),
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode != 200) {
      throw ApiException(
        message: response.statusMessage!,
        statusCode: response.statusCode!,
      );
    }
  }

  @override
  Future<void> removeBuddyEventMember({
    required String eventId,
    required String memberId,
  }) async {
    var response = await _api.dio.post(
      '/buddy-event/remove-member',
      data: {
        'eventId': eventId,
        'memberId': memberId,
      },
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode != 200) {
      throw ApiException(
        message: response.statusMessage!,
        statusCode: response.statusCode!,
      );
    }
  }

  @override
  Future<void> sendJoinRequest({
    required String eventId,
    required String eventCreatorId,
  }) async {
    var response = await _api.dio.post(
      '/buddy-event/$eventId/send-join-request/$eventCreatorId',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode != 200) {
      throw ApiException(
        message: response.statusMessage!,
        statusCode: response.statusCode!,
      );
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
      throw ApiException(
        message: response.statusMessage!,
        statusCode: response.statusCode!,
      );
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
      throw ApiException(
        message: response.statusMessage!,
        statusCode: response.statusCode!,
      );
    }
  }

  @override
  Future<BuddyEventDetails> getBuddyEventDetails(
      {required String eventId, required String creatorId}) {
    // TODO: implement getBuddyEventDetails
    throw UnimplementedError();
  }

  @override
  Future<List<BuddyEventMember>> getBuddyEventMembers(
      {required String eventId, int? pageNumber, int? pageSize}) {
    // TODO: implement getBuddyEventMembers
    throw UnimplementedError();
  }

  @override
  Future<List<FriendCreatedBuddyEvent>> getEventsCreatedByFriends(
      {required int pageNumber, required int pageSize}) {
    // TODO: implement getEventsCreatedByFriends
    throw UnimplementedError();
  }

  @override
  Future<List<JoinRequest>> getJoinRequests(
      {required String eventId, int? pageNumber, int? pageSize}) {
    // TODO: implement getJoinRequests
    throw UnimplementedError();
  }
}
