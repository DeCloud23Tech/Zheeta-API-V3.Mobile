import 'dart:developer' as logger;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/api/custom_exception.dart';
import 'package:zheeta/app/api/dio_module.dart';
import 'package:zheeta/app/api/formatted_response.dart';
import 'package:zheeta/app/common/notify/notify_user.dart';

@prod
@Injectable(as: ApiManager)
class ApiManagerImpl implements ApiManager {
  final DioModule _dioModule;
  ApiManagerImpl(this._dioModule);

  //GET
  @override
  Future<FormattedResponse> getHttp(String route, {Map<String, dynamic>? body, Map<String, dynamic>? params, bool formdata = false, String? token}) async {
    setHeader(formdata: formdata, token: token);
    params?.removeWhere((key, value) => value == null);
    final fullRoute = '${_dioModule.dio.options.baseUrl}$route';
    return makeRequest(_dioModule.dio.get(
      fullRoute,
      data: body,
      queryParameters: params,
    ));
  }

  //POST
  @override
  Future<FormattedResponse> postHttp(String route, dynamic body, {Map<String, dynamic>? params, bool formdata = false, bool formEncoded = false, String? token, void Function({int count, int total})? onSendProgress, void Function({int count, int total})? onRecieveProgress}) async {
    logger.log('Request Path: $route, Request Data: $body');
    setHeader(formdata: formdata, formEncoded: formEncoded, token: token);
    params?.removeWhere((key, value) => value == null);
    final fullRoute = '${_dioModule.dio.options.baseUrl}$route';
    if (formdata) {
      body = FormData.fromMap(body as Map<String, dynamic>);
    }

    return makeRequest(_dioModule.dio.post(
      fullRoute,
      data: body,
      onSendProgress: (count, total) {
        if (onSendProgress != null) {
          onSendProgress(count: count, total: total);
        }
      },
      onReceiveProgress: ((count, total) {
        if (onRecieveProgress != null) {
          onRecieveProgress(count: count, total: total);
        }
      }),
      queryParameters: params,
    ));
  }

  //PUT
  @override
  Future<FormattedResponse> putHttp(String route, dynamic body, {Map<String, dynamic>? params, bool formdata = false, bool formEncoded = false, String? token}) async {
    setHeader(formdata: formdata, formEncoded: formEncoded, token: token);
    params?.removeWhere((key, value) => value == null);
    final fullRoute = '${_dioModule.dio.options.baseUrl}$route';
    if (formdata) {
      body = FormData.fromMap(body as Map<String, dynamic>);
    }

    return makeRequest(_dioModule.dio.put(
      fullRoute,
      data: body,
      queryParameters: params,
    ));
  }

  //DELETE
  @override
  Future<FormattedResponse> deleteHttp(String route, dynamic body, {Map<String, dynamic>? params, String? token}) async {
    setHeader(token: token);
    params?.removeWhere((key, value) => value == null);
    final fullRoute = '${_dioModule.dio.options.baseUrl}$route';

    return makeRequest(_dioModule.dio.delete(
      fullRoute,
      data: body,
      queryParameters: params,
    ));
  }

  @override
  Future<FormattedResponse> makeRequest(Future<Response> future) async {
    Response? response;
    try {
      response = await future;
      logger.log('Response Path: ${response.realUri.path}, Data Response: ${response.data} \n\n');
      logger.log('\n');
    } on DioException catch (e) {
      if (kDebugMode) {
        logger.log('Error Path: ${e.response?.realUri.path}, Error Response: ${e.message}, Error Data: ${e.response?.data}');
        logger.log('\n');
      }
      if (e.message.toString().contains('The connection errored')) {
        NotifyUser.showSnackbar('No internet connection');
        return FormattedResponse(
          success: false,
          message: 'No internet connection',
          responseCodeError: "No internet connection",
          statusCode: e.response?.statusCode,
        );
      } else if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.sendTimeout) {
        return FormattedResponse(
          success: false,
          message: 'Connection timeout',
          responseCodeError: "Connection timeout",
          statusCode: e.response?.statusCode,
        );
      } else if (e.response?.statusCode == 401) {
        return FormattedResponse(
          success: false,
          message: 'Unauthorized action',
          responseCodeError: "Unauthorized action",
          statusCode: e.response?.statusCode,
        );
      } else if (e.response?.statusCode == 404) {
        return FormattedResponse(
          success: false,
          message: 'Resource not found',
          responseCodeError: "Oops! Resource not found",
          statusCode: e.response?.statusCode,
        );
      } else if (e.response?.statusCode == 500 || e.response?.statusCode == 403) {
        return FormattedResponse(
          success: false,
          message: 'Internal server error',
          responseCodeError: "Oops! It's not you, it's us. Give us a minute and then try again.",
          statusCode: e.response!.statusCode,
        );
      } else if (e.response?.statusCode == 400) {
        return FormattedResponse(
          success: false,
          message: 'Bad request',
          responseCodeError: 'Couldn\'t understand the request',
          statusCode: e.response?.statusCode,
        );
      } else if (e.type == DioExceptionType.badResponse || e.type == DioExceptionType.unknown) {
        return FormattedResponse(
          success: false,
          message: 'Bad response',
          responseCodeError: 'Bad response',
          statusCode: e.response?.statusCode,
        );
      }
    } catch (err) {
      if (err is DioException) {
        throw const CustomException('Something went wrong');
      }
    }
    if (!"${response?.data['statusCode']}".startsWith('2')) {
      String message = (response?.data['message'] ?? response?.data['data']).toString();

      NotifyUser.showSnackbar(message);
      return FormattedResponse(
        success: false,
        message: message,
        data: response?.data,
        statusCode: response?.statusCode,
      );
    } else {
      return FormattedResponse(
        success: true,
        message: response?.data['message'],
        data: response?.data,
        statusCode: response?.statusCode,
      );
    }
  }

  @override
  setHeader({bool formdata = false, bool formEncoded = false, String? token}) async {
    final Map<String, dynamic> header = {
      'Content-Type': formdata
          ? 'multipart/form-data'
          : formEncoded
              ? 'application/x-www-form-urlencoded'
              : 'application/json',
      'Accept': 'application/json',
      'Authorization': token,
    };

    _dioModule.dio.options.headers.addAll(header);
  }

  @override
  void dispose() {
    _dioModule.dio.close(force: true);
  }

  @override
  clearHeaders() {
    _dioModule.dio.options.headers.clear();
  }
}
