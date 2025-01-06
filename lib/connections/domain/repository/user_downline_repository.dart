import 'package:zheeta/connections/data/model/user_downline_model.dart';

import '../../../app/common/type_def.dart';

abstract class UserDownlineRepository {
  ResultFuture<UserDownlineListModel> getDownlines(
      {required int pageNumber, required int pageSize});
}
