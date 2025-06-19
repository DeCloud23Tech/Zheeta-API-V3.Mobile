import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/param/pagination_param.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/messages/data/model/chat_recipients_model.dart';
import 'package:zheeta/features/messages/domain/repository/chat_repository.dart';


@prod
@LazySingleton()
class GetChatRecipients
    extends UsecaseWithParams<ChatRecipients, PaginationParam> {
  const GetChatRecipients(this._repo);

  final ChatRepository _repo;

  @override
  ResultFuture<ChatRecipients> call(PaginationParam params) async =>
      await _repo.getAllRecipients(
        pageNumber: params.pageNo,
        pageSize: params.pageSize,
      );
}
