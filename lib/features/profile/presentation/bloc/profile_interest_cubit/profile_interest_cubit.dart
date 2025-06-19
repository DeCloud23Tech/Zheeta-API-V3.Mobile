import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/profile/data/model/user_interest_model.dart';
import 'package:zheeta/features/profile/data/request/update_user_interest_request.dart';
import 'package:zheeta/features/profile/domain/usecase/user_interest_usecases.dart';

part 'profile_interest_state.dart';

@prod
@LazySingleton()
class ProfileInterestCubit extends Cubit<ProfileInterestState> {
  final GetInterests getInterests;
  final UpdateUserInterest updateUserInterest;

  ProfileInterestCubit({
    required this.getInterests,
    required this.updateUserInterest,
  }) : super(ProfileInterestInitial());

  Future<void> getInterestsCubit() async {
    emit(ProfileInterestLoading());
    var result = await getInterests();
    result.fold(
      (fail) {
        emit(ProfileInterestError(errorMessage: fail.message));
      },
      (success) {
        emit(ProfileInterestLoaded(userInterests: success));
      },
    );
  }

  Future<void> updateUserInterestCubit(
      {required UpdateUserInterestRequest request}) async {
    emit(ProfileInterestUpdating());
    var result = await updateUserInterest(request);
    result.fold(
      (fail) {
        emit(ProfileInterestUpdateError(fail.message));
      },
      (success) {
        emit(ProfileInterestUpdated());
      },
    );
  }
}
