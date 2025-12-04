import 'package:zheeta/features/profile/data/models/search_user_by_customer_model.dart';

abstract class IUserSearchDataSource {
  Future<SearchUserByCustomerListModel> searchUserByCustomerNew({
    required String username,
    required int pageNumber,
    required int pageSize,
  });
}
