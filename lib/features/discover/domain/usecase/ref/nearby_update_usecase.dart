import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/discover/data/request/nearby_update_request.dart';
import 'package:zheeta/features/discover/domain/repository/nearby_repository.dart';

@prod
@LazySingleton()
class UpdateNearbySettings
    extends UsecaseWithParams<void, NearbyUpdateRequest> {
  const UpdateNearbySettings(this._repo);

  final NearbyDataRepository _repo;

  @override
  ResultFuture<void> call(NearbyUpdateRequest params) async =>
      await _repo.nearbyUpdate(params);
}
