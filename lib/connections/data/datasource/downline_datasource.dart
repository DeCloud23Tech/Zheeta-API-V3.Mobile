import '../model/user_downline_model.dart';

abstract class UserDownlineDataSource {
  Future<UserDownlineListModel> getDownlines({required int pageNumber, required int pageSize});
}
