import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/profile/data/models/search_user_by_customer_model.dart';

abstract class IUserSearchRepository {
  ResultFuture<SearchUserByCustomerListModel> searchUserByCustomerRepo({
    required String userName,
    required int pageNumber,
    required int pageSize,
  });
}
