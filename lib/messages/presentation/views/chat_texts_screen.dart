import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/messages/presentation/views/widgets/message_bubble.dart';
import 'package:zheeta/widgets/back_button.dart';

class ChatScreen extends StatefulWidget {
  final String userName;
  final String profileId;

  ChatScreen({required this.userName, required this.profileId});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ImagePicker _imagePicker = ImagePicker();

  List<Map<String, dynamic>> messages = [];
  bool isTyping = false;

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      messages.add({
        'text': text,
        'isMe': true,
        'timestamp': DateTime.now(),
        'type': 'text',
      });
    });

    _textEditingController.clear();
    _scrollToBottom();

    _simulateTyping();
  }

  void _sendImage(File image) {
    setState(() {
      messages.add({
        'image': image,
        'isMe': true,
        'timestamp': DateTime.now(),
        'type': 'image',
      });
    });
    _scrollToBottom();
  }

  Future<void> _pickImage() async {
    final pickedFile =
    await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _sendImage(File(pickedFile.path));
    }
  }

  Future<void> _scrollToBottom() async {
    await Future.delayed(Duration(milliseconds: 100));
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _simulateTyping() {
    setState(() => isTyping = true);
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        messages.add({
          'text': 'Thanks for reaching out!',
          'isMe': false,
          'timestamp': DateTime.now(),
          'type': 'text',
        });
        isTyping = false;
      });
      _scrollToBottom();
    });
  }

  String _formatTimestamp(DateTime timestamp) {
    return DateFormat('h:mm a').format(timestamp);
  }

  Widget _buildMessageBubble(Map<String, dynamic> message, DateTime? lastDisplayedTime) {
    final bool isMe = message['isMe'];
    final String type = message['type'];
    final DateTime timestamp = message['timestamp'];

    final bool shouldDisplayTime = lastDisplayedTime == null ||
        (timestamp.difference(lastDisplayedTime).inMinutes >= 5) ||
        (isMe != (messages.indexOf(message) > 0 && messages[messages.indexOf(message) - 1]['isMe']));

    return Column(
      crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (shouldDisplayTime)
          Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                _formatTimestamp(timestamp),
                style: TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
            ),
          ),
        if (type == 'text')
          MessageBubble(
            message: ChatMessage(
              text: message['text'],
              timestamp: _formatTimestamp(timestamp),
            ),
            isMe: isMe,
          ),
        if (type == 'image')
          ImageMessageBubble(
            message: ChatMessage(
              image: message['image'],
              timestamp: _formatTimestamp(timestamp),
            ),
            isMe: isMe,
          ),
      ],
    );
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
        leading: Row(
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
              child: ListView.builder(
                controller: _scrollController,
                itemCount: messages.length + (isTyping ? 1 : 0),
                itemBuilder: (context, index) {
                  if (isTyping && index == messages.length) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          'Typing...',
                          style: TextStyle(color: AppColors.grey),
                        ),
                      ),
                    );
                  }
                  DateTime? lastDisplayedTime = index > 0 ? messages[index - 1]['timestamp'] : null;
                  return _buildMessageBubble(messages[index], lastDisplayedTime);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    child: SvgPicture.asset(
                      'assets/images/icons/camera-solid.svg',
                      width: 24.0,
                      height: 24.0,
                    ),
                    onTap: _pickImage,
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: SizedBox(
                      height: 40.0,
                      child: TextField(
                        controller: _textEditingController,
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: 'Send a message...',
                          hintStyle: TextStyle(color: AppColors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8.0),
                        ),
                        style: TextStyle(fontSize: 14.0),
                        onSubmitted: _sendMessage,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  InkWell(
                    child: SvgPicture.asset(
                      'assets/images/icons/send-icon.svg',
                      width: 24.0,
                      height: 24.0,
                    ),
                    onTap: () => _sendMessage(_textEditingController.text),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage {
  final String? text;
  final File? image;
  final String timestamp;

  ChatMessage({this.text, this.image, required this.timestamp});
}
