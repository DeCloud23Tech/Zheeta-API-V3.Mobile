import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/profile/data/models/search_user_by_customer_model.dart';
import 'package:zheeta/features/profile/domain/usecases/user_search_usecases.dart';

part 'profile_search_state.dart';

@prod
@LazySingleton()
class ProfileSearchCubit extends Cubit<ProfileSearchState> {
  final SearchUser searchUser;

  ProfileSearchCubit({required this.searchUser})
      : super(ProfileSearchInitial());

  Future<void> searchUserByCustomerCubit(UserSearchByEmailParam request) async {
    if (isClosed) return; // Prevent emitting after close
    emit(ProfileSearchLoading());

    final result = await searchUser(request);
    result.fold(
      (failure) {
        if (!isClosed) emit(ProfileSearchError(failure.message));
      },
      (searchResults) {
        if (!isClosed) emit(ProfileSearchSuccess(searchResults));
      },
    );
  }

  // Reset the search state back to initial
  void resetSearch() {
    if (!isClosed) emit(ProfileSearchInitial());
  }
}
