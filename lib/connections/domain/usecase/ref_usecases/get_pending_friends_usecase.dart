import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/param/pagination_param.dart';

import '../../../../app/common/type_def.dart';
import '../../../../app/common/usecase/usecases.dart';
import '../../../data/model/get_pending_friends_model.dart';
import '../../repository/friends_repository.dart';

@prod
@LazySingleton()
class GetPendingFriends
    extends UsecaseWithParams<GetPendingFriendsModel, PaginationParam> {
  const GetPendingFriends(this._repo);

  final FriendsRepository _repo;

  @override
  ResultFuture<GetPendingFriendsModel> call(PaginationParam params) async =>
      await _repo.getPendingFriends(
          pageNumber: params.pageNo, pageSize: params.pageSize);
}
