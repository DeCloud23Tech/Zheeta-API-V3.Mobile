import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

abstract class UserProfileAccessDataSource {
  Future<Either<ErrorResponse, MappedResponse>> blockAccount(
      {required String userId, required String blockOrUnblockUserId});
  Future<Either<ErrorResponse, MappedResponse>> unblockAccount(
      {required String userId, required String blockOrUnblockUserId});
  Future<Either<ErrorResponse, MappedResponse>> getBlockedUsers(
      {required int pageNumber, required int pageSize});

  Future<void> blockAccountNew(
      {required String userId, required String blockOrUnblockUserId});
  Future<void> unblockAccountNew(
      {required String userId, required String blockOrUnblockUserId});
  Future<void> getBlockedUsersNew(
      {required int pageNumber, required int pageSize});
}
