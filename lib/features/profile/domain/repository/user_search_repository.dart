import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/features/profile/data/model/search_user_by_customer_model.dart';

abstract class UserSearchRepository {
  ResultFuture<SearchUserByCustomerListModel> searchUserByCustomerRepo({
    required String userName,
    required int pageNumber,
    required int pageSize,
  });

}
