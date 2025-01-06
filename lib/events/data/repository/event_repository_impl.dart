import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/errors/error.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/events/data/datasource/event_datasource.dart';
import 'package:zheeta/events/data/model/created_buddy_event.dart';
import 'package:zheeta/events/data/model/buddy_events_feed.dart';
import 'package:zheeta/events/data/model/joined_buddy_event.dart';
import 'package:zheeta/events/data/request/create_buddy_event_request.dart';
import 'package:zheeta/events/data/request/process_join_request.dart';
import 'package:zheeta/events/data/request/update_buddy_event_request.dart';
import 'package:zheeta/events/domain/repository/event_repository.dart';

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
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
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
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid createBuddyEvent(CreateBuddyEventRequest request) async {
    try {
      await _datasource.createBuddyEvent(request);
      return right(unit);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid deleteBuddyEvent(String eventId) async {
    try {
      await _datasource.deleteBuddyEvent(eventId);
      return right(unit);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<BuddyEventDetails> getBuddyEventDetails({
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
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<List<BuddyEventMember>> getBuddyEventMembers({
    required String eventId,
    int? pageNumber,
    int? pageSize,
  }) async {
    try {
      final result = await _datasource.getBuddyEventMembers(
          eventId: eventId, pageNumber: pageNumber, pageSize: pageSize);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
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
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<List<FriendCreatedBuddyEvent>> getEventsCreatedByFriends({
    required int pageNumber,
    required int pageSize,
  }) async {
    try {
      final result = await _datasource.getEventsCreatedByFriends(
          pageNumber: pageNumber, pageSize: pageSize);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<List<JoinRequest>> getJoinRequests({
    required String eventId,
    int? pageNumber,
    int? pageSize,
  }) async {
    try {
      final result = await _datasource.getJoinRequests(
          eventId: eventId, pageNumber: pageNumber, pageSize: pageSize);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid processJoinRequest(ProcessJoinRequest request) async {
    try {
      await _datasource.processJoinRequest(request);
      return right(unit);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid removeBuddyEventMember({
    required String eventId,
    required String memberId,
  }) async {
    try {
      await _datasource.removeBuddyEventMember(
          eventId: eventId, memberId: memberId);
      return right(unit);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid sendJoinRequest({
    required String eventId,
    required String eventCreatorId,
  }) async {
    try {
      await _datasource.sendJoinRequest(
          eventId: eventId, eventCreatorId: eventCreatorId);
      return right(unit);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid shareBuddyEvent(
      {required String eventId,
      required String posterId,
      required List<String> userIds}) async {
    try {
      await _datasource.shareBuddyEvent(
          eventId: eventId, posterId: posterId, userIds: userIds);
      return right(unit);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid updateBuddyEvent({
    required String eventId,
    required UpdateBuddyEventRequest request,
  }) async {
    try {
      await _datasource.updateBuddyEvent(eventId: eventId, request: request);
      return right(unit);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }
}
