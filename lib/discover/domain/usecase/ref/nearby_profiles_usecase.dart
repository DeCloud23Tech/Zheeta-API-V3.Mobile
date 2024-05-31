import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/discover/data/model/nearby_model.dart';
import 'package:zheeta/discover/domain/repository/populate_nearby_repository.dart';

@prod
@LazySingleton()
class GetNearbyProfiles extends UsecaseWithoutParams<NearbyListModel> {
  const GetNearbyProfiles(this._repo);

  final NearbyDataRepository _repo;

  @override
  ResultFuture<NearbyListModel> call() async => await _repo.getNearbyProfiles();
}
