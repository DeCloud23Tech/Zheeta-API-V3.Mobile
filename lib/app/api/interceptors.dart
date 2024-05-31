import 'package:dio/dio.dart';
import 'package:zheeta/app/common/storage/token_storage/i_token_storage.dart';

class AppInterceptors extends Interceptor {
  final Dio dio;
  
  final ITokenStorage _credentialStorage;

  AppInterceptors(
    this.dio, 
    this._credentialStorage,
  );

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final credentials = await _credentialStorage.read();
    final modifiedOptions = options
      ..headers.addAll(
        credentials == null
            ? {}
            : {'Authorization': 'bearer ${credentials.token}'},
      );
    handler.next(modifiedOptions);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    handler.next(response);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    final errorResponse = err.response;
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        handler.next(err);
        break;
      case DioExceptionType.sendTimeout:
        handler.next(err);
        break;
      case DioExceptionType.receiveTimeout:
        handler.next(err);
        // notify(NavigationService.navigatorKey.currentContext,
        //     NotificationType.Error, 'Response Timeout');
        break;
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 401:
            await unAuthorizedMethod(errorResponse, handler, err);
            break;
          case 404:
            handler.next(err);
            break;
          case 400:
            handler.next(err);
            break;
          case 502:
            handler.next(err);
          //handler.next(err);
          // Handle BadRequest
        }
        break;
      case DioExceptionType.cancel:
        handler.next(err);
        break;
      case DioExceptionType.connectionError:
        handler.next(err);
        break;
      //throw NoInternetConnectionException(err.requestOptions);
      case DioExceptionType.badCertificate:
        handler.next(err);
        break;
      case DioExceptionType.unknown:
        handler.next(err);
        break;
    }
  }

  Future<void> unAuthorizedMethod(Response<dynamic>? errorResponse,
      ErrorInterceptorHandler handler, DioException err) async {
    if (errorResponse != null && errorResponse.statusCode == 401) {
      //get the credentials
      // var creds = await _authenticationRepository.GetSignedInCredentials();
      //
      // Credentials? theCreds;
      //
      // creds.fold(
      //   (l) {
      //     NavigationService.navigatorKey.currentContext!
      //         .read<AuthenticationBloc>()
      //         .add(UnAuthenticatedEvent());
      //   },
      //   (credential) => theCreds = credential,
      // );
      //
      // if (theCreds != null) {
      //   if (theCreds!.canRefresh && theCreds!.isExpired) {
      //     //await _authenticator.ClearCredentialsStorage();
      //     // NavigationService.navigatorKey.currentContext!
      //     //     .read<AuthenticationBloc>()
      //     //     .add(UnAuthenticatedEvent());
      //     // Navigator.of(NavigationService.navigatorKey.currentContext!)
      //     //     .pushNamedAndRemoveUntil(PINLOGINPAGE, (route) => false);
      //
      //     Navigator.of(NavigationService.navigatorKey.currentContext!).push(
      //       MaterialPageRoute(
      //         builder: (context) => VerifyLoginPage(
      //           goingBack: true,
      //         ),
      //       ),
      //     );
      //   } else {
      //     await _authenticator.ClearCredentialsStorage();
      //
      //     NavigationService.navigatorKey.currentContext!
      //         .read<AuthenticationBloc>()
      //         .add(UnAuthenticatedEvent());
      //   }
      // }
      // print('Unauthorized clearing creds');

      // final credentials = await _authenticator.getSignedIdCredentials();

      // if (credentials == null) {
      //   await _authenticator.clearCredentialsStorage();
      //   //await _authNotifier.checkAndUpdateAuthStatus();
      //   handler.next(err);
      // } else {
      //   handler.resolve(
      //     await dio.fetch(
      //       errorResponse.requestOptions
      //         ..headers['Authorization'] = 'bearer ${credentials.accessToken}',
      //     ),
      //   );
      // }
    } else {
      handler.next(err);
    }
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}
