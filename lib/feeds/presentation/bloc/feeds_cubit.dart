import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../profile/data/model/matched_profile_boost_model.dart';
import '../../../profile/domain/usecase/ref_usecases/user_profile_boost_usecases.dart';

part 'feeds_state.dart';

@prod
@LazySingleton()
class FeedsCubit extends Cubit<FeedsState> {
  final GetMatchedProfileBoost getMatchedProfileBoost;

  FeedsCubit({
    required this.getMatchedProfileBoost,
  }) : super(FeedsInitial());

  Future<void> getMatchedProfileBoostCubit() async {
    emit(MatchedProfilesLoadingState());
    var result = await getMatchedProfileBoost();
    result.fold(
      (fail) {
        emit(MatchedProfilesErrorState(fail.message));
      },
      (success) {
        emit(MatchedProfileBoostState(success));
      },
    );
  }
}
