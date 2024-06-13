import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';

import '../../data/model/received_gift_model.dart';
import '../repository/gift_repository.dart';

@prod
@LazySingleton()
class GetAllReceivedGifts extends UsecaseWithParams<ReceivedGiftListModel, int> {
  const GetAllReceivedGifts(this._repo);

  final GiftRepository _repo;

  @override
  ResultFuture<ReceivedGiftListModel> call(int page) async => await _repo.getAllReceivedGifts(page);
}
