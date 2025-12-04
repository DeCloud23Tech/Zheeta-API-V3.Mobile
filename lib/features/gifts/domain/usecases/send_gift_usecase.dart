import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/gifts/data/requests/send_gift_request_model.dart';
import 'package:zheeta/features/gifts/domain/repositories/gift_repository.dart';

@prod
@LazySingleton()
class SendGiftUseCase extends UsecaseWithParams<void, SendGiftRequestModel> {
  const SendGiftUseCase(this._repo);

  final IGiftRepository _repo;

  @override
  ResultVoid call(SendGiftRequestModel params) async {
    return await _repo.sendGift(params);
  }
}
