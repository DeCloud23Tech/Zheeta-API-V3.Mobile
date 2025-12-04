import 'package:zheeta/features/profile/data/models/user_interest_model.dart';
import 'package:zheeta/features/profile/data/requests/update_user_interest_request.dart';

abstract class IUserInterestDataSource {
  Future<void> updateUserInterestNew(UpdateUserInterestRequest request);
  Future<UserInterestListModel> getInterestsNew();
}
