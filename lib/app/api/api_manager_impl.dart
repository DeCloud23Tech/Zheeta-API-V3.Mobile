import 'dart:developer' as logger;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/api/custom_exception.dart';
import 'package:zheeta/app/api/dio_props.dart';
import 'package:zheeta/app/api/formatted_response.dart';

@prod
@Injectable(as: ApiManager)
class ApiManagerImpl implements ApiManager {
  final Dio _dio;
  ApiManagerImpl(this._dio);

  //GET
  @override
  Future<FormattedResponse> getHttp(String route, {Map<String, dynamic>? params, bool formdata = false, String? token}) async {
    setHeader(formdata: formdata, token: token);
    params?.removeWhere((key, value) => value == null);
    final fullRoute = '$baseURL$route';
    return makeRequest(_dio.get(
      fullRoute,
      queryParameters: params,
    ));
  }

  //POST
  @override
  Future<FormattedResponse> postHttp(String route, dynamic body, {Map<String, dynamic>? params, bool formdata = false, bool formEncoded = false, String? token, void Function({int count, int total})? onSendProgress, void Function({int count, int total})? onRecieveProgress}) async {
    setHeader(formdata: formdata, formEncoded: formEncoded, token: token);
    params?.removeWhere((key, value) => value == null);
    final fullRoute = '$baseURL$route';
    if (formdata) {
      body = FormData.fromMap(body as Map<String, dynamic>);
    }

    return makeRequest(_dio.post(
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
    final fullRoute = '$baseURL$route';
    if (formdata) {
      body = FormData.fromMap(body as Map<String, dynamic>);
    }

    return makeRequest(_dio.put(
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
    final fullRoute = '$baseURL$route';

    return makeRequest(_dio.delete(
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
    } on SocketException {
      return FormattedResponse(
        success: false,
        message: 'Oops! An error occured. Please check your internet and try again.',
        responseCodeError: "Oops! An error occured. Please check your internet and try again.",
      );
    } on DioException catch (e) {
      if (kDebugMode) {
        logger.log('Error Path: ${e.response?.realUri.path}, Error Response: ${e.message}, Error Data: ${e.response?.data}');
      }
      if (e.message.toString().contains('The connection errored')) {
      } else if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.sendTimeout) {
        return FormattedResponse(
          success: e.response?.data['success'],
          message: e.response?.data['message'],
          responseCodeError: "Connection Timeout",
          statusCode: e.response?.statusCode,
        );
      } else if (e.response?.statusCode == 401) {
        return FormattedResponse(
          success: e.response?.data['success'],
          message: e.response?.data['message'],
          responseCodeError: "Unauthorized action",
          statusCode: e.response?.statusCode,
        );
      } else if (e.response?.statusCode == 404) {
        return FormattedResponse(
          success: e.response?.data['success'],
          message: e.response?.data['message'],
          responseCodeError: "Oops! Resource not found",
          statusCode: e.response?.statusCode,
        );
      } else if (e.response?.statusCode == 500 || e.response?.statusCode == 403) {
        return FormattedResponse(
          success: e.response?.data['success'],
          message: e.response?.data['message'],
          responseCodeError: "Oops! It's not you, it's us. Give us a minute and then try again.",
          statusCode: e.response!.statusCode,
        );
      } else if (e.response?.statusCode == 400) {
        return FormattedResponse(
          success: e.response?.data['success'],
          message: e.response?.data['message'],
          responseCodeError: e.response?.data['message'],
          statusCode: e.response?.statusCode,
        );
      } else if (e.type == DioExceptionType.badResponse || e.type == DioExceptionType.unknown) {
        return FormattedResponse(
          success: e.response?.data['success'],
          message: e.response?.data['message'],
          responseCodeError: "${e.error} - ${e.message}",
          statusCode: e.response?.statusCode,
        );
      }
    } catch (err) {
      if (err is DioException) {
        throw const CustomException('Something went wrong');
      }
    }
    return FormattedResponse(
      success: response?.data['success'],
      message: response?.data['message'],
      data: response?.data,
      statusCode: response?.statusCode,
    );
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

    _dio.options.headers.addAll(header);
  }

  @override
  void dispose() {
    _dio.close(force: true);
  }

  @override
  clearHeaders() {
    _dio.options.headers.clear();
  }
}
