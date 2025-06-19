import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:zheeta/common/constants/constansts.dart';
import 'package:zheeta/common/interceptors/interceptors.dart';
import 'package:zheeta/common/storage/token_storage/i_token_storage.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/features/authentication/domain/repository/user_auth_repository.dart';

@prod
@LazySingleton()
class Api {
  late Dio dio = createDio();

  Api._internal();

  static final Api _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveTimeout: const Duration(seconds: 60),
        connectTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json'
        },
      ),
    );

    dio.interceptors.addAll([
      RetryOnConnectionChangeInterceptor(retries: 3),
      AppInterceptors(
        dio,
        locator<ITokenStorage>(),
        locator<UserAuthRepository>(),
      ),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: false,
        maxWidth: 90,
      ),
    ]);

    return dio;
  }
}

class RetryOnConnectionChangeInterceptor extends Interceptor {
  final int retries;

  RetryOnConnectionChangeInterceptor({this.retries = 3});

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    int retryCount = 0;

    if (_shouldRetry(err)) {
      while (retryCount < retries) {
        retryCount++;
        try {
          // Wait before retrying (exponential backoff can be added too)
          await Future.delayed(Duration(seconds: 1 * retryCount));
          final response = await err.requestOptions
              .copyWith(extra: {'retries': retryCount}).data;
          return handler.resolve(response);
        } on DioException catch (e) {
          if (retryCount == retries || !_shouldRetry(e)) {
            return handler.next(e); // Final error
          }
        }
      }
    }

    return handler.next(err); // No retry condition met
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError;
  }
}
