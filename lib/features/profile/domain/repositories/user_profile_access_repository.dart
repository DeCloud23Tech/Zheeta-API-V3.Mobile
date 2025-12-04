import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/profile/data/models/blocked_user_model.dart';

abstract class IUserProfileAccessRepository {
  ResultFuture<bool> blockAccountRepo(
      {required String userId, required String blockOrUnblockUserId});

  ResultFuture<bool> unblockAccountRepo(
      {required String userId, required String blockOrUnblockUserId});

  ResultFuture<BlockedUsersResponse> getBlockedUsersRepo(
      {required int pageNumber, required int pageSize});
}
