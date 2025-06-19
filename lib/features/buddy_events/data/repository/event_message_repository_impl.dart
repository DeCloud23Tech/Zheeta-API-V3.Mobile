import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/errors/error.dart';
import 'package:zheeta/common/errors/exception.dart';
import 'package:zheeta/features/buddy_events/data/datasource/event_message_datasource.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_event_message.dart';
import 'package:zheeta/features/buddy_events/data/request/buddy_event_send_message_request.dart';
import 'package:zheeta/features/buddy_events/domain/repository/event_message_repository.dart';


@prod
@LazySingleton(as: EventMessageRepository)
class EventMessageRepositoryImpl
    implements EventMessageRepository {
  final EventMessageDataSource _datasource;

  EventMessageRepositoryImpl(this._datasource);

  @override
  ResultFuture<List<BuddyEventMessage>> getBuddyEventMessages(
      {required String eventId, required String eventCreatorId, int? pageNumber, int? pageSize}) async {
    try {
      var result = await _datasource.getBuddyEventMessages(eventId: eventId,
        eventCreatorId: eventCreatorId,
        pageNumber: pageNumber,
        pageSize: pageSize,);
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
  ResultVoid deleteBuddyEventMessage(
      {required String buddyEventId, required String messageId}) async {
    try {
      var result = await _datasource.deleteBuddyEventMessage(buddyEventId: buddyEventId, messageId: messageId);
    return right(result);
    } on ApiException catch (ex) {
    return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
    return left(
    ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }


  @override
  ResultVoid sendMessageRequest(BuddyEventSendMessageRequest request) async {
    try {
      var result = await _datasource.sendMessageRequest(request);
    return right(result);
    } on ApiException catch (ex) {
    return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
    return left(
    ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }
}