import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/param/pagination_param.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/discover/data/model/nearby_model.dart';
import 'package:zheeta/discover/domain/repository/populate_nearby_repository.dart';

@prod
@LazySingleton()
class GetNearbyProfiles
    extends UsecaseWithParams<List<NearbyDataModel>, PaginationParam> {
  const GetNearbyProfiles(this._repo);

  final NearbyDataRepository _repo;

  @override
  ResultFuture<List<NearbyDataModel>> call(PaginationParam params) async =>
      await _repo.getNearbyProfiles(
        pageNumber: params.pageNo,
        pageSize: params.pageSize,
      );
}
