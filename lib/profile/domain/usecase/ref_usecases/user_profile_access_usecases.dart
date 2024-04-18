import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/profile/domain/repository/user_profile_access_repository.dart';

@prod
@LazySingleton()
class BlockAccount extends UsecaseWithParams<void, BlockUserParams> {
  const BlockAccount(this._repo);

  final UserProfileAccessRepository _repo;

  @override
  ResultFuture<void> call(BlockUserParams param) async =>
      await _repo.blockAccountRepo(
          userId: param.userId,
          blockOrUnblockUserId: param.blockOrUnblockUserId);
}

@prod
@LazySingleton()
class GetBlockedUsers extends UsecaseWithParams<void, PaginationParam> {
  const GetBlockedUsers(this._repo);

  final UserProfileAccessRepository _repo;

  @override
  ResultFuture<void> call(PaginationParam params) async =>
      await _repo.getBlockedUsersRepo(
          pageNumber: params.pageNo, pageSize: params.pageSize);
}

@prod
@LazySingleton()
class UnBlockAccount extends UsecaseWithParams<void, BlockUserParams> {
  const UnBlockAccount(this._repo);

  final UserProfileAccessRepository _repo;

  @override
  ResultFuture<void> call(BlockUserParams params) async =>
      await _repo.unblockAccountRepo(
          userId: params.userId,
          blockOrUnblockUserId: params.blockOrUnblockUserId);
}

class BlockUserParams {
  String userId;
  String blockOrUnblockUserId;

  BlockUserParams({required this.userId, required this.blockOrUnblockUserId});
}

class PaginationParam {
  int pageNo;
  int pageSize;

  PaginationParam({required this.pageNo, required this.pageSize});
}
