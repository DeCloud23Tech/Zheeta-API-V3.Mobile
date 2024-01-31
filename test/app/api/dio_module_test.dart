import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zheeta/app/api/dio_module.dart';

void main() {
  group('DioModule', () {
    late DioModule dioModule;

    setUp(() {
      dioModule = DioModule();
    });

    test('Should return an instance of Dio', () {
      final dio = dioModule.dio();

      expect(dio, isA<Dio>());
      expect(dio.options.baseUrl, 'https://test-api.zheeta.com/api');
    });
  });
}
