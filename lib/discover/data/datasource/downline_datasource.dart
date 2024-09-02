import '../model/user_downline_model.dart';

abstract class UserDownlineDataSource {
  Future<List<UserDownlineModel>> getDownlines({required int pageNumber, required int pageSize});
}
