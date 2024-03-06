import 'package:zheeta/profile/data/model/user_interest_model.dart';
import 'package:zheeta/profile/data/request/update_user_interest_request.dart';

abstract class UserInterestUseCase {
  updateUserInterestUseCase(UpdateUserUnterestRequest request);
  Future<UserInterestListModel> getInterestsUseCase();
}
