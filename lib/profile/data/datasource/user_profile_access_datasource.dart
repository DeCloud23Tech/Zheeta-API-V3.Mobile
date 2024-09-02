import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

import '../model/blocked_user_model.dart';

abstract class UserProfileAccessDataSource {
  Future<Either<ErrorResponse, MappedResponse>> blockAccount(
      {required String userId, required String blockOrUnblockUserId});
  Future<Either<ErrorResponse, MappedResponse>> unblockAccount(
      {required String userId, required String blockOrUnblockUserId});
  Future<Either<ErrorResponse, MappedResponse>> getBlockedUsers(
      {required int pageNumber, required int pageSize});

  Future<bool> blockAccountNew(
      {required String userId, required String blockOrUnblockUserId});
  Future<bool> unblockAccountNew(
      {required String userId, required String blockOrUnblockUserId});
  Future<BlockedUsersResponse> getBlockedUsersNew(
      {required int pageNumber, required int pageSize});
}
