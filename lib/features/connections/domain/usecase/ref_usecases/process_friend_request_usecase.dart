import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/connections/data/request/friend_request_model.dart';
import 'package:zheeta/features/connections/domain/repository/friends_repository.dart';


@prod
@LazySingleton()
class ProcessFriendRequest extends UsecaseWithParams<void, FriendRequest> {
  const ProcessFriendRequest(this._repo);

  final FriendsRepository _repo;

  @override
  ResultFuture<void> call(FriendRequest params) async {
    return await _repo.processFriendRequest(params);
  }
}
