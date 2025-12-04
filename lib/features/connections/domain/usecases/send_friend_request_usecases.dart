import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/connections/domain/repositories/friends_repository.dart';
import 'package:zheeta/shared/enums/type_of_request.dart';

@prod
@LazySingleton()
class SendFriendRequest extends UsecaseWithParams<void, SendRequestParams> {
  const SendFriendRequest(this._repo);

  final IFriendsRepository _repo;

  @override
  ResultFuture<void> call(SendRequestParams params) async =>
      await _repo.sendFriendRequest(
          receiverId: params.receiverId, typeOfRequest: params.typeOfRequest);
}

class SendRequestParams {
  String receiverId;
  TypeOfRequest typeOfRequest;

  SendRequestParams({required this.receiverId, required this.typeOfRequest});
}
