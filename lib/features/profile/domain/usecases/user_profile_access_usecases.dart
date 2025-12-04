import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/profile/data/models/blocked_user_model.dart';
import 'package:zheeta/features/profile/domain/repositories/user_profile_access_repository.dart';

@prod
@LazySingleton()
class BlockAccount extends UsecaseWithParams<void, BlockUserParams> {
  const BlockAccount(this._repo);

  final IUserProfileAccessRepository _repo;

  @override
  ResultFuture<bool> call(BlockUserParams param) async =>
      await _repo.blockAccountRepo(
          userId: param.userId,
          blockOrUnblockUserId: param.blockOrUnblockUserId);
}

@prod
@LazySingleton()
class GetBlockedUsers extends UsecaseWithParams<void, PaginationParam> {
  const GetBlockedUsers(this._repo);

  final IUserProfileAccessRepository _repo;

  @override
  ResultFuture<BlockedUsersResponse> call(PaginationParam params) async =>
      await _repo.getBlockedUsersRepo(
          pageNumber: params.pageNo, pageSize: params.pageSize);
}

@prod
@LazySingleton()
class UnBlockAccount extends UsecaseWithParams<void, BlockUserParams> {
  const UnBlockAccount(this._repo);

  final IUserProfileAccessRepository _repo;

  @override
  ResultFuture<bool> call(BlockUserParams params) async =>
      await _repo.unblockAccountRepo(
          userId: params.userId,
          blockOrUnblockUserId: params.blockOrUnblockUserId);
}

class BlockUserParams {
  String userId;
  String blockOrUnblockUserId;

  BlockUserParams({required this.userId, required this.blockOrUnblockUserId});
}
