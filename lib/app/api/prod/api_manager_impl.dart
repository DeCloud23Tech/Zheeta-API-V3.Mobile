import 'dart:developer' as logger;

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/api/dio_module.dart';
import 'package:zheeta/app/api/formatted_response.dart';
import 'package:zheeta/app/common/notify/notify_user.dart';

@prod
@Injectable(as: ApiManager)
class ApiManagerImpl implements ApiManager {
  final DioModule _dioModule;
  late Dio _dio;
  ApiManagerImpl(this._dioModule) {
    _dio = _dioModule.dio();
    _dio
      ..interceptors.add(
        DioCacheInterceptor(
          options: CacheOptions(
            store: MemCacheStore(maxEntrySize: 1000000, maxSize: 5000000),
            policy: CachePolicy.request,
            maxStale: const Duration(days: 30),
            priority: CachePriority.high,
            cipher: null,
            keyBuilder: CacheOptions.defaultCacheKeyBuilder,
            allowPostMethod: false,
          ),
        ),
      );
  }

  //GET
  @override
  Future<FormattedResponse> getHttp(String route, {Map<String, dynamic>? body, Map<String, dynamic>? params, bool formdata = false, String? token}) async {
    setHeader(formdata: formdata, token: token);
    params?.removeWhere((key, value) => value == null);
    final fullRoute = '${_dio.options.baseUrl}$route';
    return makeRequest(_dio.get(
      fullRoute,
      data: body,
      queryParameters: params,
    ));
  }

  //POST
  @override
  Future<FormattedResponse> postHttp(String route, dynamic body, {Map<String, dynamic>? params, bool formdata = false, bool formEncoded = false, String? token, void Function({int count, int total})? onSendProgress, void Function({int count, int total})? onRecieveProgress}) async {
    setHeader(formdata: formdata, formEncoded: formEncoded, token: token);
    params?.removeWhere((key, value) => value == null);
    final fullRoute = '${_dio.options.baseUrl}$route';
    if (formdata) {
      body = FormData.fromMap(body as Map<String, dynamic>);
    }

    logger.log('Request Path: $route, Request Data: $body');

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
    final fullRoute = '${_dio.options.baseUrl}$route';
    if (formdata) {
      body = FormData.fromMap(body as Map<String, dynamic>);
    }

    logger.log('Request Path: $route, Request Data: $body');

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
    final fullRoute = '${_dio.options.baseUrl}$route';

    return makeRequest(_dio.delete(
      fullRoute,
      data: body,
      queryParameters: params,
    ));
  }

  @override
  Future<FormattedResponse> makeRequest(Future<Response> future) async {
    Response? response;
    String? message;
    try {
      response = await future;
      logger.log('Response Path: ${response.realUri.path}, Data Response: ${response.data} \n\n');
      logger.log('\n');
    } on DioException catch (e) {
      if (kDebugMode) {
        logger.log('Error Path: ${e.response?.realUri.path}, Error Response: ${e.message}, Error Type: ${e.type}, Error Data: ${e.response?.data}');
        logger.log('\n');
      }
      if (e.message.toString().contains('The connection errored')) {
        NotifyUser.showSnackbar('No internet connection');
        return FormattedResponse(
          success: false,
          message: 'No internet connection',
          statusCode: e.response?.statusCode,
        );
      } else if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.sendTimeout) {
        return FormattedResponse(
          success: false,
          message: 'Connection timeout',
          statusCode: e.response?.statusCode,
        );
      } else if (e.response?.statusCode == 401) {
        return FormattedResponse(
          success: false,
          message: 'Unauthorized action',
          statusCode: e.response?.statusCode,
        );
      } else if (e.response?.statusCode == 404) {
        return FormattedResponse(
          success: false,
          message: 'Resource not found',
          statusCode: e.response?.statusCode,
        );
      } else if (e.response?.statusCode == 500 || e.response?.statusCode == 403) {
        return FormattedResponse(
          success: false,
          message: 'Internal server error',
          statusCode: e.response!.statusCode,
        );
      } else if (e.response?.statusCode == 400) {
        return FormattedResponse(
          success: false,
          message: 'Bad request',
          statusCode: e.response?.statusCode,
        );
      } else if (e.type == DioExceptionType.badResponse || e.type == DioExceptionType.unknown) {
        return FormattedResponse(
          success: false,
          message: 'Bad response',
          statusCode: e.response?.statusCode,
        );
      }
    } catch (err) {
      if (err is DioException) {
        return FormattedResponse(
          success: false,
          message: 'Something went wrong',
          statusCode: response?.statusCode,
        );
      }
    }

    if (response?.data['message'] != 'Failed to Create Data') {
      message = response?.data['message'];
    }

    if (response?.data['statusCode'] == 200 || response?.data['statusCode'] == 201) {
      return FormattedResponse(
        success: true,
        message: message.toString(),
        data: response?.data,
        statusCode: response?.statusCode,
      );
    } else if (response?.data['statusCode'] == 401) {
      return FormattedResponse(
        success: false,
        message: message ?? 'Unauthorized action',
        data: response?.data['data'],
        statusCode: response?.statusCode,
      );
    } else if (response?.data['statusCode'] == 404) {
      return FormattedResponse(
        success: false,
        message: message ?? 'Resource not found',
        data: response?.data['data'],
        statusCode: response?.statusCode,
      );
    } else if (response?.data['statusCode'] == 500 || response?.data['statusCode'] == 403) {
      return FormattedResponse(
        success: false,
        message: message ?? 'Internal server error',
        data: response?.data['data'],
        statusCode: response?.statusCode,
      );
    } else if (response?.data['statusCode'] == 500 || response?.data['statusCode'] == 400) {
      return FormattedResponse(
        success: false,
        message: message ?? 'Bad request',
        data: response?.data['data'],
        statusCode: response?.statusCode,
      );
    } else {
      return FormattedResponse(
        success: false,
        message: message.toString(),
        data: response?.data['data'],
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
      'Authorization': 'Bearer $token',
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
