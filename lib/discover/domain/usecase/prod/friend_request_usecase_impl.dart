import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/enums/type_of_request.dart';
import 'package:zheeta/discover/domain/repository/friend_request_repository.dart';
import 'package:zheeta/discover/domain/usecase/friend_request_usecase.dart';

@prod
@LazySingleton(as: FriendRequestUseCase)
class FriendRequestUseCaseImpl implements FriendRequestUseCase {
  final FriendRequestRepository _repository;
  FriendRequestUseCaseImpl(this._repository);

  @override
  sendFriendRequestUseCase({
    required String recieverId,
    required TypeOfRequest typeOfRequest,
  }) {
    return _repository.sendFriendRequestRepo(recieverId: recieverId, typeOfRequest: typeOfRequest);
  }
}
