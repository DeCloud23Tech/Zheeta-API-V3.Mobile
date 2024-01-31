import 'package:dartz/dartz.dart';
import 'package:zheeta/app/common/enums/type_of_request.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

abstract class FriendRequestDataSource {
  Future<Either<ErrorResponse, MappedResponse>> sendFriendRequest({
    required String recieverId,
    required TypeOfRequest typeOfRequest,
  });
}
