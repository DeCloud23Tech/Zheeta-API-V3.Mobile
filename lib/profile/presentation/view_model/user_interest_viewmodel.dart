import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/notify/notify_user.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';
import 'package:zheeta/profile/domain/usecase/user_interest_usecase.dart';
import 'package:zheeta/profile/presentation/state/user_interest_state.dart';

final userInterestViewModelProvider = StateNotifierProvider.autoDispose<UserInterestViewModel, UserInterestState>((ref) {
  final _UserInterestUseCase = locator<UserInterestUseCase>();
  return UserInterestViewModel(_UserInterestUseCase);
});

class UserInterestViewModel extends StateNotifier<UserInterestState> {
  final UserInterestUseCase _userInterestUseCase;
  UserInterestViewModel(this._userInterestUseCase)
      : super(
          UserInterestState(
            updateUserInterestState: State.init(),
            getInterestState: State.init(),
          ),
        );

  Future<bool> getInterests() async {
    setLocalState = localState?.setGetInterestState(State.loading());
    try {
      final result = await _userInterestUseCase.getInterestsUseCase();

      setLocalState = localState?.setGetInterestState(State.success(result));
      return true;
    } on Exception catch (e) {
      setLocalState = localState?.setGetInterestState(State.error(e));

      NotifyUser.showSnackbar(e.toString());

      return false;
    }
  }

  UserInterestState? get localState => mounted ? state : null;
  void set setLocalState(UserInterestState? value) => mounted
      ? value != null
          ? state = value
          : null
      : null;
}
