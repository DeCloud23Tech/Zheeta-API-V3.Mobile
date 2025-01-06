import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/param/pagination_param.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/gifts/data/model/sent_gift_model.dart';
import 'package:zheeta/gifts/domain/repository/gift_repository.dart';

@prod
@LazySingleton()
class GetAllSentGifts
    extends UsecaseWithParams<List<SentGiftModel>, PaginationParam> {
  const GetAllSentGifts(this._repo);

  final GiftRepository _repo;

  @override
  ResultFuture<List<SentGiftModel>> call(PaginationParam params) async =>
      await _repo.getAllSentGifts(
          pageNumber: params.pageNo, pageSize: params.pageSize);
}
