import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

abstract class UserSearchDataSource {
  Future<Either<Error, MappedResponse>> searchUserByCustomer({
    required String username,
    required int pageNumber,
    required int pageSize,
  });
  Future<Either<Error, MappedResponse>> findUserByAdminUsername({
    required String username,
    required int pageNumber,
    required int pageSize,
  });
  Future<Either<Error, MappedResponse>> findUserByAdminEmail({
    required String email,
    required int pageNumber,
    required int pageSize,
  });
}
