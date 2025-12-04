import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/connections/data/requests/friend_request_model.dart';
import 'package:zheeta/features/connections/domain/repositories/friends_repository.dart';

@prod
@LazySingleton()
class ProcessFriendRequest extends UsecaseWithParams<void, FriendRequest> {
  const ProcessFriendRequest(this._repo);

  final IFriendsRepository _repo;

  @override
  ResultFuture<void> call(FriendRequest params) async {
    return await _repo.processFriendRequest(params);
  }
}
