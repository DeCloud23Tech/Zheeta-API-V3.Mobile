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
  bool _isDataLoaded = false;

  FeedsCubit({
    required this.getMatchedProfileBoost,
  }) : super(FeedsInitial());

  bool get isDataLoaded => _isDataLoaded;

  Future<void> getMatchedProfileBoostCubit() async {
    if (_isDataLoaded) return;
    emit(MatchedProfilesLoadingState());
    var result = await getMatchedProfileBoost();
    result.fold(
          (fail) {
        emit(MatchedProfilesErrorState(fail.message));
      },
          (success) {
        _isDataLoaded = true;
        emit(MatchedProfileBoostState(success));
      },
    );
  }

  Future<void> refreshMatchedProfileBoostCubit() async {
    _isDataLoaded = false;
    await getMatchedProfileBoostCubit();
  }
}
