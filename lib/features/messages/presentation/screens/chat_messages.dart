import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/core/utils/token_utils.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/messages/data/models/chat_history_model.dart';
import 'package:zheeta/features/messages/data/models/chat_recipients_model.dart';
import 'package:zheeta/features/messages/data/requests/create_chat_request.dart';
import 'package:zheeta/features/messages/domain/usecases/delete_chat.dart';
import 'package:zheeta/features/messages/presentation/cubits/chat_action_cubit/chat_action_cubit.dart';
import 'package:zheeta/features/messages/presentation/cubits/chat_cubit/chat_cubit.dart';
import 'package:zheeta/features/messages/presentation/cubits/chat_history_cubit/chat_history_cubit.dart';
import 'package:zheeta/features/profile/presentation/widgets/search_field.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/widgets/loader.dart';
import 'package:zheeta/shared/widgets/reusable_container.dart';
import 'dart:async';

@RoutePage()
class ChatMessagesScreen extends StatefulWidget {
  final Recipient recipient;

  const ChatMessagesScreen({super.key, required this.recipient});

  @override
  State<ChatMessagesScreen> createState() => _ChatMessagesScreenState();
}

class _ChatMessagesScreenState extends State<ChatMessagesScreen> {
  late final ChatHistoryCubit _chatHistoryCubit;
  late final ChatActionCubit _chatActionCubit;
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ImagePicker _picker = ImagePicker();
  String? _currentUserId; // nullable field

  @override
  void initState() {
    super.initState();
    _chatHistoryCubit = context.read<ChatHistoryCubit>();
    _chatActionCubit = context.read<ChatActionCubit>();
    _loadUserId();
    _loadMessages();
  }

  Future<void> _loadUserId() async {
    final id = await TokenUtil.getUserId();
    setState(() {
      _currentUserId = id;
    });
  }

  void _loadMessages() {
    _chatHistoryCubit.refreshChatHistory(widget.recipient.userProfile.id);
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _sendTextMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    _messageController.clear();

    _chatActionCubit.createChat(
      CreateChatRequest(
        message: text,
        recipientId: widget.recipient.userProfile.id,
        senderId: _currentUserId ?? '',
        timestamp: DateTime.now(),
      ),
    );
  }

  Future<void> _sendMediaMessage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;

    final file = File(pickedFile.path);

    _chatActionCubit.sendMedia(
      recipientId: widget.recipient.userProfile.id,
      senderId: _currentUserId ?? '',
      file: file,
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatActionCubit, ChatActionState>(
      listener: (context, state) {
        if (state.status == ChatActionStatus.error && state.error != null) {
          NotifyUser.showSnackBar(state.error!);
        }

        if (state.status == ChatActionStatus.success && state.message != null) {
          final message = convertMessageModelToMessage(state.message!);
          _chatHistoryCubit.addMessageLocally(message);
          _scrollToBottom();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    NetworkImage(widget.recipient.userProfile.profilePhotoURL),
              ),
              const SizedBox(width: 8),
              Text(widget.recipient.userProfile.firstName),
            ],
          ),
          actions: [
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_horiz),
              onSelected: (value) async {
                if (value == 'report') _reportUser();
                if (value == 'block') _blockUser();
              },
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'report', child: Text('Report')),
                const PopupMenuItem(value: 'block', child: Text('Block User')),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<ChatHistoryCubit, PaginationState<Message>>(
                builder: (context, state) {
                  if (state.isLoading && state.items.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state.error != null) {
                    return Center(child: Text('Error: ${state.error}'));
                  }

                  if (state.items.isEmpty) {
                    return const Center(child: Text('No messages yet.'));
                  }

                  return ListView.builder(
                    reverse: true,
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final msg = state.items[index];
                      final isMe = msg.senderId == _currentUserId;

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        child: Row(
                          mainAxisAlignment: isMe
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (!isMe)
                              CircleAvatar(
                                radius: 16,
                                backgroundImage: NetworkImage(widget
                                    .recipient.userProfile.profilePhotoURL),
                              ),
                            if (!isMe) const SizedBox(width: 8),
                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color:
                                      isMe ? Colors.blue : Colors.grey.shade200,
                                  borderRadius: BorderRadius.only(
                                    topLeft: const Radius.circular(16),
                                    topRight: const Radius.circular(16),
                                    bottomLeft: Radius.circular(isMe ? 16 : 0),
                                    bottomRight: Radius.circular(isMe ? 0 : 16),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (msg.mediaUrl.isNotEmpty)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 4),
                                        child: msg.mediaUrl.startsWith('http')
                                            ? Image.network(
                                                msg.mediaUrl,
                                                width: 200,
                                                height: 200,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.file(
                                                File(msg.mediaUrl),
                                                width: 200,
                                                height: 200,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                    if (msg.message.isNotEmpty)
                                      Text(
                                        msg.message,
                                        style: TextStyle(
                                          color: isMe
                                              ? Colors.white
                                              : Colors.black87,
                                          fontSize: 16,
                                        ),
                                      ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _formatTime(msg.timestamp),
                                      style: TextStyle(
                                        color: isMe
                                            ? Colors.white70
                                            : Colors.black54,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            _buildInputArea(),
          ],
        ),
      ),
    );
  }

  void _reportUser() {
    // You can show a dialog or send API request
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Report User'),
        content: const Text('Are you sure you want to report this user?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // TODO: Call your report API here
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('User reported')),
              );
            },
            child: const Text('Report'),
          ),
        ],
      ),
    );
  }

  void _blockUser() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Block User'),
        content: const Text('Are you sure you want to block this user?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // TODO: Call your block user API here
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('User blocked')),
              );
            },
            child: const Text('Block'),
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
        ),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.image, color: Colors.blue),
              onPressed: _sendMediaMessage,
            ),
            Expanded(
              child: TextField(
                controller: _messageController,
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => _sendTextMessage(),
                decoration: InputDecoration(
                  hintText: 'Type a message',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send, color: Colors.blue),
              onPressed: _sendTextMessage,
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(String isoTime) {
    try {
      final dateTime = DateTime.parse(isoTime).toLocal();
      return DateFormat('hh:mm a').format(dateTime);
    } catch (_) {
      return '';
    }
  }
}
