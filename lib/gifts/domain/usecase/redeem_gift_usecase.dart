import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';

import '../../data/model/gift_response_model.dart';
import '../repository/gift_repository.dart';

@prod
@LazySingleton()
class RedeemGift extends UsecaseWithParams<GiftResponseModel, String> {
  const RedeemGift(this._repo);

  final GiftRepository _repo;

  @override
  ResultFuture<GiftResponseModel> call(String giftId) async {
    return await _repo.redeemGift(giftId);
  }
}
