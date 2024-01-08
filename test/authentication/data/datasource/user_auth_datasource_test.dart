import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:zheeta/app/api/formatted_response.dart';
import 'package:zheeta/authentication/data/datasource/prod/user_auth_datasource_impl.dart';
import 'package:zheeta/authentication/data/datasource/user_auth_datasource.dart';
import 'package:zheeta/authentication/data/request/change_password_request.dart';
import 'package:zheeta/authentication/data/request/login_oauth_request.dart';
import 'package:zheeta/authentication/data/request/login_request.dart';
import 'package:zheeta/authentication/data/request/register_staff_request.dart';
import 'package:zheeta/authentication/data/request/register_user_request.dart';
import 'package:zheeta/authentication/data/request/reset_password_request.dart';

import '../../../mock/app/api/api_manager.mocks.dart';

void main() {
  group('UserAuthDatasourceImpl', () {
    late UserAuthDataSource datasource;
    late MockApiManager mockApiManager;

    setUp(() {
      mockApiManager = MockApiManager();
      datasource = UserAuthDataSourceImpl(mockApiManager);
    });

    group('changePassword', () {
      test('should return Right with MappedResponse on success', () async {
        // Arrange
        final request = ChangePasswordRequest(newPassword: 'newPassword', oldPassword: 'oldPassword');
        final response = FormattedResponse(success: true, data: {'key': 'value'}, message: '');
        when(mockApiManager.postHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.changePassword(request);

        // Assert
        expect(result, equals(Right(response.data)));
        verify(mockApiManager.postHttp('/userauth/change-password', request.toJson()));
        verifyNoMoreInteractions(mockApiManager);
      });

      test('should return Left with error message on failure', () async {
        // Arrange
        final request = ChangePasswordRequest(newPassword: 'newPassword', oldPassword: 'oldPassword');
        final errorMessage = 'Error message';
        final response = FormattedResponse(success: false, message: errorMessage);
        when(mockApiManager.postHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.changePassword(request);

        // Assert
        expect(result, equals(Left(errorMessage)));
        verify(mockApiManager.postHttp('/userauth/change-password', request.toJson()));
        verifyNoMoreInteractions(mockApiManager);
      });
    });

    group('registerUser', () {
      test('should return Right with MappedResponse on success', () async {
        // Arrange
        final request = RegisterUserRequest(
          userName: 'username',
          password: 'password',
          email: 'email@example.com',
          phoneNumber: '1234567890',
          phoneCountryCode: '+1',
        );
        final response = FormattedResponse(success: true, data: {'key': 'value'}, message: '');
        when(mockApiManager.postHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.registerUser(request);

        // Assert
        expect(result, equals(Right(response.data)));
        verify(mockApiManager.postHttp('/userauth/register-user', request.toJson()));
        verifyNoMoreInteractions(mockApiManager);
      });

      test('should return Left with error message on failure', () async {
        // Arrange
        final request = RegisterUserRequest(
          userName: 'username',
          password: 'password',
          email: 'email@example.com',
          phoneNumber: '1234567890',
          phoneCountryCode: '+1',
        );
        final errorMessage = 'Error message';
        final response = FormattedResponse(success: false, message: errorMessage);
        when(mockApiManager.postHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.registerUser(request);

        // Assert
        expect(result, equals(Left(errorMessage)));
        verify(mockApiManager.postHttp('/userauth/register-user', request.toJson()));
        verifyNoMoreInteractions(mockApiManager);
      });
    });

    group('login', () {
      test('should return Right with MappedResponse on success', () async {
        // Arrange
        final request = LoginRequest(email: 'email@example.com', password: 'password', userDeviceToken: 'deviceToken', platform: 'platform');
        final response = FormattedResponse(success: true, data: {'key': 'value'}, message: '');
        when(mockApiManager.postHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.login(request);

        // Assert
        expect(result, equals(Right(response.data)));
        verify(mockApiManager.postHttp('/userauth/login', request.toJson()));
        verifyNoMoreInteractions(mockApiManager);
      });

      test('should return Left with error message on failure', () async {
        // Arrange
        final request = LoginRequest(email: 'email@example.com', password: 'password', userDeviceToken: 'deviceToken', platform: 'platform');
        final errorMessage = 'Error message';
        final response = FormattedResponse(success: false, message: errorMessage);
        when(mockApiManager.postHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.login(request);

        // Assert
        expect(result, equals(Left(errorMessage)));
        verify(mockApiManager.postHttp('/userauth/login', request.toJson()));
        verifyNoMoreInteractions(mockApiManager);
      });
    });

    group('registerStaff', () {
      test('should return Right with MappedResponse on success', () async {
        // Arrange
        final request = RegisterStaffRequest(
          userName: 'username',
          password: 'password',
          email: 'email@example.com',
          phoneNumber: '1234567890',
          phoneCountryCode: '+1',
        );
        final response = FormattedResponse(success: true, data: {'key': 'value'}, message: '');
        when(mockApiManager.postHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.registerStaff(request);

        // Assert
        expect(result, equals(Right(response.data)));
        verify(mockApiManager.postHttp('/userauth/register-staff', request.toJson()));
        verifyNoMoreInteractions(mockApiManager);
      });

      test('should return Left with error message on failure', () async {
        // Arrange
        final request = RegisterStaffRequest(
          userName: 'username',
          password: 'password',
          email: 'email@example.com',
          phoneNumber: '1234567890',
          phoneCountryCode: '+1',
        );
        final errorMessage = 'Error message';
        final response = FormattedResponse(success: false, message: errorMessage);
        when(mockApiManager.postHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.registerStaff(request);

        // Assert
        expect(result, equals(Left(errorMessage)));
        verify(mockApiManager.postHttp('/userauth/register-staff', request.toJson()));
        verifyNoMoreInteractions(mockApiManager);
      });
    });

    group('resetPassword', () {
      test('should return Right with MappedResponse on success', () async {
        // Arrange
        final request = ResetPasswordRequest(
          email: 'email@example.com',
          otp: '123456',
          newPassword: 'newPassword',
        );
        final response = FormattedResponse(success: true, data: {'key': 'value'}, message: '');
        when(mockApiManager.putHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.resetPassword(request);

        // Assert
        expect(result, equals(Right(response.data)));
        verify(mockApiManager.putHttp('/userauth/reset-password', request.toJson()));
        verifyNoMoreInteractions(mockApiManager);
      });

      test('should return Left with error message on failure', () async {
        // Arrange
        final request = ResetPasswordRequest(
          email: 'email@example.com',
          otp: '123456',
          newPassword: 'newPassword',
        );
        final errorMessage = 'Error message';
        final response = FormattedResponse(success: false, message: errorMessage);
        when(mockApiManager.putHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.resetPassword(request);

        // Assert
        expect(result, equals(Left(errorMessage)));
        verify(mockApiManager.putHttp('/userauth/reset-password', request.toJson()));
        verifyNoMoreInteractions(mockApiManager);
      });
    });

    group('loginOAuth', () {
      test('should return Right with MappedResponse on success', () async {
        // Arrange
        final request = LoginOAuthRequest(
          googleAccessToken: 'googleAccessToken',
          googleUseridToken: 'googleUseridToken',
          userDeviceToken: 'deviceToken',
          facebookUserAccessToken: 'facebookUserAccessToken',
          phoneNumber: '1234567890',
          authType: 'google',
        );
        final response = FormattedResponse(success: true, data: {'key': 'value'}, message: '');
        when(mockApiManager.postHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.loginOAuth(request);

        // Assert
        expect(result, equals(Right(response.data)));
        verify(mockApiManager.postHttp('/userauth/register-staff', request.toJson()));
        verifyNoMoreInteractions(mockApiManager);
      });

      test('should return Left with error message on failure', () async {
        // Arrange
        final request = LoginOAuthRequest(
          googleAccessToken: 'googleAccessToken',
          googleUseridToken: 'googleUseridToken',
          userDeviceToken: 'deviceToken',
          facebookUserAccessToken: 'facebookUserAccessToken',
          phoneNumber: '1234567890',
          authType: 'google',
        );
        final errorMessage = 'Error message';
        final response = FormattedResponse(success: false, message: errorMessage);
        when(mockApiManager.postHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.loginOAuth(request);

        // Assert
        expect(result, equals(Left(errorMessage)));
        verify(mockApiManager.postHttp('/userauth/register-staff', request.toJson()));
        verifyNoMoreInteractions(mockApiManager);
      });
    });
  });
}
