import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/profile/data/models/user_interest_model.dart';
import 'package:zheeta/features/profile/data/requests/update_user_interest_request.dart';

abstract class IUserInterestRepository {
  ResultVoid updateUserInterestRepo(UpdateUserInterestRequest request);

  ResultFuture<UserInterestListModel> getInterestsRepo();
}
