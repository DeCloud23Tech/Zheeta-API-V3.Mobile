import 'package:dio/dio.dart';
import 'package:zheeta/app/api/formatted_response.dart';

abstract class ApiManager {
  Future<FormattedResponse> getHttp(String route, {Map<String, dynamic>? params, bool formdata = false, String? token});

  Future<FormattedResponse> postHttp(String route, dynamic body, {Map<String, dynamic>? params, bool formdata = false, bool formEncoded = false, String? token, void Function({int count, int total})? onSendProgress, void Function({int count, int total})? onRecieveProgress});

  Future<FormattedResponse> putHttp(String route, dynamic body, {Map<String, dynamic>? params, bool formdata = false, bool formEncoded = false, String? token});

  Future<FormattedResponse> deleteHttp(String route, dynamic body, {Map<String, dynamic>? params, String? token});

  Future<FormattedResponse> makeRequest(Future<Response> future);

  setHeader({bool formdata = false, bool formEncoded = false, String? token});

  void dispose();

  clearHeaders();
}
