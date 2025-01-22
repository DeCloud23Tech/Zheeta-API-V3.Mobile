import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:zheeta/common/constants/keys.dart';
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
    var dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    ));

    // Add interceptors
    dio.interceptors.addAll([
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
