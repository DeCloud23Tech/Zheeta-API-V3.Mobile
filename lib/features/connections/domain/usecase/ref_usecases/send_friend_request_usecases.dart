import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/enums/type_of_request.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/connections/domain/repository/friends_repository.dart';



@prod
@LazySingleton()
class SendFriendRequest extends UsecaseWithParams<void, SendRequestParams> {
  const SendFriendRequest(this._repo);

  final FriendsRepository _repo;

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
