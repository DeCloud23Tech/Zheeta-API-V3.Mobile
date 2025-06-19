import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/features/connections/data/model/user_downline_model.dart';


abstract class UserDownlineRepository {
  ResultFuture<UserDownlineListModel> getDownlines(
      {required int pageNumber, required int pageSize});
}
