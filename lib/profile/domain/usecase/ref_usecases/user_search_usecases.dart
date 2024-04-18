import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/profile/data/model/search_user_by_admin_model.dart';
import 'package:zheeta/profile/data/model/search_user_by_customer_model.dart';
import 'package:zheeta/profile/domain/repository/user_search_repository.dart';

@prod
@LazySingleton()
class FindUserByAdminEmail extends UsecaseWithParams<SearchUserByAdminListModel,
    UserSearchByEmailParam> {
  const FindUserByAdminEmail(this._repo);

  final UserSearchRepository _repo;

  @override
  ResultFuture<SearchUserByAdminListModel> call(
          UserSearchByEmailParam param) async =>
      await _repo.findUserByAdminEmailRepo(
          pageNumber: param.pageNo,
          pageSize: param.pageSize,
          email: param.email);
}

@prod
@LazySingleton()
class FindUserByAdminUsername extends UsecaseWithParams<
    SearchUserByAdminListModel, UserSearchByEmailParam> {
  const FindUserByAdminUsername(this._repo);

  final UserSearchRepository _repo;

  @override
  ResultFuture<SearchUserByAdminListModel> call(
          UserSearchByEmailParam param) async =>
      await _repo.findUserByAdminUsernameRepo(
          pageNumber: param.pageNo,
          pageSize: param.pageSize,
          username: param.email);
}

@prod
@LazySingleton()
class SearchUserByCustomer extends UsecaseWithParams<
    SearchUserByCustomerListModel, UserSearchByEmailParam> {
  const SearchUserByCustomer(this._repo);

  final UserSearchRepository _repo;

  @override
  ResultFuture<SearchUserByCustomerListModel> call(
          UserSearchByEmailParam param) async =>
      await _repo.searchUserByCustomerRepo(
          pageNumber: param.pageNo,
          pageSize: param.pageSize,
          username: param.email);
}

class UserSearchByEmailParam {
  int pageNo;
  int pageSize;
  String email;

  UserSearchByEmailParam(
      {required this.pageNo, required this.pageSize, required this.email});
}
