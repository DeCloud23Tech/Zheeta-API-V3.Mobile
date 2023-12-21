import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

const baseURL = 'https://test-api.zheeta.com/api';

var cacheOptions = CacheOptions(
  store: MemCacheStore(maxEntrySize: 1000000, maxSize: 5000000),
  policy: CachePolicy.request,
  maxStale: const Duration(days: 30),
  priority: CachePriority.high,
  cipher: null,
  keyBuilder: CacheOptions.defaultCacheKeyBuilder,
  allowPostMethod: false,
);
final options = BaseOptions(
  baseUrl: baseURL,
  receiveDataWhenStatusError: true,
  connectTimeout: const Duration(seconds: 60), // 60 seconds
  receiveTimeout: const Duration(seconds: 60), // 90 seconds
  headers: {},
);
