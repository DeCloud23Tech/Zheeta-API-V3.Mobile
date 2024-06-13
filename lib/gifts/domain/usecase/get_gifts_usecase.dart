import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';

import '../../data/model/gift_model.dart';
import '../repository/gift_repository.dart';

@prod
@LazySingleton()
class GetAllGifts extends UsecaseWithParams<GiftListModel, int> {
  const GetAllGifts(this._repo);

  final GiftRepository _repo;

  @override
  ResultFuture<GiftListModel> call(int page) async => await _repo.getAllGifts(page);
}
