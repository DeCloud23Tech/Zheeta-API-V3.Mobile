import 'package:injectable/injectable.dart';

import '../../../../app/common/type_def.dart';
import '../../../../app/common/usecase/usecases.dart';
import '../../../data/model/all_friends_model.dart';
import '../../repository/friends_repository.dart';


@prod
@LazySingleton()
class GetAllFriends extends UsecaseWithoutParams<FriendsListModel> {
  const GetAllFriends(this._repo);

  final FriendsRepository _repo;

  @override
  ResultFuture<FriendsListModel> call() async => await _repo.getAllFriends();
}
