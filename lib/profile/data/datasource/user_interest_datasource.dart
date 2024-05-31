import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/profile/data/model/user_interest_model.dart';
import 'package:zheeta/profile/data/request/update_user_interest_request.dart';

abstract class UserInterestDataSource {
  Future<Either<ErrorResponse, MappedResponse>> updateUserInterest(
      UpdateUserUnterestRequest request);
  Future<Either<ErrorResponse, MappedResponse>> getInterests();

  Future<void> updateUserInterestNew(UpdateUserUnterestRequest request);
  Future<UserInterestListModel> getInterestsNew();
}
