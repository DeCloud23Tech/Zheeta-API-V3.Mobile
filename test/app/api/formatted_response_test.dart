import 'package:flutter_test/flutter_test.dart';
import 'package:zheeta/app/api/formatted_response.dart';

void main() {
  group('FormattedResponse', () {
    test('FormattedResponse - Success', () {
      final response = FormattedResponse(
        success: true,
        message: 'Success',
        data: {'key': 'value'},
        statusCode: 200,
      );

      expect(response.success, true);
      expect(response.message, 'Success');
      expect(response.data, {'key': 'value'});
      expect(response.statusCode, 200);
    });

    test('FormattedResponse - Failure with Data', () {
      final response = FormattedResponse(
        success: false,
        message: 'Failure with data',
        data: {'error': 'Something went wrong'},
        statusCode: 500,
      );

      expect(response.success, false);
      expect(response.message, 'Failure with data');
      expect(response.data, {'error': 'Something went wrong'});
      expect(response.statusCode, 500);
    });

    test('FormattedResponse - Failure without Data', () {
      final response = FormattedResponse(
        success: false,
        message: 'Failure without data',
        statusCode: 400,
      );

      expect(response.success, false);
      expect(response.message, 'Failure without data');
      expect(response.data, null);
      expect(response.statusCode, 400);
    });

    test('FormattedResponse - Equality', () {
      final response1 = FormattedResponse(
        success: true,
        message: 'Success',
        data: {'key': 'value'},
        statusCode: 200,
      );

      final response2 = FormattedResponse(
        success: true,
        message: 'Success',
        data: {'key': 'value'},
        statusCode: 200,
      );

      final response3 = FormattedResponse(
        success: false,
        message: 'Failure',
        data: null,
        statusCode: 400,
      );

      expect(response1, equals(response2));
      expect(response1.hashCode, equals(response2.hashCode));
      expect(response1, isNot(equals(response3)));
      expect(response2, isNot(equals(response3)));
    });

    test('FormattedResponse - toString', () {
      final response = FormattedResponse(
        success: true,
        message: 'Success',
        data: {'key': 'value'},
        statusCode: 200,
      );

      expect(
        response.toString(),
        'FormattedResponse(success: true, message: Success, data: {key: value}, statusCode: 200)',
      );
    });
  });

  group('InvalidResponse', () {
    test('InvalidResponse - Default Constructor', () {
      final invalidResponse = InvalidResponse(message: 'message');

      expect(invalidResponse.message, 'message');
    });

    test('InvalidResponse - Custom Message Constructor', () {
      final customMessage = 'Custom error message';
      final invalidResponse = InvalidResponse(message: customMessage);

      expect(invalidResponse.message, equals(customMessage));
    });

    test('InvalidResponse - Equality', () {
      final response1 = InvalidResponse(message: 'message');
      final response2 = InvalidResponse(message: 'message');
      final response3 = InvalidResponse(message: 'Custom error message');

      expect(response1, equals(response2));
      expect(response1.hashCode, equals(response2.hashCode));
      expect(response1, isNot(equals(response3)));
      expect(response2, isNot(equals(response3)));
    });

    test('InvalidResponse - toString', () {
      final invalidResponse = InvalidResponse(message: 'Custom error message');

      expect(
        invalidResponse.toString(),
        'InvalidResponse(message: Custom error message, data: null)',
      );
    });
  });
}
