import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/gifts/domain/repository/gift_repository.dart';


@prod
@LazySingleton()
class RedeemGift extends UsecaseWithParams<void, String> {
  const RedeemGift(this._repo);

  final GiftRepository _repo;

  @override
  ResultVoid call(String giftId) async {
    return await _repo.redeemGift(giftId);
  }
}
