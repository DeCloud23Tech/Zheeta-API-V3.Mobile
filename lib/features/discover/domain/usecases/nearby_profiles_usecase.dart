import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/discover/data/models/nearby_model.dart';
import 'package:zheeta/features/discover/domain/repositories/nearby_repository.dart';

@prod
@LazySingleton()
class GetNearbyProfiles
    extends UsecaseWithParams<NearbyListDataModel, PaginationParam> {
  const GetNearbyProfiles(this._repo);

  final INearbyDataRepository _repo;

  @override
  ResultFuture<NearbyListDataModel> call(PaginationParam params) async =>
      await _repo.getNearbyProfiles(
        pageNumber: params.pageNo,
        pageSize: params.pageSize,
      );
}
