import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/errors/error.dart';
import 'package:zheeta/common/errors/exception.dart';
import 'package:zheeta/features/buddy_events/data/datasource/event_datasource.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_event_id.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_events_feed.dart';
import 'package:zheeta/features/buddy_events/data/model/create_buddy_event.dart';
import 'package:zheeta/features/buddy_events/data/model/created_buddy_event.dart';
import 'package:zheeta/features/buddy_events/data/model/joined_buddy_event.dart';
import 'package:zheeta/features/buddy_events/data/request/buddy_event_report_request.dart';
import 'package:zheeta/features/buddy_events/data/request/create_buddy_event_request.dart';
import 'package:zheeta/features/buddy_events/data/request/update_buddy_event_request.dart';
import 'package:zheeta/features/buddy_events/domain/repository/event_repository.dart';

@prod
@LazySingleton(as: EventRepository)
class EventDataRepositoryImpl implements EventRepository {
  final EventDataSource _datasource;

  EventDataRepositoryImpl(this._datasource);

  @override
  ResultFuture<List<CreatedBuddyEvent>> getAllCreatedEvents({
    required int pageNumber,
    required int pageSize,
    String? userId,
  }) async {
    try {
      final result = await _datasource.getAllCreatedEvents(
          pageNumber: pageNumber, pageSize: pageSize, userId: userId);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<List<JoinedBuddyEvent>> getAllJoinedEvents(
      {required int pageNumber, required int pageSize}) async {
    try {
      final result = await _datasource.getAllJoinedEvents(
          pageNumber: pageNumber, pageSize: pageSize);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<CreateBuddyEventData> createBuddyEvent(
      CreateBuddyEventRequest request) async {
    try {
      var result = await _datasource.createBuddyEvent(request);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid deleteBuddyEvent(String eventId) async {
    try {
      var result = await _datasource.deleteBuddyEvent(eventId);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<BuddyEventId> getBuddyEventDetails({
    required String eventId,
    required String creatorId,
  }) async {
    try {
      final result = await _datasource.getBuddyEventDetails(
          eventId: eventId, creatorId: creatorId);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }


  @override
  ResultFuture<List<BuddyEvent>> getBuddyEventsFeed({
    required int pageNumber,
    required int pageSize,
  }) async {
    try {
      final result = await _datasource.getBuddyEventsFeed(
          pageNumber: pageNumber, pageSize: pageSize);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
          message: ex.response?.data['message'] ?? 'Try again later',
          statusCode: ex.response!.statusCode!));
    }
  }


  @override
  ResultVoid shareBuddyEvent({required String eventId,
    required String posterId,
    required List<String> userIds}) async {
    try {
      var result = await _datasource.shareBuddyEvent(
          eventId: eventId, posterId: posterId, userIds: userIds);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid updateBuddyEvent({
    required String eventId,
    required UpdateBuddyEventRequest request,
  }) async {
    try {
      var result = await _datasource.updateBuddyEvent(
          eventId: eventId, request: request);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid reportBuddyEvent(BuddyEventReportRequest request) async {
    try {
      var result = await _datasource.reportBuddyEvent(request);
    return right(result);
    } on ApiException catch (ex) {
    return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
    return left(ApiError(
    message: ex.response?.data['message'],
    statusCode: ex.response!.statusCode!));
    }
  }
}
