import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/core/router/app_router.dart';
import 'package:zheeta/core/router/app_router.gr.dart';
import 'package:zheeta/features/messages/data/model/chat_recipients_model.dart';
import 'package:zheeta/features/messages/domain/usecase/delete_chat.dart';
import 'package:zheeta/features/messages/presentation/bloc/chat_cubit/chat_cubit.dart';
import 'package:zheeta/features/profile/presentation/widgets/search_field.dart';
import 'package:zheeta/utils/pagination_controller.dart';
import 'package:zheeta/utils/token_utils.dart';
import 'package:zheeta/widgets/loader.dart';
import 'package:zheeta/widgets/reusable_container.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'dart:async';

import 'chat_conversation_screen.dart';

@RoutePage()
class ChatMessagesPage extends StatefulWidget {
  const ChatMessagesPage({super.key});

  @override
  State<ChatMessagesPage> createState() => _ChatMessagesPageState();
}

class _ChatMessagesPageState extends State<ChatMessagesPage>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _searchController = TextEditingController();
  static PaginatedListController<Recipient, ChatCubit, ChatState>?
      _recipientsPaginatedController;
  ChatCubit chatCubit = locator<ChatCubit>();
  final ScrollController _scrollController = ScrollController();

  List<Recipient> filteredRecipients = [];
  Timer? _debounce;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);

    _recipientsPaginatedController ??=
        PaginatedListController<Recipient, ChatCubit, ChatState>(
      fetchItems: (param) => chatCubit.fetchRecipientsCubit(param),
      cubit: chatCubit,
    );

    _scrollController.addListener(_scrollListener);

      _loadRecipientsPage();
  }

  void _onSearchChanged() {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), _filterRecipients);
  }

  void _filterRecipients() {
    final query = _searchController.text.toLowerCase();

    setState(() {
      filteredRecipients = (query.isEmpty
              ? _recipientsPaginatedController?.items
              : _recipientsPaginatedController?.items
                  .where((recipient) =>
                      recipient.userProfile.firstName
                          .toLowerCase()
                          .contains(query) ||
                      recipient.userProfile.lastName
                          .toLowerCase()
                          .contains(query))
                  .toList()) ??
          [];
    });
  }

  void _loadRecipientsPage() {
    _recipientsPaginatedController?.loadNextPage(
      successCondition: (state) => state is ChatRecipientsLoaded,
      extractItems: (state) => (state as ChatRecipientsLoaded).recipients.data,
      isError: (state) => state is ChatError,
    );
  }

  void _scrollListener() {
    if (_isBottom) _loadRecipientsPage();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    return _scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200;
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _scrollController.dispose();
    _searchController.dispose();
    _recipientsPaginatedController?.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      body: Column(
        children: [
          SearchField(
            searchController: _searchController,
            containerColor: AppColors.white,
            iconColor: AppColors.black,
            textColor: Colors.blueGrey,
          ),
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              buildWhen: (previous, current) =>
                  current is ChatRecipientsLoaded || current is ChatError,
              builder: (context, state) {
                if (state is ChatLoading &&
                    _recipientsPaginatedController!.items.isEmpty) {
                  return loadingIndicator();
                }

                if (state is ChatRecipientsLoaded &&
                    _recipientsPaginatedController!.items.isEmpty) {
                  return const Center(
                    child: Text(
                      'No chat recipients found.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryDark,
                      ),
                    ),
                  );
                }

                final displayList = _searchController.text.isEmpty
                    ? _recipientsPaginatedController?.items
                    : filteredRecipients;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: displayList!.length +
                        (_recipientsPaginatedController!.hasMoreItems ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == displayList.length) {
                        return _recipientsPaginatedController!.hasMoreItems &&
                                (_recipientsPaginatedController!.items.length >=
                                    _recipientsPaginatedController!.pageSize)
                            ? loadingIndicator()
                            : const SizedBox.shrink();
                      }

                      final recipient = displayList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Dismissible(
                          key: Key(recipient.userProfile.id),
                          direction: DismissDirection.endToStart,
                          background: _dismissibleBackground(),
                          onDismissed: (direction) async {
                            final userId = await TokenUtil.getUserId();
                            if (userId == null) {
                              NotifyUser.showSnackBar(
                                  'Error retrieving user ID');
                              return;
                            }

                            final chatParam = ChatParam(
                                recipientId: recipient.userProfile.id,
                                senderId: userId);

                            final success = await chatCubit
                                .deleteChatHistoryCubit(chatParam);
                            if (success) {
                              setState(() {
                                _recipientsPaginatedController?.items
                                    .remove(recipient);
                                filteredRecipients.remove(recipient);
                              });
                              NotifyUser.showSnackBar('Chat history deleted');
                            } else {
                              NotifyUser.showSnackBar('Failed to delete chat');
                            }
                          },
                          child: _buildRecipientTile(recipient),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _dismissibleBackground() {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Icon(Icons.close, color: Colors.white),
    );
  }

  Widget _buildRecipientTile(Recipient recipient) {
    return ReusableCustomContainer(
      padding: 10,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () async {
          String? userId = await TokenUtil.getUserId();
          if (!mounted) return;
          context.router.push(
            ChatConversationRoute(
              userName:
                  '${recipient.userProfile.firstName} ${recipient.userProfile.lastName}',
              profileId: recipient.userProfile.id,
              currentUserId: userId!,
            ),
          );
        },
        leading: Stack(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: const AssetImage('assets/images/User.png'),
            ),
            if (!recipient.userProfile.isOnline)
              Positioned(
                top: 0,
                right: 1,
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: AppColors.primaryDark,
                  ),
                ),
              ),
          ],
        ),
        title: Text(
          '${recipient.userProfile.lastName} ${recipient.userProfile.firstName}',
          style: const TextStyle(
            color: AppColors.grayscale,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          softWrap: false,
        ),
        subtitle: Text(
          recipient.lastUnreadMessage,
          style: const TextStyle(
            color: AppColors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              timeago.format(DateTime.parse(recipient.lastUnreadMessageTime)),
              style: const TextStyle(
                color: AppColors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryDark,
              ),
              child: Text(
                recipient.unreadMessageCount.toString(),
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
