// import 'dart:async'; // For FutureOr
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart'; // For debugPrint
// import 'package:injectable/injectable.dart'; // Add this for injectable annotation
//
// @LazySingleton() // Make it injectable, so you can inject it into Api class
// class RetryOnConnectionChangeInterceptor extends Interceptor {
//   final Dio _dio; // Inject the main Dio instance
//   final int retries;
//
//   RetryOnConnectionChangeInterceptor(@Named('auth_dio') this._dio,
//       {this.retries = 3});
//
//   @override
//   Future<void> onError(
//       DioException err, ErrorInterceptorHandler handler) async {
//     // Check if the current request has exhausted its retries *for this interceptor*
//     final int currentRetries = err.requestOptions.extra['retry_count'] ?? 0;
//
//     // Only retry if it's a network-related error AND we haven't exhausted retries
//     if (_shouldRetry(err) && currentRetries < retries) {
//       debugPrint(
//           'Retrying request due to connection issue (${currentRetries + 1}/$retries)');
//
//       // Increment retry count and store it back in request options extra
//       err.requestOptions.extra['retry_count'] = currentRetries + 1;
//
//       // Delay before retrying (simple linear backoff for now)
//       // Consider exponential backoff: await Future.delayed(Duration(seconds: 1 * (currentRetries + 1)));
//       await Future.delayed(const Duration(seconds: 1));
//
//       try {
//         // Re-execute the original request using the INJECTED _dio instance.
//         // This ensures all other interceptors (like AppInterceptors) are also applied.
//         final response = await _dio.fetch(err.requestOptions);
//         return handler
//             .resolve(response); // Resolve with the successful retry response
//       } on DioException catch (e) {
//         // If the retry itself failed, pass that error to the next handler
//         // This ensures the error is not swallowed if all retries ultimately fail
//         return handler.next(e);
//       }
//     }
//
//     // If no retry condition met, or retries exhausted, pass the original error
//     return handler.next(err);
//   }
//
//   bool _shouldRetry(DioException err) {
//     // Check for specific DioExceptionTypes related to network issues
//     // `err.response == null` is a strong indicator of a network issue
//     return err.type == DioExceptionType.connectionTimeout ||
//         err.type == DioExceptionType.sendTimeout ||
//         err.type == DioExceptionType.receiveTimeout ||
//         err.type == DioExceptionType.connectionError ||
//         err.type ==
//             DioExceptionType
//                 .unknown || // 'unknown' can often be a network issue
//         err.response ==
//             null; // Explicitly check if no response was received (network failure)
//   }
// }
