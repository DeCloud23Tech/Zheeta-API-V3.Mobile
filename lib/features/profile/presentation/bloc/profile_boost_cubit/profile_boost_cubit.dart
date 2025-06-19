import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/profile/data/model/boost_insight_model.dart';
import 'package:zheeta/features/profile/data/model/matched_profile_boost_model.dart';
import 'package:zheeta/features/profile/data/request/create_profile_boost_request.dart';
import 'package:zheeta/features/profile/domain/usecase/user_profile_boost_usecases.dart';

part 'profile_boost_state.dart';

@prod
@LazySingleton()
class ProfileBoostCubit extends Cubit<ProfileBoostState> {
  final CreateProfileBoost createProfileBoost;
  final GetProfileBoostInsight getProfileBoostInsight;

  ProfileBoostCubit({
    required this.createProfileBoost,
    required this.getProfileBoostInsight,
  }) : super(ProfileBoostInitial());

  Future<void> createProfileBoostCubit(
      CreateProfileBoostRequest request) async {
    emit(ProfileBoostLoading());
    var result = await createProfileBoost(request);
    result.fold(
      (fail) {
        emit(ProfileBoostError(fail.message));
      },
      (success) {
        emit(ProfileBoostCreated());
      },
    );
  }


  Future<void> getProfileBoostInsightCubit(String userId) async {
    emit(ProfileBoostLoading());
    var result = await getProfileBoostInsight(userId);
    result.fold(
      (fail) {
        emit(ProfileBoostError(fail.message));
      },
      (success) {
        emit(ProfileBoostInsightLoaded(success));
      },
    );
  }
}
