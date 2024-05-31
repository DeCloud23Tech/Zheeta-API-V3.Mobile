import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/profile/data/model/search_user_by_admin_model.dart';
import 'package:zheeta/profile/data/model/search_user_by_customer_model.dart';

abstract class UserSearchRepository {
  ResultFuture<SearchUserByCustomerListModel> searchUserByCustomerRepo({
    required String username,
    required int pageNumber,
    required int pageSize,
  });
  ResultFuture<SearchUserByAdminListModel> findUserByAdminUsernameRepo({
    required String username,
    required int pageNumber,
    required int pageSize,
  });
  ResultFuture<SearchUserByAdminListModel> findUserByAdminEmailRepo({
    required String email,
    required int pageNumber,
    required int pageSize,
  });
}
