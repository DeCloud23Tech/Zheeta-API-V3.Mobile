import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/param/pagination_param.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/connections/data/model/get_pending_friends_model.dart';
import 'package:zheeta/features/connections/domain/repository/friends_repository.dart';


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
