import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/gifts/data/model/gift_response_model.dart';
import 'package:zheeta/features/gifts/domain/repository/gift_repository.dart';


@prod
@LazySingleton()
class DeliverGift extends UsecaseWithParams<GiftResponseModel, String> {
  const DeliverGift(this._repo);

  final GiftRepository _repo;

  @override
  ResultFuture<GiftResponseModel> call(String giftId) async {
    return await _repo.deliverGift(giftId);
  }
}
