import 'package:zheeta/profile/data/model/search_user_by_admin_model.dart';
import 'package:zheeta/profile/data/model/search_user_by_customer_model.dart';

abstract class UserSearchUseCase {
  Future<SearchUserByCustomerListModel> searchUserByCustomerUseCase({
    required String username,
    required int pageNumber,
    required int pageSize,
  });
  Future<SearchUserByAdminListModel> findUserByAdminUsernameUseCase({
    required String username,
    required int pageNumber,
    required int pageSize,
  });
  Future<SearchUserByAdminListModel> findUserByAdminEmailUseCase({
    required String email,
    required int pageNumber,
    required int pageSize,
  });
}
