import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

abstract class AccessRestrictionDataSource {
  Future<Either<ErrorResponse, MappedResponse>> enableAccount({required String userId});
  Future<Either<ErrorResponse, MappedResponse>> disableAccount({required String userId});
}
