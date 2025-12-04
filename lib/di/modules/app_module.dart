// // di.dart or a dedicated injectable module file (e.g., app_module.dart)
// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// // These imports are for your classes, not for the module to provide them anymore
// // import 'package:zheeta/core/network/api.dart'; // No longer needed here
// // import 'package:zheeta/core/network/interceptors/app_interceptors.dart'; // No longer needed here
// // import 'package:zheeta/core/network/interceptors/retry_on_connection_change_interceptor.dart'; // No longer needed here
// // import 'package:zheeta/core/storage/token_storage/i_token_storage.dart'; // No longer needed here
// // import 'package:zheeta/features/authentication/domain/repositories/user_auth_repository.dart'; // No longer needed here
//
// @module
// abstract class AppModule {
//   // 1. Register Dio itself
//   // @lazySingleton
//   // Dio get dio {
//   //   final dio = Dio();
//   //   // No need to add interceptors here. They will be injected into Api class constructor.
//   //   return dio;
//   // }
//
//   // 2. Register PrettyDioLogger (since it's a third-party class)
//   @lazySingleton
//   PrettyDioLogger prettyDioLogger() => PrettyDioLogger(
//         requestHeader: true,
//         requestBody: true,
//         responseHeader: true,
//         responseBody: true,
//         error: true,
//         compact: false,
//         maxWidth: 90,
//       );
//
// // IMPORTANT:
// // REMOVE (OR COMMENT OUT) THE FOLLOWING GETTERS/METHODS FROM HERE:
// // - appInterceptors
// // - retryOnConnectionChangeInterceptor
// // - api
// // These classes will be registered directly via their own @LazySingleton annotations.
// // Example of what to remove:
// // @lazySingleton
// // AppInterceptors appInterceptors(Dio dio, ITokenStorage tokenStorage, IUserAuthRepository userAuthRepository,) => AppInterceptors(dio, tokenStorage, userAuthRepository);
// //
// // @lazySingleton
// // RetryOnConnectionChangeInterceptor retryOnConnectionChangeInterceptor(Dio dio) => RetryOnConnectionChangeInterceptor(dio);
// //
// // @lazySingleton
// // Api api( Dio dio, AppInterceptors appInterceptors, RetryOnConnectionChangeInterceptor retryInterceptor, PrettyDioLogger prettyDioLogger,) => Api(dio, appInterceptors, retryInterceptor, prettyDioLogger);
// }
