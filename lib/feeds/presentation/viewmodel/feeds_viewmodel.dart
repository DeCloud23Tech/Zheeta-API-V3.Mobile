import 'package:injectable/injectable.dart';
import 'package:zheeta/feeds/presentation/bloc/feeds_cubit.dart';

import '../../../app/common/mixins/location_helper.dart';
import '../../../app/common/mixins/validation_helper.dart';

@prod
@LazySingleton()
class FeedsViewModel with ValidationHelperMixin, LocationHelperMixin {
  final FeedsCubit feedsCubit;

  FeedsViewModel(this.feedsCubit);

  Future<void> getMatchedProfileBoost() async {
    await feedsCubit.getMatchedProfileBoostCubit();
  }

  FeedsState get state => feedsCubit.state;

  Stream<FeedsState> get stateStream => feedsCubit.stream;
}