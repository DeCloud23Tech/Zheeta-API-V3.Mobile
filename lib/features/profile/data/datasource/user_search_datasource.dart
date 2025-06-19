import 'package:zheeta/features/profile/data/model/search_user_by_customer_model.dart';

abstract class UserSearchDataSource {
  Future<SearchUserByCustomerListModel> searchUserByCustomerNew({
    required String username,
    required int pageNumber,
    required int pageSize,
  });
}
