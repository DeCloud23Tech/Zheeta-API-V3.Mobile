import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/profile/domain/repository/access_restriction_repository.dart';

class DisableAccount extends UsecaseWithParams<void, String> {
  const DisableAccount(this._repo);

  final AccessRestrictionRepository _repo;

  @override
  ResultFuture<void> call(String params) async =>
      await _repo.disableAccountRepo(userId: params);
}

class EnableAccount extends UsecaseWithParams<void, String> {
  const EnableAccount(this._repo);

  final AccessRestrictionRepository _repo;

  @override
  ResultFuture<void> call(String params) async =>
      await _repo.enableAccountRepo(userId: params);
}
