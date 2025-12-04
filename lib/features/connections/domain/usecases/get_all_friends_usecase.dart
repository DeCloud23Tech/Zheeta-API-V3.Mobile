import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/connections/data/models/all_friends_model.dart';
import 'package:zheeta/features/connections/domain/repositories/friends_repository.dart';


@prod
@LazySingleton()
class GetAllFriends
    extends UsecaseWithParams<FriendsListModel, PaginationParam> {
  const GetAllFriends(this._repo);

  final IFriendsRepository _repo;

  @override
  ResultFuture<FriendsListModel> call(PaginationParam params) async =>
      await _repo.getAllFriends(
          pageNumber: params.pageNo, pageSize: params.pageSize);
}
