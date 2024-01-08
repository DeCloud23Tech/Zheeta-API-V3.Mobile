import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

abstract class UserProfileAccessDataSource {
  Future<Either<Error, MappedResponse>> blockAccount({required String userId, required String blockOrUnblockUserId});
  Future<Either<Error, MappedResponse>> unblockAccount({required String userId, required String blockOrUnblockUserId});
  Future<Either<Error, MappedResponse>> getBlockedUsers({required int pageNumber, required int pageSize});
}
