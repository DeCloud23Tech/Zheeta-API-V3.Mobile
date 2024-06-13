import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/discover/domain/repository/populate_nearby_repository.dart';

import '../../../data/model/nearby_settings_model.dart';

@prod
@LazySingleton()
class GetNearbySettings extends UsecaseWithoutParams<NearbySettingsModel> {
  const GetNearbySettings(this._repo);

  final NearbyDataRepository _repo;

  @override
  ResultFuture<NearbySettingsModel> call() async =>
      await _repo.getNearbySettings();
}
