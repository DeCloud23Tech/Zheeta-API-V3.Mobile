import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/discover/data/requests/nearby_update_request.dart';
import 'package:zheeta/features/discover/domain/repositories/nearby_repository.dart';

@prod
@LazySingleton()
class UpdateNearbySettings
    extends UsecaseWithParams<void, NearbyUpdateRequest> {
  const UpdateNearbySettings(this._repo);

  final INearbyDataRepository _repo;

  @override
  ResultFuture<void> call(NearbyUpdateRequest params) async =>
      await _repo.nearbyUpdate(params);
}
