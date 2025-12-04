import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/profile/data/models/boost_insight_model.dart';
import 'package:zheeta/features/profile/data/models/matched_profile_boost_model.dart';
import 'package:zheeta/features/profile/data/requests/create_profile_boost_request.dart';
import 'package:zheeta/features/profile/domain/usecases/user_profile_boost_usecases.dart';

part 'profile_boost_state.dart';

@prod
@LazySingleton()
class ProfileBoostCubit extends Cubit<ProfileBoostState> {
  final CreateProfileBoost createProfileBoost;
  final GetProfileBoostInsight getProfileBoostInsight;

  double? costPerUserPerDay;
  double lastCalculatedCost = 0.0; // persist last calculated cost

  ProfileBoostCubit({
    required this.createProfileBoost,
    required this.getProfileBoostInsight,
  }) : super(ProfileBoostInitial());

  void setCostPerUserPerDay(double cost) {
    costPerUserPerDay = cost;
  }

  void calculateCost({
    required String users,
    required String duration,
  }) {
    final targetUsers = double.tryParse(users) ?? 0;
    final days = double.tryParse(duration) ?? 0;

    if (costPerUserPerDay == null) return;

    lastCalculatedCost = costPerUserPerDay! * targetUsers * days;
    emit(ProfileBoostCostCalculated(lastCalculatedCost));
  }

  Future<void> createProfileBoostCubit(
      CreateProfileBoostRequest request) async {
    emit(ProfileBoostLoading());
    final result = await createProfileBoost(request);
    result.fold(
      (fail) => emit(ProfileBoostError(fail.message)),
      (_) => emit(ProfileBoostCreated()),
    );
  }

  Future<void> getProfileBoostInsightCubit(String userId) async {
    emit(ProfileBoostLoading());
    final result = await getProfileBoostInsight(userId);
    result.fold(
      (fail) => emit(ProfileBoostError(fail.message)),
      (success) => emit(ProfileBoostInsightLoaded(success)),
    );
  }
}
