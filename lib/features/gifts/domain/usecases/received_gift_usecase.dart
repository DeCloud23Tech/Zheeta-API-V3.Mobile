import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/gifts/data/models/received_gift_model.dart';
import 'package:zheeta/features/gifts/domain/repositories/gift_repository.dart';

@prod
@LazySingleton()
class GetAllReceivedGifts
    extends UsecaseWithParams<List<ReceivedGiftModel>, PaginationParam> {
  const GetAllReceivedGifts(this._repo);

  final IGiftRepository _repo;

  @override
  ResultFuture<List<ReceivedGiftModel>> call(PaginationParam params) async =>
      await _repo.getAllReceivedGifts(
          pageNumber: params.pageNo, pageSize: params.pageSize);
}
