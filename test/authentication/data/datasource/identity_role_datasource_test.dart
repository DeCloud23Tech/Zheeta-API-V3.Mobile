import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:zheeta/app/api/formatted_response.dart';
import 'package:zheeta/authentication/data/datasource/identity_role_datasource.dart';
import 'package:zheeta/authentication/data/datasource/identity_role_datasource_impl.dart';
import 'package:zheeta/authentication/data/request/user_roles_request.dart';

import '../../../mock/app/api/api_manager.mocks.dart';

void main() {
  group('IdentityRoleDatasourceImpl', () {
    late IdentityRoleDataSource datasource;
    late MockApiManager mockApiManager;

    setUp(() {
      mockApiManager = MockApiManager();
      datasource = IdentityRoleDataSourceImpl(mockApiManager);
    });

    group('downgradeUserRole', () {
      test('should return Right with MappedResponse on success', () async {
        // Arrange
        final request = UserRoleRequest(userId: 'userId', roles: ['role1', 'role2']);
        final response = FormattedResponse(success: true, data: {'key': 'value'}, message: '');
        when(mockApiManager.deleteHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.downgradeUserRole(request);

        // Assert
        expect(result, equals(Right(response.data)));
        verify(mockApiManager.deleteHttp('/userauth/roles', request.toJson()));
        verifyNoMoreInteractions(mockApiManager);
      });

      test('should return Left with error message on failure', () async {
        // Arrange
        final request = UserRoleRequest(userId: 'userId', roles: ['role1', 'role2']);
        final errorMessage = 'Error message';
        final response = FormattedResponse(success: false, message: errorMessage);
        when(mockApiManager.deleteHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.downgradeUserRole(request);

        // Assert
        expect(result, equals(Left(errorMessage)));
        verify(mockApiManager.deleteHttp('/userauth/roles', request.toJson()));
        verifyNoMoreInteractions(mockApiManager);
      });
    });

    group('upgradeUserRole', () {
      test('should return Right with MappedResponse on success', () async {
        // Arrange
        final request = UserRoleRequest(userId: 'userId', roles: ['role1', 'role2']);
        final response = FormattedResponse(success: true, data: {'key': 'value'}, message: '');
        when(mockApiManager.putHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.upgradeUserRole(request);

        // Assert
        expect(result, equals(Right(response.data)));
        verify(mockApiManager.putHttp('/userauth/roles', request.toJson()));
        verifyNoMoreInteractions(mockApiManager);
      });

      test('should return Left with error message on failure', () async {
        // Arrange
        final request = UserRoleRequest(userId: 'userId', roles: ['role1', 'role2']);
        final errorMessage = 'Error message';
        final response = FormattedResponse(success: false, message: errorMessage);
        when(mockApiManager.putHttp(any, any)).thenAnswer((_) async => response);

        // Act
        final result = await datasource.upgradeUserRole(request);

        // Assert
        expect(result, equals(Left(errorMessage)));
        verify(mockApiManager.putHttp('/userauth/roles', request.toJson()));
        verifyNoMoreInteractions(mockApiManager);
      });
    });
  });
}
