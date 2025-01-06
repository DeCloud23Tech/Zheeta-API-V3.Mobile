import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/profile/data/model/matched_profile_boost_model.dart';
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_boost_usecases.dart';

part 'sponsored_boost_state.dart';

@prod
@LazySingleton()
class SponsoredBoostCubit extends Cubit<SponsoredBoostState> {
  final GetProfileBoost getProfileBoost;

  SponsoredBoostCubit({
    required this.getProfileBoost,
  }) : super(SponsoredBoostInitial());

  Future<void> fetchProfileBoostsCubit() async {
    print('result');

    emit(SponsoredBoostLoadingState());
    final result = await getProfileBoost();
    print(result);
    result.fold(
      (failure) => emit(SponsoredBoostErrorState(failure.message)),
      (profileBoosts) => emit(SponsoredBoostLoadedState(boosts: profileBoosts)),
    );
  }
}
