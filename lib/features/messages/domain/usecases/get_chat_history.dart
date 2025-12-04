import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/messages/data/models/chat_history_model.dart';
import 'package:zheeta/features/messages/domain/repositories/chat_repository.dart';

@prod
@LazySingleton()
class GetChatHistory extends UsecaseWithParams<ChatHistory, PaginationParam> {
  const GetChatHistory(this._repo);

  final IChatRepository _repo;

  @override
  ResultFuture<ChatHistory> call(PaginationParam params) async =>
      await _repo.getChatHistory(
        recipientId: params.userId!,
        pageNumber: params.pageNo,
        pageSize: params.pageSize,
      );
}
