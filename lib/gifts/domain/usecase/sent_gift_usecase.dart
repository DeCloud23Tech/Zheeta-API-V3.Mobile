import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';

import '../../data/model/sent_gift_model.dart';
import '../repository/gift_repository.dart';

@prod
@LazySingleton()
class GetAllSentGifts extends UsecaseWithParams<SentGiftListModel, int> {
  const GetAllSentGifts(this._repo);

  final GiftRepository _repo;

  @override
  ResultFuture<SentGiftListModel> call(int page) async => await _repo.getAllSentGifts(page);
}
