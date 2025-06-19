import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/services/api/api_manager.dart';
import 'package:zheeta/features/buddy_events/data/datasource/event_datasource.dart';
import 'package:zheeta/features/buddy_events/data/datasource/event_verification_datasource.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_event_verification.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_events_feed.dart';
import 'package:zheeta/features/buddy_events/data/model/created_buddy_event.dart';
import 'package:zheeta/features/buddy_events/data/model/joined_buddy_event.dart';
import 'package:zheeta/features/buddy_events/data/request/create_buddy_event_request.dart';
import 'package:zheeta/features/buddy_events/data/request/process_join_request.dart';
import 'package:zheeta/features/buddy_events/data/request/update_buddy_event_request.dart';
import 'package:zheeta/features/buddy_events/domain/repository/event_repository.dart';


@prod
@Singleton(as: EventVerificationDataSource)
class EventVerificationDataSourceImpl implements EventVerificationDataSource {
  final Api _api;

  EventVerificationDataSourceImpl(this._api);

  @override
  Future<BuddyEventVerification?> getBuddyEventVerificationById({required String id}) async {
    var response = await _api.dio.get(
      '/buddy-event/verify/get/$id',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      final data = response.data['data'];
      if (data == null) {
        return null; // Handle null case gracefully
      }
      return BuddyEventVerification.fromJson(data);    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }
}
