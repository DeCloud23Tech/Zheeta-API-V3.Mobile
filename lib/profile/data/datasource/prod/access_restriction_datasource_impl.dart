import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/profile/data/datasource/access_restriction_datasource.dart';

@prod
@LazySingleton(as: AccessRestrictionDataSource)
class AccessRestrictionDataSourceImpl implements AccessRestrictionDataSource {
  final ApiManager _apiManager;
  late final String? _authToken;

  AccessRestrictionDataSourceImpl(this._apiManager) {
    _getAuthToken();
  }

  _getAuthToken() async {
    _authToken = (await sessionManager.get(SessionManagerKeys.authToken)) as String?;
  }

  @override
  Future<Either<Error, MappedResponse>> disableAccount({required String userId}) async {
    final response = await _apiManager.putHttp('/user/disable-user-account/$userId', {}, token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(response.message);
    }
  }

  @override
  Future<Either<Error, MappedResponse>> enableAccount({required String userId}) async {
    final response = await _apiManager.putHttp('/user/enable-user-account/$userId', {}, token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(response.message);
    }
  }
}
