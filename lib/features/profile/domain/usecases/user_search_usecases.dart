import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/profile/data/models/search_user_by_customer_model.dart';
import 'package:zheeta/features/profile/domain/repositories/user_search_repository.dart';

@prod
@LazySingleton()
class SearchUser extends UsecaseWithParams<SearchUserByCustomerListModel,
    UserSearchByEmailParam> {
  const SearchUser(this._repo);

  final IUserSearchRepository _repo;

  @override
  ResultFuture<SearchUserByCustomerListModel> call(
          UserSearchByEmailParam params) async =>
      await _repo.searchUserByCustomerRepo(
          pageNumber: params.pageNo,
          pageSize: params.pageSize,
          userName: params.userName);
}

class UserSearchByEmailParam {
  int pageNo;
  int pageSize;
  String userName;

  UserSearchByEmailParam(
      {required this.pageNo, required this.pageSize, required this.userName});
}
