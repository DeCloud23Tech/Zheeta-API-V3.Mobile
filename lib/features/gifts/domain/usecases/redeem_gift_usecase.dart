import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/gifts/domain/repositories/gift_repository.dart';

@prod
@LazySingleton()
class RedeemGift extends UsecaseWithParams<void, String> {
  const RedeemGift(this._repo);

  final IGiftRepository _repo;

  @override
  ResultVoid call(String giftId) async {
    return await _repo.redeemGift(giftId);
  }
}
