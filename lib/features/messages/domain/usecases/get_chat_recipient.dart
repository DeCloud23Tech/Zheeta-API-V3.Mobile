import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/messages/data/models/chat_recipients_model.dart';
import 'package:zheeta/features/messages/domain/repositories/chat_repository.dart';

@prod
@LazySingleton()
class GetChatRecipients
    extends UsecaseWithParams<ChatRecipients, PaginationParam> {
  const GetChatRecipients(this._repo);

  final IChatRepository _repo;

  @override
  ResultFuture<ChatRecipients> call(PaginationParam params) async =>
      await _repo.getAllRecipients(
        pageNumber: params.pageNo,
        pageSize: params.pageSize,
      );
}
