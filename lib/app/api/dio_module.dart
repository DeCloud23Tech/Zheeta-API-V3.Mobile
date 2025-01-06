import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class DioModule {
  Dio dio() => Dio(
        BaseOptions(
          baseUrl: 'https://test.zheeta.com/api',
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 60), // 60 seconds
          receiveTimeout: const Duration(seconds: 60), // 90 seconds
          headers: {},
        ),
      );
}
