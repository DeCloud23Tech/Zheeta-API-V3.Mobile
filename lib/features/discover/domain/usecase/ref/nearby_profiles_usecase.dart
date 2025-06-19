import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/param/pagination_param.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/discover/data/model/nearby_model.dart';
import 'package:zheeta/features/discover/domain/repository/nearby_repository.dart';

@prod
@LazySingleton()
class GetNearbyProfiles
    extends UsecaseWithParams<NearbyListDataModel, PaginationParam> {
  const GetNearbyProfiles(this._repo);

  final NearbyDataRepository _repo;

  @override
  ResultFuture<NearbyListDataModel> call(PaginationParam params) async =>
      await _repo.getNearbyProfiles(
        pageNumber: params.pageNo,
        pageSize: params.pageSize,
      );
}
