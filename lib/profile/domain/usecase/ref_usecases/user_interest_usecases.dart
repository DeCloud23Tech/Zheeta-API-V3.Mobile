import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/profile/data/model/user_interest_model.dart';
import 'package:zheeta/profile/data/request/update_user_interest_request.dart';
import 'package:zheeta/profile/domain/repository/user_interest_repository.dart';


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
    extends UsecaseWithParams<void, UpdateUserUnterestRequest> {
  const UpdateUserInterest(this._repo);

  final UserInterestRepository _repo;

  @override
  ResultFuture<void> call(UpdateUserUnterestRequest params) async =>
      await _repo.updateUserInterestRepo(params);
}
