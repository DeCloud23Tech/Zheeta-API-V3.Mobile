import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/services/api/api_manager.dart';
import 'package:zheeta/features/buddy_events/data/datasource/event_member_datasource.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_event_join_request.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_event_members.dart';
import 'package:zheeta/features/buddy_events/data/request/process_join_request.dart';

@prod
@Singleton(as: EventMemberDataSource)
class EventMemberDataSourceImpl implements EventMemberDataSource {
  final Api _api;

  EventMemberDataSourceImpl(this._api);

  @override
  Future<List<BuddyEventMember>> getBuddyEventMembers(
      {required String eventId, int? pageNumber, int? pageSize}) async {
    var response = await _api.dio.get(
      '/buddy-event/$eventId/get-members?PageNumber=$pageNumber&PageSize=$pageSize',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => BuddyEventMember.fromJson(json)).toList();
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<List<BuddyEventJoinRequest>> getJoinRequests(
      {required String eventId, int? pageNumber, int? pageSize}) async {
    var response = await _api.dio.get(
      '/buddy-event/$eventId/get-join-requests?PageNumber=$pageNumber&PageSize=$pageSize',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => BuddyEventJoinRequest.fromJson(json)).toList();
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

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
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
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
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
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
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }
}
