import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';

import '../../data/model/gift_response_model.dart';
import '../../data/request/send_gift_request_model.dart';
import '../repository/gift_repository.dart';

@prod
@LazySingleton()
class SendGiftUseCase
    extends UsecaseWithParams<GiftResponseModel, SendGiftRequestModel> {
  const SendGiftUseCase(this._repo);

  final GiftRepository _repo;

  @override
  ResultFuture<GiftResponseModel> call(SendGiftRequestModel params) async {
    return await _repo.sendGift(params);
  }
}
