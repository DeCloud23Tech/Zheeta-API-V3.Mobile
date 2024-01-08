import 'package:injectable/injectable.dart';
import 'package:zheeta/profile/data/datasource/user_interest_datasource.dart';
import 'package:zheeta/profile/data/request/update_user_interest_request.dart';
import 'package:zheeta/profile/domain/repository/user_interest_repository.dart';

@prod
@LazySingleton(as: UserInterestRepository)
class UserInterestRepositoryImpl implements UserInterestRepository {
  final UserInterestDataSource _datasource;
  UserInterestRepositoryImpl(this._datasource);

  @override
  updateUserInterestRepo(UpdateUserUnterestRequest request) async {
    final result = await _datasource.updateUserInterest(request);
    return result.fold(
      (error) => throw new Exception(error),
      (value) => value,
    );
  }
}
