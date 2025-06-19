import 'package:zheeta/features/profile/data/model/user_interest_model.dart';
import 'package:zheeta/features/profile/data/request/update_user_interest_request.dart';

abstract class UserInterestDataSource {
  Future<void> updateUserInterestNew(UpdateUserInterestRequest request);
  Future<UserInterestListModel> getInterestsNew();
}
