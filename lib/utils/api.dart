import 'package:dio/dio.dart';
import 'package:zheeta/constants/keys.dart';
import 'package:zheeta/utils/interceptor.dart';

class Api {
  final dio = createDio();
  final tokenDio = Dio(BaseOptions(baseUrl: baseUrl));

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: Duration(seconds: 15), // 15 seconds
      connectTimeout: Duration(seconds: 15),
      sendTimeout: Duration(seconds: 15),
    ));

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    return dio;
  }
}
