import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/nearby_model.dart';
import '../../../domain/usecase/ref/nearby_profiles_usecase.dart';

part 'nearby_state.dart';

@prod
@LazySingleton()
class NearbyCubit extends Cubit<NearbyState> {
  final GetNearbyProfiles getNearbyProfiles;

  NearbyCubit({
    required this.getNearbyProfiles,
  }) : super(NearbyInitial());

  Future<NearbyListModel?> getNearbyProfilesCubit() async {
    emit(NearbyLoading());
    var result = await getNearbyProfiles();
    NearbyListModel? data;
    result.fold(
      (fail) {
        emit(NearbyError(fail.message));
      },
      (success) {
        emit(NearbySuccess(success));
        data = success;
      },
    );
    return data;
  }
}
