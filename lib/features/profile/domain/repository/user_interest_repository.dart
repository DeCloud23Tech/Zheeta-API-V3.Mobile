import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/features/profile/data/model/user_interest_model.dart';
import 'package:zheeta/features/profile/data/request/update_user_interest_request.dart';

abstract class UserInterestRepository {
  ResultVoid updateUserInterestRepo(UpdateUserInterestRequest request);

  ResultFuture<UserInterestListModel> getInterestsRepo();
}
