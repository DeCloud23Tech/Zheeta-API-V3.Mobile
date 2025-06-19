import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/services/api/api_manager.dart';
import 'package:zheeta/features/messages/data/datasource/chat_datasource.dart';
import 'package:zheeta/features/messages/data/model/chat_history_model.dart';
import 'package:zheeta/features/messages/data/model/chat_recipients_model.dart';
import 'package:zheeta/features/messages/data/model/message_model.dart';
import 'package:zheeta/features/messages/data/request/create_chat_request.dart';

@prod
@Singleton(as: ChatDataSource)
class ChatDataSourceImpl implements ChatDataSource {
  final Api _api;

  ChatDataSourceImpl(this._api);

  @override
  Future<MessageModel> createChat({required CreateChatRequest request}) async {
    var response = await _api.dio.post(
      '/chat/create-chat',
      options: Options(contentType: Headers.jsonContentType),
      data: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200 && response.data?['statusCode'] == 201) {
      return MessageModel.fromJson(response.data['data']);
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: response.data?['message'] ?? 'Unknown error occurred',
      );
    }
  }

  @override
  Future<void> deleteChatHistory({
    required String senderId,
    required String recipientId,
  }) async {
    var response = await _api.dio.delete(
      '/chat/delete-chat-history',
      data: {
        'senderId': senderId,
        'recipientId': recipientId,
      },
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode != 200) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: response.data?['message'] ?? 'Unknown error occurred',
      );
    }
  }

  @override
  Future<void> deleteChatMessage(
      {required String id,
      required String senderId,
      required String recipientId}) async {
    var response = await _api.dio.delete(
      '/chat/delete-chat-message',
      data: {
        'Id': id,
        'senderId': senderId,
        'recipientId': recipientId,
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
  Future<ChatRecipients> getAllRecipients(
      {required int pageNumber, required int pageSize}) async {
    var response = await _api.dio.get(
      '/chat/get-all-recipients?PageNumber=$pageNumber&PageSize=$pageSize',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      final List<dynamic> dataList = response.data['data'] ?? [];
      final List<Recipient> data = dataList
          .map((item) => Recipient.fromJson(item as Map<String, dynamic>))
          .toList();
      return ChatRecipients(data: data);
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<ChatHistory> getChatHistory(
      {required String recipientId,
      required int pageNumber,
      required int pageSize}) async {
    var response = await _api.dio.get(
      '/chat/get-chat-history?recipientId=$recipientId&PageNumber=$pageNumber&PageSize=$pageSize',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      final List<dynamic> dataList = response.data['data'] ?? [];
      final List<Message> data = dataList
          .map((item) => Message.fromJson(item as Map<String, dynamic>))
          .toList();
      return ChatHistory(data: data);
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<MessageModel> sendMediaFile({
    String? message,
    required String recipientId,
    required String senderId,
    required File file,
  }) async {
    // Prepare FormData for file upload
    FormData formData = FormData.fromMap({
      'message': message,
      'recipientId': recipientId,
      'senderId': senderId,
      'mediaFile': await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last),
    });

    var response = await _api.dio.post(
      '/chat/send-media-file',
      options: Options(contentType: Headers.multipartFormDataContentType),
      data: formData,
    );


    // Ensure the response status is OK
    if (response.statusCode == 200 && response.data?['statusCode'] == 201) {
      return MessageModel.fromJson(response.data['data']);
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: response.data?['message'] ?? 'Unknown error occurred',
      );
    }
  }
}
