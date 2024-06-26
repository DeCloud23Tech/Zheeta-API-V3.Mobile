import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/profile/data/model/user_interest_model.dart';
import 'package:zheeta/profile/data/request/update_user_interest_request.dart';

abstract class UserInterestRepository {
  ResultVoid updateUserInterestRepo(UpdateUserUnterestRequest request);
  ResultFuture<UserInterestListModel> getInterestsRepo();
}
