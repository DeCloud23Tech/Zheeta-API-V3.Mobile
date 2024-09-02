import 'package:injectable/injectable.dart';

import '../../../../app/common/type_def.dart';
import '../../../../app/common/usecase/usecases.dart';
import '../../../data/model/all_friends_model.dart';
import '../../../data/model/get_pending_friends_model.dart';
import '../../repository/friends_repository.dart';


@prod
@LazySingleton()
class GetPendingFriends extends UsecaseWithoutParams<GetPendingFriendsModel> {
  const GetPendingFriends(this._repo);

  final FriendsRepository _repo;

  @override
  ResultFuture<GetPendingFriendsModel> call() async => await _repo.getPendingFriends();
}
