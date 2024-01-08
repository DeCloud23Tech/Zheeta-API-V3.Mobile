import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:injectable/injectable.dart';

@injectable
class DioModule {
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: 'https://test-api.zheeta.com/api',
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 60), // 60 seconds
          receiveTimeout: const Duration(seconds: 60), // 90 seconds
        ),
      )..interceptors.add(
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
