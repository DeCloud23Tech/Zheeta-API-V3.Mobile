import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/connections/data/models/get_pending_friends_model.dart';
import 'package:zheeta/features/connections/domain/repositories/friends_repository.dart';

@prod
@LazySingleton()
class GetPendingFriends
    extends UsecaseWithParams<GetPendingFriendsModel, PaginationParam> {
  const GetPendingFriends(this._repo);

  final IFriendsRepository _repo;

  @override
  ResultFuture<GetPendingFriendsModel> call(PaginationParam params) async =>
      await _repo.getPendingFriends(
          pageNumber: params.pageNo, pageSize: params.pageSize);
}
