import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/param/pagination_param.dart';

import '../../../../app/common/type_def.dart';
import '../../../../app/common/usecase/usecases.dart';
import '../../../data/model/all_friends_model.dart';
import '../../repository/friends_repository.dart';

@prod
@LazySingleton()
class GetAllFriends
    extends UsecaseWithParams<FriendsListModel, PaginationParam> {
  const GetAllFriends(this._repo);

  final FriendsRepository _repo;

  @override
  ResultFuture<FriendsListModel> call(PaginationParam params) async =>
      await _repo.getAllFriends(
          pageNumber: params.pageNo, pageSize: params.pageSize);
}
