import 'package:injectable/injectable.dart';
import 'package:zheeta/profile/data/datasource/user_profile_access_datasource.dart';
import 'package:zheeta/profile/domain/repository/user_profile_access_repository.dart';

@prod
@LazySingleton(as: UserProfileAccessRepository)
class UserProfileAccessRepositoryImpl implements UserProfileAccessRepository {
  final UserProfileAccessDataSource _datasource;
  UserProfileAccessRepositoryImpl(this._datasource);

  @override
  blockAccountRepo({required String userId, required String blockOrUnblockUserId}) async {
    final result = await _datasource.blockAccount(userId: userId, blockOrUnblockUserId: blockOrUnblockUserId);
    return result.fold(
      (error) => throw new Exception(error),
      (value) => value,
    );
  }

  @override
  getBlockedUsersRepo({required int pageNumber, required int pageSize}) async {
    final result = await _datasource.getBlockedUsers(pageNumber: pageNumber, pageSize: pageSize);
    return result.fold(
      (error) => throw new Exception(error),
      (value) => value,
    );
  }

  @override
  unblockAccountRepo({required String userId, required String blockOrUnblockUserId}) async {
    final result = await _datasource.unblockAccount(userId: userId, blockOrUnblockUserId: blockOrUnblockUserId);
    return result.fold(
      (error) => throw new Exception(error),
      (value) => value,
    );
  }
}
