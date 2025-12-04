import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/profile/data/models/matched_profile_boost_model.dart';
import 'package:zheeta/features/profile/domain/usecases/user_profile_boost_usecases.dart';

part 'sponsored_boost_state.dart';

@prod
@injectable
class SponsoredBoostCubit extends Cubit<SponsoredBoostState> {
  final GetProfileBoost _getProfileBoost;

  SponsoredBoostCubit({
    required GetProfileBoost getProfileBoost,
  })  : _getProfileBoost = getProfileBoost,
        super(SponsoredBoostState.initial());

  Future<void> fetchSponsoredBoosts() async {
    emit(state.copyWith(status: SponsoredBoostStatus.loading));

    final result = await _getProfileBoost();

    result.fold(
      (error) {
        print("SponsoredBoostCubit error: ${error.message}");
        emit(state.copyWith(
          status: SponsoredBoostStatus.error,
          errorMessage: error.message,
        ));
      },
      (boostModel) {
        print("SponsoredBoostCubit fetched ${boostModel.data.length} boosts");
        emit(state.copyWith(
          status: SponsoredBoostStatus.loaded,
          boosts: boostModel,
        ));
      },
    );
  }

  void reset() => emit(SponsoredBoostState.initial());
}
