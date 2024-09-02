import 'package:zheeta/app/common/type_def.dart';

import '../../data/model/blocked_user_model.dart';

abstract class UserProfileAccessRepository {
  ResultFuture<bool> blockAccountRepo(
      {required String userId, required String blockOrUnblockUserId});

  ResultFuture<bool> unblockAccountRepo(
      {required String userId, required String blockOrUnblockUserId});

  ResultFuture<BlockedUsersResponse> getBlockedUsersRepo(
      {required int pageNumber, required int pageSize});
}
