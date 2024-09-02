import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zheeta/messages/presentation/views/widgets/message_bubble.dart';

import '../../../app/common/color.dart';
import '../../../app/router/app_router.dart';

class ChatMessage {
  final String text;
  final DateTime time;
  final bool isMe;
  final File? image;

  ChatMessage(
      {required this.text, required this.time, required this.isMe, this.image});
}

class ChatScreen extends StatefulWidget {
  final String userName;

  ChatScreen({required this.userName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  DateTime? lastDisplayedTime;
  final ScrollController _scrollController = ScrollController();

  final List<ChatMessage> messages = [
    ChatMessage(
        text: 'Hello!',
        time: DateTime.now().subtract(Duration(minutes: 5)),
        isMe: true),
    ChatMessage(
        text: 'How are you?',
        time: DateTime.now().subtract(Duration(minutes: 4)),
        isMe: true),
    ChatMessage(
        text: 'Hi there!',
        time: DateTime.now().subtract(Duration(minutes: 3)),
        isMe: false),
    ChatMessage(
        text: 'I\'m fine, thank you!',
        time: DateTime.now().subtract(Duration(minutes: 2)),
        isMe: false),
    ChatMessage(
        text: 'What about you?',
        time: DateTime.now().subtract(Duration(minutes: 1)),
        isMe: false),
  ];

  final ImagePicker _picker = ImagePicker();
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () => router.pop(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  padding: EdgeInsets.all(5),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: Icon(Icons.arrow_back_ios_new, color: AppColors.grey)),
            )),
        title: Text(
          widget.userName,
          style: TextStyle(
              color: AppColors.grayscale,
              fontSize: 24,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 8,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final shouldDisplayTime = lastDisplayedTime == null ||
                        (message.time
                                .difference(lastDisplayedTime!)
                                .inMinutes >=
                            5) ||
                        message.isMe != (index > 0 && messages[index - 1].isMe);

                    if (shouldDisplayTime) {
                      lastDisplayedTime = message.time;
                    } else {
                      lastDisplayedTime = null;
                    }

                    if (message.image != null) {
                      return ImageMessageBubble(
                        message: message,
                        isMe: message.isMe,
                      );
                    } else {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: message.isMe
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          if (shouldDisplayTime)
                            Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '${message.time.hour}:${message.time.minute}',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.grey),
                                ),
                              ),
                            ),
                          MessageBubble(
                            message: message,
                            isMe: message.isMe,
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          child: SvgPicture.asset(
                              'assets/images/icons/camera-solid.svg'),
                          onTap: () => _getImage(ImageSource.gallery),
                        ),
                      ),
                      Expanded(
                        // Add this Expanded widget
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            border:
                                Border.all(color: AppColors.grey, width: 0.5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  // Add this Expanded widget
                                  child: TextField(
                                    controller: _textEditingController,
                                    decoration: InputDecoration(
                                      hintText: 'Send message...',
                                      hintStyle:
                                          TextStyle(color: AppColors.grey),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                InkWell(
                                  child: SvgPicture.asset(
                                      'assets/images/icons/sticker.svg'),
                                  onTap: () {},
                                ),
                                SizedBox(width: 8.0),
                                InkWell(
                                  child: SvgPicture.asset(
                                      'assets/images/icons/paperclip-solid.svg'),
                                  onTap: () {},
                                ),
                                SizedBox(width: 8.0),
                                InkWell(
                                  child: SvgPicture.asset(
                                      'assets/images/icons/microphone-alt-solid.svg'),
                                  onTap: () {},
                                ),
                                SizedBox(width: 8.0),
                                InkWell(
                                  child: SvgPicture.asset(
                                      'assets/images/icons/send-icon.svg'),
                                  onTap: () {
                                    // Send message
                                    String text = _textEditingController.text;
                                    _textEditingController.clear();
                                    if (text.isNotEmpty || _image != null) {
                                      sendMessage(text, _image);
                                    }
                                  },
                                ),
                                SizedBox(width: 8.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  void sendMessage(String text, File? image) {
    setState(() {
      if (text.isNotEmpty || image != null) {
        messages.add(ChatMessage(
          text: text,
          time: DateTime.now(),
          isMe: true,
          image: image,
        ));
        _image = null;
      }
    });
    // Scroll to the new message
    Future.delayed(Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

}
