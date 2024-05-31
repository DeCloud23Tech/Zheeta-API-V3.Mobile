import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/interceptors.dart';
import 'package:zheeta/app/common/keys.dart';
import 'package:zheeta/app/common/storage/token_storage/i_token_storage.dart';
import 'package:zheeta/app/injection/di.dart';

@prod
@Injectable()
class Api {
  late Dio dio = createDio();

  //final tokenDio = Dio(BaseOptions(baseUrl: baseUrl));

  Api._internal() {}

  static final Api _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    //final TopRateAuthenticator _authenticator = getIt<TopRateAuthenticator>();

    var dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: Duration(seconds: 30), // 15 seconds
      connectTimeout: Duration(seconds: 30),
      sendTimeout: Duration(seconds: 30),
    ));

    dio.interceptors.addAll({AppInterceptors(dio, locator<ITokenStorage>())});
    return dio;
  }
}

// class ApiNew {
//   late Dio dio = createDio(cachePolicy);
//
//   //final tokenDio = Dio(BaseOptions(baseUrl: baseUrl));
//
//   ApiNew({required this.cachePolicy}) {}
//
//   CachePolicy cachePolicy;
//
//   // //short getter for my variable
//   // CachePolicy? get cachePolicy => _cachePolicy;
//   //
//   // //short setter for my variable
//   // set cachePolicy(CachePolicy? value) => _cachePolicy = value;
//   //
//   // void changeCachePolicy(CachePolicy value) => _cachePolicy = value;
//
//   static Dio createDio(CachePolicy? cachePolicy) {
//     //final TopRateAuthenticator _authenticator = getIt<TopRateAuthenticator>();
//     var cacheStore = HiveCacheStore(ToprateTranferApp.tempDirectory.path,
//         hiveBoxName: appNameString);
//
//     var customCacheOptions = CacheOptions(
//       store: cacheStore,
//       policy: cachePolicy ?? CachePolicy.forceCache,
//       priority: CachePriority.high,
//       maxStale: const Duration(minutes: 5),
//       hitCacheOnErrorExcept: [401, 404],
//       keyBuilder: (request) {
//         return request.uri.toString();
//       },
//       allowPostMethod: false,
//     );
//     var dio = Dio(BaseOptions(
//       baseUrl: baseUrl,
//       receiveTimeout: Duration(seconds: 30), // 15 seconds
//       connectTimeout: Duration(seconds: 30),
//       sendTimeout: Duration(seconds: 30),
//     ));
//
//     dio.interceptors.addAll({
//       AppInterceptors(dio, sl<IAuthenticationRepository>(),
//           sl<ICredentialStorage>(), sl<IAuthenticationRepository>()),
//       DioCacheInterceptor(options: customCacheOptions)
//     });
//     return dio;
//   }
// }
