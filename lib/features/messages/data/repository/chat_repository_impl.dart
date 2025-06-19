import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/errors/error.dart';
import 'package:zheeta/common/errors/exception.dart';
import 'package:zheeta/features/messages/data/datasource/chat_datasource.dart';
import 'package:zheeta/features/messages/data/model/chat_history_model.dart';
import 'package:zheeta/features/messages/data/model/chat_recipients_model.dart';
import 'package:zheeta/features/messages/data/model/message_model.dart';
import 'package:zheeta/features/messages/data/request/create_chat_request.dart';
import 'package:zheeta/features/messages/domain/repository/chat_repository.dart';

@prod
@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  final ChatDataSource _datasource;

  ChatRepositoryImpl(this._datasource);

  @override
  ResultFuture<ChatHistory> getChatHistory({
    required String recipientId,
    required int pageNumber,
    required int pageSize,
  }) async {
    try {
      final result = await _datasource.getChatHistory(
        recipientId: recipientId,
        pageNumber: pageNumber,
        pageSize: pageSize,
      );
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
        ApiError(message: ex.message!, statusCode: ex.response!.statusCode!),
      );
    }
  }

  @override
  ResultFuture<MessageModel> createChat({
    required CreateChatRequest request,
  }) async {
    try {
      var result  = await _datasource.createChat(request: request);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
        ApiError(message: ex.error.toString(), statusCode: ex.response!.statusCode!),
      );
    }
  }

  @override
  ResultVoid deleteChatHistory({
    required String senderId,
    required String recipientId,
  }) async {
    try {
      await _datasource.deleteChatHistory(
          senderId: senderId, recipientId: recipientId);
      return right(unit);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
        ApiError(message: ex.message!, statusCode: ex.response!.statusCode!),
      );
    }
  }

  @override
  ResultVoid deleteChatMessage({
    required String id,
    required String senderId,
    required String recipientId,
  }) async {
    try {
      var result = await _datasource.deleteChatMessage(
          id: id, senderId: senderId, recipientId: recipientId);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
        ApiError(message: ex.message!, statusCode: ex.response!.statusCode!),
      );
    }
  }

  @override
  ResultFuture<ChatRecipients> getAllRecipients({
    required int pageNumber,
    required int pageSize,
  }) async {
    try {
      final result = await _datasource.getAllRecipients(
        pageNumber: pageNumber,
        pageSize: pageSize,
      );
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
        ApiError(message: ex.message!, statusCode: ex.response!.statusCode!),
      );
    }
  }

  @override
  ResultFuture<MessageModel> sendMediaFile({
    required String message,
    required String recipientId,
    required String senderId,
    required File file,
  }) async {
    try {
      var result = await _datasource.sendMediaFile(
        message: message,
        recipientId: recipientId,
        senderId: senderId,
        file: file,
      );
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
        ApiError(message: ex.error.toString(), statusCode: ex.response!.statusCode!),
      );
    }
  }
}
