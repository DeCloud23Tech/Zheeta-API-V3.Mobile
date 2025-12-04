import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/discover/data/models/nearby_settings_model.dart';
import 'package:zheeta/features/discover/domain/repositories/nearby_repository.dart';

@prod
@LazySingleton()
class GetNearbySettings extends UsecaseWithParams<NearbySettingsModel, String> {
  const GetNearbySettings(this._repo);

  final INearbyDataRepository _repo;

  @override
  ResultFuture<NearbySettingsModel> call(String params) async =>
      await _repo.getNearbySettings(userId: params);
}
