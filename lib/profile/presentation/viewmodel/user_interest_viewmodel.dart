import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/notify/notify_user.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';
import 'package:zheeta/profile/data/request/update_user_interest_request.dart';
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

  List<int> _interest = [];

  setInterest(int value) {
    if (_interest.contains(value)) {
      _interest.remove(value);
    } else {
      _interest.add(value);
    }
  }

  String? validateInterest() => _interest.isEmpty ? 'Please select at least one interest' : null;

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

  Future<bool> updateUserInterest() async {
    state = state.setUpdateUserInterestState(State.loading());
    try {
      final userId = (await sessionManager.get(SessionManagerKeys.authUserIdString)) as String;
      final result = await _userInterestUseCase.updateUserInterestUseCase(
        UpdateUserUnterestRequest(userId: userId, interestIds: _interest),
      );
      state = state.setUpdateUserInterestState(State.success(result));
      return true;
    } on Exception catch (e) {
      state = state.setUpdateUserInterestState(State.error(e));
      NotifyUser.showSnackbar(e.toString());
      return false;
    }
  }

  @override
  void dispose() {
    _interest.clear();
    super.dispose();
  }
}
