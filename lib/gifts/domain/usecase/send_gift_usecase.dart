import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/gifts/data/request/send_gift_request_model.dart';
import 'package:zheeta/gifts/domain/repository/gift_repository.dart';

@prod
@LazySingleton()
class SendGiftUseCase extends UsecaseWithParams<void, SendGiftRequestModel> {
  const SendGiftUseCase(this._repo);

  final GiftRepository _repo;

  @override
  ResultVoid call(SendGiftRequestModel params) async {
    return await _repo.sendGift(params);
  }
}
