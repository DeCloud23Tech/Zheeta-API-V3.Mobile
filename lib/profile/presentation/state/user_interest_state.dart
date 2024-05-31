import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';
import 'package:zheeta/profile/data/model/user_interest_model.dart';

part 'user_interest_state.freezed.dart';

@freezed
class UserInterestState with _$UserInterestState {
  factory UserInterestState({
    required State updateUserInterestState,
    required State<UserInterestListModel> getInterestState,
  }) = _UserInterestState;

  UserInterestState._();

  UserInterestState setUpdateUserInterestState(State state) => copyWith(updateUserInterestState: state);
  UserInterestState setGetInterestState(State<UserInterestListModel> state) => copyWith(getInterestState: state);
}
