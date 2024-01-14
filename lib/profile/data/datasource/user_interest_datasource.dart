import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/profile/data/request/update_user_interest_request.dart';

abstract class UserInterestDataSource {
  Future<Either<Error, MappedResponse>> updateUserInterest(UpdateUserUnterestRequest request);
  Future<Either<Error, MappedResponse>> getInterests();
}
