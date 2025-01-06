import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/errors/error.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/messages/data/datasource/chat_datasource.dart';
import 'package:zheeta/messages/data/request/create_chat_request.dart';
import 'package:zheeta/messages/domain/repository/chat_repository.dart';


@prod
@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  final ChatDataSource _datasource;

  ChatRepositoryImpl(this._datasource);

  @override
  ResultFuture<List<ChatMessage>> getChatHistory({
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
      return right([]);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
        ApiError(message: ex.message!, statusCode: ex.response!.statusCode!),
      );
    }
  }

  @override
  ResultVoid createChat({
    required CreateChatRequest request,
  }) async {
    try {
      await _datasource.createChat(request: request);
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
  ResultVoid deleteChatHistory({
    required String senderId,
    required String recipientId,
  }) async {
    try {
      await _datasource.deleteChatHistory(senderId: senderId, recipientId: recipientId);
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
      await _datasource.deleteChatMessage(id: id, senderId: senderId, recipientId: recipientId);
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
  ResultFuture<List<ChatRecipient>> getAllRecipients({
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
  ResultVoid sendMediaFile({
    required String chatId,
    required File file,
  }) async {
    try {
      await _datasource.sendMediaFile(chatId: chatId, file: file);
      return right(unit);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
        ApiError(message: ex.message!, statusCode: ex.response!.statusCode!),
      );
    }
  }
}
