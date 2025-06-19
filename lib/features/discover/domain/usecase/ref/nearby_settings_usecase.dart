import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/param/pagination_param.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/discover/data/model/nearby_model.dart';
import 'package:zheeta/features/discover/data/model/nearby_settings_model.dart';
import 'package:zheeta/features/discover/domain/repository/nearby_repository.dart';

@prod
@LazySingleton()
class GetNearbySettings extends UsecaseWithParams<NearbySettingsModel, String> {
  const GetNearbySettings(this._repo);

  final NearbyDataRepository _repo;

  @override
  ResultFuture<NearbySettingsModel> call(String params) async =>
      await _repo.getNearbySettings(userId: params);
}
