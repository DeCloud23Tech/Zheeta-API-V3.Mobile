import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/profile/data/model/search_user_by_customer_model.dart';
import 'package:zheeta/features/profile/domain/usecase/user_search_usecases.dart';

part 'profile_search_state.dart';

@prod
@LazySingleton()
class ProfileSearchCubit extends Cubit<ProfileSearchState> {
  final SearchUser searchUser;

  ProfileSearchCubit({required this.searchUser})
      : super(ProfileSearchInitial());

  Future<void> searchUserByCustomerCubit(UserSearchByEmailParam request) async {
    emit(ProfileSearchLoading());
    final result = await searchUser(request);
    result.fold(
      (failure) => emit(ProfileSearchError(failure.message)),
      (searchResults) => emit(ProfileSearchSuccess(searchResults)),
    );
  }
}
