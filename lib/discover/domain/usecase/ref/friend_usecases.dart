import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/enums/type_of_request.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/discover/domain/repository/friend_request_repository.dart';

@prod
@LazySingleton()
class SendFriendRequest extends UsecaseWithParams<void, SendRequestParams> {
  const SendFriendRequest(this._repo);

  final FriendRequestRepository _repo;

  @override
  ResultFuture<void> call(SendRequestParams params) async =>
      await _repo.sendFriendRequest(
          recieverId: params.recieverId, typeOfRequest: params.typeOfRequest);
}

class SendRequestParams {
  String recieverId;
  TypeOfRequest typeOfRequest;

  SendRequestParams({required this.recieverId, required this.typeOfRequest});
}
