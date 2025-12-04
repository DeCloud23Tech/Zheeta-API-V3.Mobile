import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/gifts/data/models/gift_model.dart';
import 'package:zheeta/features/gifts/domain/repositories/gift_repository.dart';

@prod
@LazySingleton()
class GetAllGifts extends UsecaseWithParams<List<GiftModel>, PaginationParam> {
  const GetAllGifts(this._repo);

  final IGiftRepository _repo;

  @override
  ResultFuture<List<GiftModel>> call(PaginationParam params) async =>
      await _repo.getAllGifts(
          pageNumber: params.pageNo, pageSize: params.pageSize);
}
