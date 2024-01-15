import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:zheeta/app/api/formatted_response.dart';
import 'package:zheeta/authentication/data/datasource/prod/user_otp_datasource_impl.dart';
import 'package:zheeta/authentication/data/datasource/user_otp_datasource.dart';
import 'package:zheeta/authentication/data/request/verify_email_otp_request.dart';
import 'package:zheeta/authentication/data/request/verify_phone_otp_request.dart';

import '../../../mock/app/api/api_manager.mocks.dart';

void main() {
  group('UserOtpDatasourceImpl', () {
    late UserOtpDataSource datasource;
    late MockApiManager mockApiManager;

    setUp(() {
      mockApiManager = MockApiManager();
      datasource = UserOtpDataSourceImpl(mockApiManager);
    });

    group('sendEmailVerifyOtp', () {
      test('should return Right with MappedResponse on success', () async {
        // Arrange
        final email = 'email@example.com';
        final response = FormattedResponse(success: true, data: {'key': 'value'}, message: '');
        when(mockApiManager.postHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.sendEmailVerifyOtp(email);

        // Assert
        expect(result, equals(Right(response.data)));
        verify(mockApiManager.postHttp('/userauth/send-email-verifyOtp/$email', null));
        verifyNoMoreInteractions(mockApiManager);
      });

      test('should return Left with error message on failure', () async {
        // Arrange
        final email = 'email@example.com';
        final errorMessage = 'Error message';
        final response = FormattedResponse(success: false, message: errorMessage);
        when(mockApiManager.postHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.sendEmailVerifyOtp(email);

        // Assert
        expect(result, equals(Left(errorMessage)));
        verify(mockApiManager.postHttp('/userauth/send-email-verifyOtp/$email', null));
        verifyNoMoreInteractions(mockApiManager);
      });
    });

    group('sendPhoneVerifyOtp', () {
      test('should return Right with MappedResponse on success', () async {
        // Arrange
        final phoneNumber = '1234567890';
        final response = FormattedResponse(success: true, data: {'key': 'value'}, message: '');
        when(mockApiManager.postHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.sendPhoneVerifyOtp(phoneNumber);

        // Assert
        expect(result, equals(Right(response.data)));
        verify(mockApiManager.postHttp('/userauth/send-phoneno-verifyOtp/$phoneNumber', null));
        verifyNoMoreInteractions(mockApiManager);
      });

      test('should return Left with error message on failure', () async {
        // Arrange
        final phoneNumber = '1234567890';
        final errorMessage = 'Error message';
        final response = FormattedResponse(success: false, message: errorMessage);
        when(mockApiManager.postHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.sendPhoneVerifyOtp(phoneNumber);

        // Assert
        expect(result, equals(Left(errorMessage)));
        verify(mockApiManager.postHttp('/userauth/send-phoneno-verifyOtp/$phoneNumber', null));
        verifyNoMoreInteractions(mockApiManager);
      });
    });

    group('verifyPhoneOtp', () {
      test('should return Right with MappedResponse on success', () async {
        // Arrange
        final request = VerifyPhoneOtpRequest(phoneNumber: '1234567890', otp: '123456');
        final response = FormattedResponse(success: true, data: {'key': 'value'}, message: '');
        when(mockApiManager.postHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.verifyPhoneOtp(request);

        // Assert
        expect(result, equals(Right(response.data)));
        verify(mockApiManager.postHttp('/userauth/verify-phone-otp', request.toJson()));
        verifyNoMoreInteractions(mockApiManager);
      });

      test('should return Left with error message on failure', () async {
        // Arrange
        final request = VerifyPhoneOtpRequest(phoneNumber: '1234567890', otp: '123456');
        final errorMessage = 'Error message';
        final response = FormattedResponse(success: false, message: errorMessage);
        when(mockApiManager.postHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.verifyPhoneOtp(request);

        // Assert
        expect(result, equals(Left(errorMessage)));
        verify(mockApiManager.postHttp('/userauth/verify-phone-otp', request.toJson()));
        verifyNoMoreInteractions(mockApiManager);
      });
    });

    group('verifyEmailOtp', () {
      test('should return Right with MappedResponse on success', () async {
        // Arrange
        final request = VerifyEmailOtpRequest(email: 'test@example.com', otp: '123456');
        final response = FormattedResponse(success: true, data: {'key': 'value'}, message: '');
        when(mockApiManager.postHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.verifyEmailOtp(request);

        // Assert
        expect(result, equals(Right(response.data)));
        verify(mockApiManager.postHttp('/userauth/verify-email-otp', request.toJson()));
        verifyNoMoreInteractions(mockApiManager);
      });

      test('should return Left with error message on failure', () async {
        // Arrange
        final request = VerifyEmailOtpRequest(email: 'test@example.com', otp: '123456');
        final errorMessage = 'Error message';
        final response = FormattedResponse(success: false, message: errorMessage);
        when(mockApiManager.postHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.verifyEmailOtp(request);

        // Assert
        expect(result, equals(Left(errorMessage)));
        verify(mockApiManager.postHttp('/userauth/verify-email-otp', request.toJson()));
        verifyNoMoreInteractions(mockApiManager);
      });
    });

    group('sendResetPasswordOtp', () {
      test('should return Right with MappedResponse on success', () async {
        // Arrange
        final email = 'joe@gmail.com';
        final response = FormattedResponse(success: true, data: {'key': 'value'}, message: '');
        when(mockApiManager.postHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.sendPasswordResetOtp(email);

        // Assert
        expect(result, equals(Right(response.data)));
        verify(mockApiManager.postHttp('/userauth/send-password-reset-otp-to-email/$email', null));
        verifyNoMoreInteractions(mockApiManager);
      });

      test('should return Left with error message on failure', () async {
        // Arrange
        final email = 'joe@gmail.com';
        final errorMessage = 'Error message';
        final response = FormattedResponse(success: false, message: errorMessage);
        when(mockApiManager.postHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.sendPasswordResetOtp(email);

        // Assert
        expect(result, equals(Left(errorMessage)));
        verify(mockApiManager.postHttp('/userauth/send-password-reset-otp-to-email/$email', null));
        verifyNoMoreInteractions(mockApiManager);
      });
    });

    group('resetPassword', () {
      test('should return Right with MappedResponse on success', () async {
        // Arrange
        final phoneNumber = '1234567890';
        final response = FormattedResponse(success: true, data: {'key': 'value'}, message: '');
        when(mockApiManager.postHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.resetPassword(phoneNumber);

        // Assert
        expect(result, equals(Right(response.data)));
        verify(mockApiManager.postHttp('/userauth/send-phoneno-verifyOtp/$phoneNumber', null));
        verifyNoMoreInteractions(mockApiManager);
      });

      test('should return Left with error message on failure', () async {
        // Arrange
        final phoneNumber = '1234567890';
        final errorMessage = 'Error message';
        final response = FormattedResponse(success: false, message: errorMessage);
        when(mockApiManager.postHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.resetPassword(phoneNumber);

        // Assert
        expect(result, equals(Left(errorMessage)));
        verify(mockApiManager.postHttp('/userauth/send-phoneno-verifyOtp/$phoneNumber', null));
        verifyNoMoreInteractions(mockApiManager);
      });
    });
  });
}
