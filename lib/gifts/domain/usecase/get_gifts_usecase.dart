import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/param/pagination_param.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';

import '../../data/model/gift_model.dart';
import '../repository/gift_repository.dart';

@prod
@LazySingleton()
class GetAllGifts extends UsecaseWithParams<List<GiftModel>, PaginationParam> {
  const GetAllGifts(this._repo);

  final GiftRepository _repo;

  @override
  ResultFuture<List<GiftModel>> call(PaginationParam params) async =>
      await _repo.getAllGifts(
          pageNumber: params.pageNo, pageSize: params.pageSize);
}
