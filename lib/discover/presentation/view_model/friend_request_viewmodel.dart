import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/enums/type_of_request.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';
import 'package:zheeta/discover/domain/usecase/friend_request_usecase.dart';
import 'package:zheeta/discover/presentation/state/friend_request_state.dart';

final friendRequestViewModelProvider = StateNotifierProvider<FriendRequestViewModel, FriendRequestState>(
  (ref) {
    final _useCase = locator<FriendRequestUseCase>();
    return FriendRequestViewModel(_useCase);
  },
);

class FriendRequestViewModel extends StateNotifier<FriendRequestState> {
  final FriendRequestUseCase _friendRequestUseCase;
  FriendRequestViewModel(this._friendRequestUseCase)
      : super(FriendRequestState(
          sendFriendRequestState: State.init(),
        ));

  Future<bool> sendFriendRequest({required String receiverId, required TypeOfRequest typeOfRequest}) async {
    state = state.setSendFriendRequestState(State.loading());
    try {
      final result = await _friendRequestUseCase.sendFriendRequestUseCase(
        recieverId: receiverId,
        typeOfRequest: typeOfRequest,
      );

      state = state.setSendFriendRequestState(State.success(result));
      return true;
    } on Exception catch (e) {
      state = state.setSendFriendRequestState(State.error(e));
      return false;
    }
  }
}
