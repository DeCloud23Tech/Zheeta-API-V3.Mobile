import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/notify/notify_user.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';
import 'package:zheeta/profile/domain/usecase/user_interest_usecase.dart';
import 'package:zheeta/profile/presentation/state/user_interest_state.dart';

final userInterestViewModelProvider = StateNotifierProvider<UserInterestViewModel, UserInterestState>((ref) {
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
    state = state.setGetInterestState(State.loading());
    try {
      final result = await _userInterestUseCase.getInterestsUseCase();

      state = state.setGetInterestState(State.success(result));
      return true;
    } on Exception catch (e) {
      state = state.setGetInterestState(State.error(e));

      NotifyUser.showSnackbar(e.toString());

      return false;
    }
  }
}
