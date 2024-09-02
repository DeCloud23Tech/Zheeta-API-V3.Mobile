import 'package:zheeta/discover/data/model/user_downline_model.dart';

import '../../../app/common/type_def.dart';

abstract class UserDownlineRepository {
  ResultFuture<List<UserDownlineModel>> getDownlines(
      {required int pageNumber, required int pageSize});
}
