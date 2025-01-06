import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/messages/data/datasource/chat_datasource.dart';
import 'package:zheeta/messages/data/request/create_chat_request.dart';
import 'package:zheeta/messages/domain/repository/chat_repository.dart';

@prod
@Singleton(as: ChatDataSource)
class ChatDataSourceImpl implements ChatDataSource {
  final Api _api;

  ChatDataSourceImpl(this._api);

  @override
  Future<void> createChat({required CreateChatRequest request}) {
    // TODO: implement createChat
    throw UnimplementedError();
  }

  @override
  Future<void> deleteChatHistory({required String senderId, required String recipientId}) {
    // TODO: implement deleteChatHistory
    throw UnimplementedError();
  }

  @override
  Future<void> deleteChatMessage({required String id, required String senderId, required String recipientId}) {
    // TODO: implement deleteChatMessage
    throw UnimplementedError();
  }

  @override
  Future<List<ChatRecipient>> getAllRecipients({required int pageNumber, required int pageSize}) {
    // TODO: implement getAllRecipients
    throw UnimplementedError();
  }

  @override
  Future<List<ChatMessage>> getChatHistory({required String recipientId, required int pageNumber, required int pageSize}) {
    // TODO: implement getChatHistory
    throw UnimplementedError();
  }

  @override
  Future<void> sendMediaFile({required String chatId, required File file}) {
    // TODO: implement sendMediaFile
    throw UnimplementedError();
  }

  // @override
  // Future<void> createChat({required CreateChatRequest request}) async {
  //   var response = await _api.dio.post(
  //     '/chat/create-chat',
  //     options: Options(
  //       contentType: Headers.jsonContentType,
  //     ),
  //     data: jsonEncode(request.toJson()),
  //   );
  //   if (response.statusCode != 200) {
  //     throw ApiException(
  //       message: response.statusMessage!,
  //       statusCode: response.statusCode!,
  //     );
  //   }
  // }
  //
  // @override
  // Future<void> deleteChatHistory({
  //   required String senderId,
  //   required String recipientId,
  // }) async {
  //   var response = await _api.dio.delete(
  //     '/chat/delete-chat-history',
  //     queryParameters: {
  //       'senderId': senderId,
  //       'recipientId': recipientId,
  //     },
  //     options: Options(
  //       contentType: Headers.jsonContentType,
  //     ),
  //   );
  //   if (response.statusCode != 200) {
  //     throw ApiException(
  //       message: response.statusMessage!,
  //       statusCode: response.statusCode!,
  //     );
  //   }
  // }
  //
  // @override
  // Future<List<ChatMessage>> getChatHistory({
  //   required String recipientId,
  //   required int pageNumber,
  //   required int pageSize,
  // }) async {
  //   var response = await _api.dio.get(
  //     '/chat/get-chat-history',
  //     queryParameters: {
  //       'recipientId': recipientId,
  //       'pageNumber': pageNumber,
  //       'pageSize': pageSize,
  //     },
  //     options: Options(
  //       contentType: Headers.jsonContentType,
  //     ),
  //   );
  //   if (response.statusCode == 200) {
  //     List<dynamic> data = response.data['data'] ?? [];
  //     return data.map((json) => ChatMessage.fromJson(json)).toList();
  //   } else {
  //     throw ApiException(
  //       message: response.statusMessage!,
  //       statusCode: response.statusCode!,
  //     );
  //   }
  // }
  //
  // @override
  // Future<void> deleteChatMessage({
  //   required String id,
  //   required String senderId,
  //   required String recipientId,
  // }) async {
  //   var response = await _api.dio.delete(
  //     '/chat/delete-chat-message',
  //     queryParameters: {
  //       'id': id,
  //       'senderId': senderId,
  //       'recipientId': recipientId,
  //     },
  //     options: Options(
  //       contentType: Headers.jsonContentType,
  //     ),
  //   );
  //   if (response.statusCode != 200) {
  //     throw ApiException(
  //       message: response.statusMessage!,
  //       statusCode: response.statusCode!,
  //     );
  //   }
  // }
  //
  // @override
  // Future<List<ChatRecipient>> getAllRecipients({
  //   required int pageNumber,
  //   required int pageSize,
  // }) async {
  //   var response = await _api.dio.get(
  //     '/chat/get-all-recipients',
  //     queryParameters: {
  //       'pageNumber': pageNumber,
  //       'pageSize': pageSize,
  //     },
  //     options: Options(
  //       contentType: Headers.jsonContentType,
  //     ),
  //   );
  //   if (response.statusCode == 200) {
  //     List<dynamic> data = response.data['data'] ?? [];
  //     return data.map((json) => ChatRecipient.fromJson(json)).toList();
  //   } else {
  //     throw ApiException(
  //       message: response.statusMessage!,
  //       statusCode: response.statusCode!,
  //     );
  //   }
  // }
  //
  // @override
  // Future<void> sendMediaFile({
  //   required String chatId,
  //   required File file,
  // }) async {
  //   var formData = FormData.fromMap({
  //     'chatId': chatId,
  //     'file': await MultipartFile.fromFile(file.path),
  //   });
  //   var response = await _api.dio.post(
  //     '/chat/send-media-file',
  //     data: formData,
  //     options: Options(
  //       contentType: Headers.formUrlEncodedContentType,
  //     ),
  //   );
  //   if (response.statusCode != 200) {
  //     throw ApiException(
  //       message: response.statusMessage!,
  //       statusCode: response.statusCode!,
  //     );
  //   }
  // }
}
