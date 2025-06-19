import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/profile/data/model/search_user_by_customer_model.dart';
import 'package:zheeta/features/profile/domain/repository/user_search_repository.dart';

@prod
@LazySingleton()
class SearchUser extends UsecaseWithParams<
    SearchUserByCustomerListModel, UserSearchByEmailParam> {
  const SearchUser(this._repo);

  final UserSearchRepository _repo;

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
