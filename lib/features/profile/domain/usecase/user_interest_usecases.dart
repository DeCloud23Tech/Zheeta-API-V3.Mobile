import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/profile/data/model/user_interest_model.dart';
import 'package:zheeta/features/profile/data/request/update_user_interest_request.dart';
import 'package:zheeta/features/profile/domain/repository/user_interest_repository.dart';


@prod
@LazySingleton()
class GetInterests extends UsecaseWithoutParams<UserInterestListModel> {
  const GetInterests(this._repo);

  final UserInterestRepository _repo;

  @override
  ResultFuture<UserInterestListModel> call() async =>
      await _repo.getInterestsRepo();
}

@prod
@LazySingleton()
class UpdateUserInterest
    extends UsecaseWithParams<void, UpdateUserInterestRequest> {
  const UpdateUserInterest(this._repo);

  final UserInterestRepository _repo;

  @override
  ResultFuture<void> call(UpdateUserInterestRequest params) async =>
      await _repo.updateUserInterestRepo(params);
}
