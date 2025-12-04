import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/gifts/data/models/gift_response_model.dart';
import 'package:zheeta/features/gifts/domain/repositories/gift_repository.dart';

@prod
@LazySingleton()
class DeliverGift extends UsecaseWithParams<GiftResponseModel, String> {
  const DeliverGift(this._repo);

  final IGiftRepository _repo;

  @override
  ResultFuture<GiftResponseModel> call(String giftId) async {
    return await _repo.deliverGift(giftId);
  }
}
