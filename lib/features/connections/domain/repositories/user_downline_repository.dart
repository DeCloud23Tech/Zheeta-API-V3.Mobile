import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/connections/data/models/user_downline_model.dart';

abstract class IUserDownlineRepository {
  ResultFuture<UserDownlineListModel> getDownlines(
      {required int pageNumber, required int pageSize});
}
