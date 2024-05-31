import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';

part 'user_profile_access_state.freezed.dart';

@freezed
class UserProfileAccessState with _$UserProfileAccessState {
  factory UserProfileAccessState({
    required State blockAccountState,
    required State unblockAccountState,
    required State getBlockedUsersState,
  }) = _UserProfileAccessState;

  UserProfileAccessState._();

  UserProfileAccessState setBlockAccountState(State state) => copyWith(blockAccountState: state);
  UserProfileAccessState setUnblockAccountState(State state) => copyWith(unblockAccountState: state);
  UserProfileAccessState setGetBlockedUsersState(State state) => copyWith(getBlockedUsersState: state);
}
