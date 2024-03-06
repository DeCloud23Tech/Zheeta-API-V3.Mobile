import 'package:injectable/injectable.dart';
import 'package:zheeta/profile/data/datasource/access_restriction_datasource.dart';
import 'package:zheeta/profile/domain/repository/access_restriction_repository.dart';

@prod
@LazySingleton(as: AccessRestrictionRepository)
class AccessRestrictionRepositoryImpl implements AccessRestrictionRepository {
  final AccessRestrictionDataSource _datasource;
  AccessRestrictionRepositoryImpl(this._datasource);

  @override
  disableAccountRepo({required String userId}) async {
    final result = await _datasource.disableAccount(userId: userId);
    return result.fold(
      (error) => throw new Exception(error.message),
      (value) => value,
    );
  }

  @override
  enableAccountRepo({required String userId}) async {
    final result = await _datasource.enableAccount(userId: userId);
    return result.fold(
      (error) => throw new Exception(error.message),
      (value) => value,
    );
  }
}
