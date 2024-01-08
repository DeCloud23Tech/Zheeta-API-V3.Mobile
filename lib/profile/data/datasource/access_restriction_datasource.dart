import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

abstract class AccessRestrictionDataSource {
  Future<Either<Error, MappedResponse>> enableAccount({required String userId});
  Future<Either<Error, MappedResponse>> disableAccount({required String userId});
}
