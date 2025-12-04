import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/features/messages/data/models/chat_recipients_model.dart';
import 'package:zheeta/features/messages/domain/usecases/get_chat_recipient.dart';

/// Cubit to fetch chat recipients with pagination
@prod
@injectable
class ChatRecipientsCubit extends PaginationCubit<Recipient, PaginationParam> {
  final GetChatRecipients _getChatRecipients;

  ChatRecipientsCubit({
    required GetChatRecipients getChatRecipients,
  })  : _getChatRecipients = getChatRecipients,
        super(
          fetchPage: ((params) async {
            final result = await getChatRecipients.call(params);

            return result.fold(
              (error) {
                print("ChatRecipientsCubit error: ${error.message}");
                throw Exception(error.message);
              },
              (data) {
                print(
                    "ChatRecipientsCubit fetched ${data.data.length} recipients");
                return data
                    .data; // assumes `ChatRecipients` has a `recipients: List<ChatRecipient>`
              },
            );
          }),
          baseParams: PaginationParam(pageNo: 1, pageSize: 15),
        );

  Future<void> refreshChatRecipients() async => reset();
}
