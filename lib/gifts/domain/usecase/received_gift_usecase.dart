import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/param/pagination_param.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/gifts/data/model/received_gift_model.dart';
import 'package:zheeta/gifts/domain/repository/gift_repository.dart';


@prod
@LazySingleton()
class GetAllReceivedGifts
    extends UsecaseWithParams<List<ReceivedGiftModel>, PaginationParam> {
  const GetAllReceivedGifts(this._repo);

  final GiftRepository _repo;

  @override
  ResultFuture<List<ReceivedGiftModel>> call(PaginationParam params) async =>
      await _repo.getAllReceivedGifts(
          pageNumber: params.pageNo, pageSize: params.pageSize);
}
