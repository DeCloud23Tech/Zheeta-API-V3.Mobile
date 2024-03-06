import 'package:zheeta/profile/data/model/search_user_by_admin_model.dart';
import 'package:zheeta/profile/data/model/search_user_by_customer_model.dart';

abstract class UserSearchRepository {
  Future<SearchUserByCustomerListModel> searchUserByCustomerRepo({
    required String username,
    required int pageNumber,
    required int pageSize,
  });
  Future<SearchUserByAdminListModel> findUserByAdminUsernameRepo({
    required String username,
    required int pageNumber,
    required int pageSize,
  });
  Future<SearchUserByAdminListModel> findUserByAdminEmailRepo({
    required String email,
    required int pageNumber,
    required int pageSize,
  });
}
