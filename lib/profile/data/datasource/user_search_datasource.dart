import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

abstract class UserSearchDataSource {
  Future<Either<ErrorResponse, MappedResponse>> searchUserByCustomer({
    required String username,
    required int pageNumber,
    required int pageSize,
  });
  Future<Either<ErrorResponse, MappedResponse>> findUserByAdminUsername({
    required String username,
    required int pageNumber,
    required int pageSize,
  });
  Future<Either<ErrorResponse, MappedResponse>> findUserByAdminEmail({
    required String email,
    required int pageNumber,
    required int pageSize,
  });
}
