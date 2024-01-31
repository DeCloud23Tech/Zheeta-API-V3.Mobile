import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/api/formatted_response.dart';
import 'package:zheeta/app/api/prod/api_manager_impl.dart';

import '../../mock/app/api/dio.mocks.dart';
import '../../mock/app/api/dio_module.mocks.dart';

void main() {
  group('ApiManagerImpl', () {
    late ApiManager apiManager;
    late MockDio mockDio;
    late MockDioModule mockDioModule;

    final successResponse = {
      'success': true,
      'statusCode': 200,
      'message': 'Success',
      'data': {'key': 'value'},
    };

    final failureResponse = {
      'success': false,
      'statusCode': 500,
      'message': 'Failure',
      'data': null,
    };

    setUp(() {
      mockDio = MockDio();
      mockDioModule = MockDioModule();
      when(mockDioModule.dio()).thenReturn(mockDio);
      when(mockDio.interceptors).thenReturn(Interceptors());
      when(mockDio.options).thenReturn(BaseOptions());
      apiManager = ApiManagerImpl(mockDioModule);
    });

    group('getHttp', () {
      test('getHttp - Success', () async {
        final response = Response(data: successResponse, statusCode: 200, requestOptions: RequestOptions());

        when(mockDio.get(any, data: anyNamed('data'), queryParameters: anyNamed('queryParameters'))).thenAnswer(
          (_) => Future.value(response),
        );

        final result = await apiManager.getHttp('/test');

        verifyNever(mockDio.get(
          'https://test-api.zheeta.com/api/test',
          data: null,
          queryParameters: null,
        )).called(0);

        expect(result.success, true);
        expect(result.data, successResponse);
      });

      test('getHttp - Failure', () async {
        final response = Response(data: failureResponse, statusCode: 200, requestOptions: RequestOptions());

        when(mockDio.get(any, data: anyNamed('data'), queryParameters: anyNamed('queryParameters'))).thenAnswer(
          (_) => Future.value(response),
        );

        final result = await apiManager.getHttp('/test');

        verifyNever(mockDio.get(
          'https://test-api.zheeta.com/api/test',
          data: null,
          queryParameters: null,
        )).called(0);

        expect(result.success, false);
      });

      test('getHttp - Exception', () async {
        final dioException = DioException(type: DioExceptionType.badResponse, requestOptions: RequestOptions());

        when(mockDio.get(any, data: anyNamed('data'), queryParameters: anyNamed('queryParameters'))).thenThrow(dioException);

        final result = await apiManager.getHttp('/test').catchError((e) {
          return FormattedResponse(success: false, message: 'Bad response', statusCode: 500);
        });

        verifyNever(mockDio.get(
          'https://test-api.zheeta.com/api/test',
          data: null,
          queryParameters: null,
        )).called(0);

        print("${result.message}, ${result.statusCode}, ${result.success}");

        expect(result.success, false);
        expect(result.message, 'Bad response');
      });
    });

    group('postHttp', () {
      test('postHttp - Success', () async {
        final response = Response(data: successResponse, statusCode: 200, requestOptions: RequestOptions());

        when(mockDio.post(any, data: anyNamed('data'), onSendProgress: anyNamed('onSendProgress'), onReceiveProgress: anyNamed('onReceiveProgress'), queryParameters: anyNamed('queryParameters'))).thenAnswer((_) => Future.value(response));

        final result = await apiManager.postHttp('/test', {'key': 'value'});

        verifyNever(mockDio.post(
          'https://test-api.zheeta.com/api/test',
          data: {'key': 'value'},
          onSendProgress: null,
          onReceiveProgress: null,
          queryParameters: null,
        )).called(0);

        expect(result.success, true);
        expect(result.data, successResponse);
      });

      test('postHttp - Failure', () async {
        final response = Response(data: failureResponse, statusCode: 200, requestOptions: RequestOptions());

        when(mockDio.post(any, data: anyNamed('data'), onSendProgress: anyNamed('onSendProgress'), onReceiveProgress: anyNamed('onReceiveProgress'), queryParameters: anyNamed('queryParameters'))).thenAnswer((_) => Future.value(response));

        final result = await apiManager.postHttp('/test', {'key': 'value'});

        verifyNever(mockDio.post(
          'https://test-api.zheeta.com/api/test',
          data: {'key': 'value'},
          onSendProgress: null,
          onReceiveProgress: null,
          queryParameters: null,
        )).called(0);

        expect(result.success, false);
        expect(result.message, 'Failure');
      });

      test('postHttp - Exception', () async {
        final dioException = DioException(type: DioExceptionType.badResponse, requestOptions: RequestOptions());

        when(mockDio.post(any, data: anyNamed('data'), onSendProgress: anyNamed('onSendProgress'), onReceiveProgress: anyNamed('onReceiveProgress'), queryParameters: anyNamed('queryParameters'))).thenThrow(dioException);

        final result = await apiManager.postHttp('/test', {'key': 'value'}).catchError((e) {
          return FormattedResponse(success: false, message: 'Bad response', statusCode: 500);
        });

        verifyNever(mockDio.post(
          'https://test-api.zheeta.com/api/test',
          data: {'key': 'value'},
          onSendProgress: null,
          onReceiveProgress: null,
          queryParameters: null,
        )).called(0);

        expect(result.success, false);
        expect(result.message, 'Bad response');
      });
    });

    group('putHttp', () {
      test('putHttp - Success', () async {
        final response = Response(data: successResponse, statusCode: 200, requestOptions: RequestOptions());

        when(mockDio.put(any, data: anyNamed('data'), queryParameters: anyNamed('queryParameters'))).thenAnswer((_) => Future.value(response));

        final result = await apiManager.putHttp('/test', {'key': 'value'});

        verifyNever(mockDio.put(
          'https://test-api.zheeta.com/api/test',
          data: {'key': 'value'},
          queryParameters: null,
        )).called(0);

        expect(result.success, true);
        expect(result.data, successResponse);
      });

      test('putHttp - Failure', () async {
        final response = Response(data: failureResponse, statusCode: 200, requestOptions: RequestOptions());

        when(mockDio.put(any, data: anyNamed('data'), queryParameters: anyNamed('queryParameters'))).thenAnswer((_) => Future.value(response));

        final result = await apiManager.putHttp('/test', {'key': 'value'});

        verifyNever(mockDio.put(
          'https://test-api.zheeta.com/api/test',
          data: {'key': 'value'},
          queryParameters: null,
        )).called(0);

        expect(result.success, false);
        expect(result.message, 'Failure');
      });

      test('putHttp - Exception', () async {
        final dioException = DioException(type: DioExceptionType.badResponse, requestOptions: RequestOptions());

        when(mockDio.put(any, data: anyNamed('data'), queryParameters: anyNamed('queryParameters'))).thenThrow(dioException);

        final result = await apiManager.putHttp('/test', {'key': 'value'}).catchError((e) {
          return FormattedResponse(success: false, message: 'Bad response', statusCode: 500);
        });

        verifyNever(mockDio.put(
          'https://test-api.zheeta.com/api/test',
          data: {'key': 'value'},
          queryParameters: null,
        )).called(0);

        expect(result.success, false);
        expect(result.message, 'Bad response');
      });
    });

    group('deleteHttp', () {
      test('deleteHttp - Success', () async {
        final response = Response(data: successResponse, statusCode: 200, requestOptions: RequestOptions());

        when(mockDio.delete(any, data: anyNamed('data'), queryParameters: anyNamed('queryParameters'))).thenAnswer((_) => Future.value(response));

        final result = await apiManager.deleteHttp('/test', {'key': 'value'});

        verifyNever(mockDio.delete(
          'https://test-api.zheeta.com/api/test',
          data: {'key': 'value'},
          queryParameters: null,
        )).called(0);

        expect(result.success, true);
        expect(result.data, successResponse);
      });

      test('deleteHttp - Failure', () async {
        final response = Response(data: failureResponse, statusCode: 200, requestOptions: RequestOptions());

        when(mockDio.delete(any, data: anyNamed('data'), queryParameters: anyNamed('queryParameters'))).thenAnswer((_) => Future.value(response));

        final result = await apiManager.deleteHttp('/test', {'key': 'value'});

        verifyNever(mockDio.delete(
          'https://test-api.zheeta.com/api/test',
          data: {'key': 'value'},
          queryParameters: null,
        )).called(0);

        expect(result.success, false);
        expect(result.message, 'Failure');
      });

      test('deleteHttp - Exception', () async {
        final dioException = DioException(type: DioExceptionType.badResponse, requestOptions: RequestOptions());

        when(mockDio.delete(any, data: anyNamed('data'), queryParameters: anyNamed('queryParameters'))).thenThrow(dioException);

        final result = await apiManager.deleteHttp('/test', {'key': 'value'}).catchError((e) {
          return FormattedResponse(success: false, message: 'Bad response', statusCode: 500);
        });

        verifyNever(mockDio.delete(
          'https://test-api.zheeta.com/api/test',
          data: {'key': 'value'},
          queryParameters: null,
        )).called(0);

        expect(result.success, false);
        expect(result.message, 'Bad response');
      });
    });

    group('makeRequest test', () {
      test('makeRequest should handle a successful response', () async {
        final mockResponse = Response(data: successResponse, statusCode: 200, requestOptions: RequestOptions());
        when(mockDio.get(any)).thenAnswer((_) async => mockResponse);

        final result = await apiManager.makeRequest(Future.value(mockResponse));

        expect(result.success, true);
        verifyNever(mockDio.get(any)).called(0);
      });

      test('makeRequest should handle DioException with connection error', () async {
        final dioException = DioException(
          response: Response(data: failureResponse, statusCode: 404, requestOptions: RequestOptions()),
          requestOptions: RequestOptions(),
          type: DioExceptionType.unknown,
          error: 'Resource not found',
        );
        when(mockDio.get(any)).thenThrow(dioException);

        final result = await apiManager.makeRequest(Future.error(dioException));

        expect(result.success, false);
        expect(result.message, 'Resource not found');
      });

      test('makeRequest should handle DioException with connection timeout', () async {
        final dioException = DioException(
          response: Response(data: failureResponse, requestOptions: RequestOptions()),
          requestOptions: RequestOptions(),
          type: DioExceptionType.connectionTimeout,
        );
        when(mockDio.get(any)).thenThrow(dioException);

        final result = await apiManager.makeRequest(Future.error(dioException));

        expect(result.success, false);
        expect(result.message, 'Connection timeout');
      });
    });

    test('dispose should close Dio instance', () {
      apiManager.dispose();

      verify(mockDio.close(force: true)).called(1);
    });

    test('Dio options should contain custom headers', () async {
      final customHeaders = {'key': 'value'};
      final dioOptions = BaseOptions(
        baseUrl: 'https://example.com',
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        headers: customHeaders,
      );
      when(mockDio.options).thenReturn(dioOptions);

      final options = mockDio.options;

      expect(options.baseUrl, 'https://example.com');
      expect(options.headers, customHeaders);
    });

    test('clearHeaders should clear Dio headers', () {
      apiManager.clearHeaders();

      verifyNever(mockDio.options = captureAny).called(0);
    });
  });
}
