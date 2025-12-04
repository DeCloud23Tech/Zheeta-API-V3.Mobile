import 'package:zheeta/features/connections/data/models/user_downline_model.dart';

abstract class IUserDownlineDataSource {
  Future<UserDownlineListModel> getDownlines(
      {required int pageNumber, required int pageSize});
}
