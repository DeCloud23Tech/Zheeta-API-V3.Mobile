import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/gifts/data/models/sent_gift_model.dart';
import 'package:zheeta/features/gifts/domain/repositories/gift_repository.dart';

@prod
@LazySingleton()
class GetAllSentGifts
    extends UsecaseWithParams<List<SentGiftModel>, PaginationParam> {
  const GetAllSentGifts(this._repo);

  final IGiftRepository _repo;

  @override
  ResultFuture<List<SentGiftModel>> call(PaginationParam params) async =>
      await _repo.getAllSentGifts(
          pageNumber: params.pageNo, pageSize: params.pageSize);
}
