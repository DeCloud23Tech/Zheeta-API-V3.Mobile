import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';

part 'friend_request_state.freezed.dart';

@freezed
class FriendRequestState with _$FriendRequestState {
  factory FriendRequestState({
    required State sendFriendRequestState,
  }) = _FriendRequestState;

  FriendRequestState._();

  FriendRequestState setSendFriendRequestState(State state) => copyWith(sendFriendRequestState: state);
}
