import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/mixins/image_picker.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/features/messages/data/model/chat_history_model.dart';
import 'package:zheeta/features/messages/data/request/create_chat_request.dart';
import 'package:zheeta/features/messages/domain/usecase/create_chat.dart';
import 'package:zheeta/features/messages/domain/usecase/delete_chat.dart';
import 'package:zheeta/features/messages/presentation/bloc/chat_cubit/chat_cubit.dart';
import 'package:zheeta/features/messages/presentation/views/widgets/message_bubble.dart';
import 'package:zheeta/utils/pagination_controller.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/loader.dart';
import 'package:zheeta/widgets/reusable_bottom_sheet.dart';
import 'chat_image_view_screen.dart';

@RoutePage()
class ChatConversationScreen extends StatefulWidget {
  final String userName;
  final String profileId;
  final String currentUserId;

  const ChatConversationScreen({
    super.key,
    required this.userName,
    required this.profileId,
    required this.currentUserId,
  });

  @override
  State<ChatConversationScreen> createState() => _ChatConversationScreenState();
}

class _ChatConversationScreenState extends State<ChatConversationScreen>
    with ImagePickerMixin {
  final ChatCubit _chatCubit = locator<ChatCubit>();
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late PaginatedListController<Message, ChatCubit, ChatState>
  _chatPaginatedController;
  String? _imageUrl;
  double _scrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _chatPaginatedController =
        PaginatedListController<Message, ChatCubit, ChatState>(
          fetchItems: (param) => _chatCubit
              .fetchChatHistoryCubit(param.copyWith(userId: widget.profileId)),
          cubit: _chatCubit,
        );

    _scrollController.addListener(_scrollListener);
    _loadChatHistory();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadChatHistory() {
    if (_chatPaginatedController.hasMoreItems) {
      _chatPaginatedController.loadNextPage(
        successCondition: (state) => state is ChatHistoryLoaded,
        extractItems: (state) => (state as ChatHistoryLoaded).chatHistory.data,
        isError: (state) => state is ChatError,
      );
    }
  }

  void _scrollListener() {
    if (_scrollController.hasClients) {
      _scrollPosition = _scrollController.position.pixels;
    }

    if (_isBottom) {
      _loadChatHistory();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.9);
  }

  Future<void> _pickImage() async {
    File? pickedImage = await pickImageFromGallery();

    if (pickedImage != null) {
      setState(() {
        _imageUrl = pickedImage.path;
      });
    }
  }

  Future<void> _sendMessage() async {
    final messageText = _messageController.text.trim();
    if (messageText.isNotEmpty || _imageUrl != null) {
      if (_imageUrl != null) {
        final mediaParams = SendMediaFileParams(
          message: messageText.isNotEmpty ? messageText : null,
          recipientId: widget.profileId,
          senderId: widget.currentUserId,
          file: File(_imageUrl!),
        );
        await _chatCubit.sendMediaCubit(mediaParams);
      } else {
        final chatRequest = CreateChatRequest(
          message: messageText,
          recipientId: widget.profileId,
          senderId: widget.currentUserId,
          timestamp: DateTime.now(),
        );
        await _chatCubit.createNewChatCubit(chatRequest);
      }

      _messageController.clear();
      setState(() {
        _imageUrl = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.primaryDark,
        surfaceTintColor: AppColors.secondaryLight,
        scrolledUnderElevation: 0.5,
        shadowColor: Colors.grey,
        leadingWidth: MediaQuery.of(context).size.width * 0.2,
        leading: const Row(
          children: [
            AppBackButton(),
          ],
        ),
        title: Text(
          widget.userName,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocListener<ChatCubit, ChatState>(
                listener: (context, state) {
                  if (state is ChatMessageSent || state is ChatMessageDeleted) {
                    _chatPaginatedController.reset();
                    _loadChatHistory();
                  } else if (state is ChatError) {
                    NotifyUser.showSnackBar(state.message);
                  }
                },
                child: BlocBuilder<ChatCubit, ChatState>(
                  builder: (context, state) {
                    return ListView.builder(
                      reverse: true,
                      padding: const EdgeInsets.all(10),
                      controller: _scrollController,
                      itemCount: _chatPaginatedController.items.length,
                      itemBuilder: (context, index) {
                        final message = _chatPaginatedController.items[index];
                        final bool isMe =
                            message.senderId == widget.currentUserId;

                        return _buildMessageBubble(message, isMe);
                      },
                    );
                  },
                ),
              ),
            ),
            if (_imageUrl != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 200, // Set a maximum height for the image
                    maxWidth: MediaQuery.of(context).size.width * 0.8, // Set a maximum width
                  ),
                  child: Image.file(
                    File(_imageUrl!),
                    fit: BoxFit.cover, // Ensure the image fits within the constraints
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: InkWell(
                      onTap: _pickImage,
                      child: SvgPicture.asset(
                        'assets/images/icons/camera-solid.svg',
                        width: 24.0,
                        height: 24.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      minLines: 1,
                      maxLines: 4,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.white,
                        hintText: 'Send a message...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: AppColors.grey,
                            width: 2,
                          ),
                        ),
                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: InkWell(
                      onTap: _sendMessage,
                      child: SvgPicture.asset(
                        'assets/images/icons/send-icon.svg',
                        width: 18.0,
                        height: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(Message message, bool isMe) {
    final DateTime timestamp = DateTime.parse(message.timestamp);
    final String messageType = message.mediaUrl.isEmpty ? 'text' : 'image';
    final deleteRequest = DeleteMessageParam(
      messageId: message.id,
      senderId: message.senderId,
      recipientId: message.recipientId,
    );

    return Column(
      crossAxisAlignment:
      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (_shouldDisplayTimestamp(message))
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
              child: Text(
                _formatTimestamp(timestamp),
                style: const TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
            ),
          ),
        messageType == 'text'
            ? GestureDetector(
          onLongPress: () {
            showCustomModalBottomSheet(
              context: context,
              titles: ['Delete'],
              icons: ['assets/images/icons/delete.svg'],
              actions: [
                    () async => await _chatCubit
                    .deleteChatMessageCubit(deleteRequest),
              ],
            );
          },
          child: MessageBubble(message: message, isMe: isMe),
        )
            : GestureDetector(
          onLongPress: () {
            showCustomModalBottomSheet(
              context: context,
              titles: ['Delete'],
              icons: ['assets/images/icons/delete.svg'],
              actions: [
                    () async => await _chatCubit
                    .deleteChatMessageCubit(deleteRequest),
              ],
            );
          },
          onTap: () => _openImageScreen(message.mediaUrl),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.8, // Set a maximum width
            ),
            child: ImageMessageBubble(message: message, isMe: isMe),
          ),
        ),
      ],
    );
  }

  bool _shouldDisplayTimestamp(Message message) {
    final bool isFirstMessage = message == _chatPaginatedController.items.first;
    final bool isTimeDifferenceGreaterThan5Minutes = DateTime.now()
        .difference(DateTime.parse(message.timestamp))
        .inMinutes >=
        5;
    return isFirstMessage || isTimeDifferenceGreaterThan5Minutes;
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();

    if (now.year == timestamp.year &&
        now.month == timestamp.month &&
        now.day == timestamp.day) {
      return '${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}';
    } else {
      return '${timestamp.day}/${timestamp.month}/${timestamp.year}';
    }
  }

  void _openImageScreen(String imageUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageViewerScreen(imageUrl: imageUrl),
      ),
    );
  }
}