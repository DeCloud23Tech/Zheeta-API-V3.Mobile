import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:zheeta/app/api/formatted_response.dart';
import 'package:zheeta/authentication/data/datasource/country_datasource.dart';
import 'package:zheeta/authentication/data/datasource/prod/country_datasource_impl.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

import '../../../mock/app/api/api_manager.mocks.dart';

void main() {
  group('CountryDataSourceImpl', () {
    late CountryDataSource countryDataSource;
    late MockApiManager mockApiManager;

    setUp(() {
      mockApiManager = MockApiManager();
      countryDataSource = CountryDataSourceImpl(mockApiManager);
    });

    group('getAllCountries', () {
      test('should return Right with MappedResponse on success', () async {
        // Arrange
        final response = FormattedResponse(success: true, data: {'key': 'value'}, message: '');
        when(mockApiManager.getHttp('/userauth/get-all-countries')).thenAnswer((_) async => response);

        // Act
        final result = await countryDataSource.getAllCountries();

        // Assert
        expect(result, equals(Right(response.data)));
        verify(mockApiManager.getHttp('/userauth/get-all-countries'));
        verifyNoMoreInteractions(mockApiManager);
      });

      test('should return Left with ErrorResponse on failure', () async {
        // Arrange
        final errorMessage = 'Error message';
        final response = FormattedResponse(success: false, message: errorMessage);
        when(mockApiManager.getHttp('/userauth/get-all-countries')).thenAnswer((_) async => response);

        // Act
        final result = await countryDataSource.getAllCountries();

        // Assert
        expect(
          result,
          equals(Left(ErrorResponse(message: errorMessage))),
        );
        verify(mockApiManager.getHttp('/userauth/get-all-countries'));
        verifyNoMoreInteractions(mockApiManager);
      });
    });

    group('getCountryDetails', () {
      test('should return Right with MappedResponse on success', () async {
        // Arrange
        final response = FormattedResponse(success: true, data: {'key': 'value'}, message: '');
        when(mockApiManager.getHttp('/userauth/get-all-country-details/US')).thenAnswer((_) async => response);

        // Act
        final result = await countryDataSource.getCountryDetails('US');

        // Assert
        expect(result, equals(Right(response.data)));
        verify(mockApiManager.getHttp('/userauth/get-all-country-details/US'));
        verifyNoMoreInteractions(mockApiManager);
      });

      test('should return Left with ErrorResponse on failure', () async {
        // Arrange
        final errorMessage = 'Error message';
        final response = FormattedResponse(success: false, message: errorMessage);
        when(mockApiManager.getHttp('/userauth/get-all-country-details/US')).thenAnswer((_) async => response);

        // Act
        final result = await countryDataSource.getCountryDetails('US');

        // Assert
        expect(
          result,
          equals(Left(ErrorResponse(message: errorMessage))),
        );
        verify(mockApiManager.getHttp('/userauth/get-all-country-details/US'));
        verifyNoMoreInteractions(mockApiManager);
      });
    });
  });
}
