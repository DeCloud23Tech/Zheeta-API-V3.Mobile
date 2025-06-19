import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/errors/error.dart';
import 'package:zheeta/common/errors/exception.dart';
import 'package:zheeta/features/buddy_events/data/datasource/event_member_datasource.dart';
import 'package:zheeta/features/buddy_events/data/datasource/event_verification_datasource.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_event_join_request.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_event_members.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_event_message.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_event_verification.dart';
import 'package:zheeta/features/buddy_events/data/request/buddy_event_send_message_request.dart';
import 'package:zheeta/features/buddy_events/data/request/process_join_request.dart';
import 'package:zheeta/features/buddy_events/domain/repository/event_member_repository.dart';
import 'package:zheeta/features/buddy_events/domain/repository/event_message_repository.dart';
import 'package:zheeta/features/buddy_events/domain/repository/event_verification_repository.dart';


@prod
@LazySingleton(as: EventMemberRepository)
class EventMemberRepositoryImpl
    implements EventMemberRepository {
  final EventMemberDataSource _datasource;

  EventMemberRepositoryImpl(this._datasource);

  @override
  ResultFuture<List<BuddyEventMember>> getBuddyEventMembers(
      {required String eventId, int? pageNumber, int? pageSize}) async {
    try {
      var result = await _datasource.getBuddyEventMembers(
        eventId: eventId, pageNumber: pageNumber, pageSize: pageSize,);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.response?.data['message'],
              statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<List<BuddyEventJoinRequest>> getJoinRequests(
      {required String eventId, int? pageNumber, int? pageSize}) async {
    try {
      var result = await _datasource.getJoinRequests(eventId: eventId, pageNumber: pageNumber, pageSize: pageSize,);
    return right(result);
    } on ApiException catch (ex) {
    return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
    return left(
    ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid processJoinRequest(ProcessJoinRequest request) async {
    try {
      var result = await _datasource.processJoinRequest(request);
    return right(result);
    } on ApiException catch (ex) {
    return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
    return left(
    ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid removeBuddyEventMember(
      {required String eventId, required String memberId}) async {
    try {
      var result = await _datasource.removeBuddyEventMember(eventId: eventId, memberId: memberId);
    return right(result);
    } on ApiException catch (ex) {
    return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
    return left(
    ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid sendJoinRequest(
      {required String eventId, required String eventCreatorId}) async {
    try {
      var result = await _datasource.sendJoinRequest(eventId: eventId, eventCreatorId: eventCreatorId);
    return right(result);
    } on ApiException catch (ex) {
    return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
    return left(
    ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }

}