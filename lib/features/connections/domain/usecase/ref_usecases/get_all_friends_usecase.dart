import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/param/pagination_param.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/connections/data/model/all_friends_model.dart';
import 'package:zheeta/features/connections/domain/repository/friends_repository.dart';



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
