import 'package:zheeta/app/common/type_def.dart';

abstract class UserProfileAccessRepository {
  ResultVoid blockAccountRepo(
      {required String userId, required String blockOrUnblockUserId});
  ResultVoid unblockAccountRepo(
      {required String userId, required String blockOrUnblockUserId});
  ResultVoid getBlockedUsersRepo(
      {required int pageNumber, required int pageSize});
}
