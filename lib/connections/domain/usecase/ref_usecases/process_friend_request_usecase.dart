import 'package:injectable/injectable.dart';
import '../../../../app/common/type_def.dart';
import '../../../../app/common/usecase/usecases.dart';
import '../../../data/request/friend_request_model.dart';
import '../../repository/friends_repository.dart';

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
