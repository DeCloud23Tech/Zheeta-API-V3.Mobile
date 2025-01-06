import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/widgets/reusable_container.dart';
import 'package:zheeta/widgets/search_field.dart';

import 'chat_texts_screen.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Message> messages = [
    Message(
        userName: 'John Doe',
        message: 'Smart businesses today are…',
        time: '10:00',
        opened: false),
    Message(
        userName: 'Jane Smith',
        message: 'Smart businesses today are…',
        time: '11:30',
        opened: true),
    Message(
        userName: 'Jane Smith',
        message: 'Smart businesses today are…',
        time: '11:30',
        opened: false),
    Message(
        userName: 'Jane Smith',
        message: 'Smart businesses today are…',
        time: '11:30',
        opened: false),
    Message(
        userName: 'Jane Smith',
        message: 'Smart businesses today are…',
        time: '11:30',
        opened: true),
    Message(
        userName: 'Jane Smith',
        message: 'Smart businesses today are…',
        time: '11:30',
        opened: false),
    Message(
        userName: 'Jane Smith',
        message: 'Smart businesses today are…',
        time: '11:30',
        opened: false),
    Message(
        userName: 'Jane Smith',
        message: 'Smart businesses today are…',
        time: '11:30',
        opened: false),
  ];

  late List<Message> filteredMessages;

  @override
  void initState() {
    super.initState();
    filteredMessages = List.from(messages);
  }

  void searchMessages(String query) {
    setState(() {
      filteredMessages = messages
          .where((message) =>
              message.userName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SearchField(
            searchController: _searchController,
            containerColor: AppColors.white,
            iconColor: AppColors.black,
            textColor: Colors.blueGrey,
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
              child: ListView.builder(
                itemCount: filteredMessages.length,
                itemBuilder: (context, index) {
                  final message = filteredMessages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Dismissible(
                      direction: DismissDirection.endToStart,
                      key: Key(message.userName),
                      background: Container(
                        width: 50,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: AppColors.primaryDark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.close, color: Colors.white), // X icon
                          ],
                        ),
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          messages.removeAt(index);
                        });
                      },
                      child: ReusableCustomContainer(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          onTap: () {
                            // Open chat screen for this message
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         ChatScreen(userName: message.userName),
                            //   ),
                            // );
                          },
                          leading: SizedBox(
                            width: 60,
                            height: 100,
                            child: CircleAvatar(
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage:
                                        AssetImage('assets/images/User.png'),
                                  ),
                                  if (!message.opened)
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: CircleAvatar(
                                        radius: 10,
                                        backgroundColor:
                                            AppColors.secondaryLight,
                                        child: Container(
                                          width: 14,
                                          height: 14,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.primaryDark,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message.userName,
                                style: TextStyle(
                                    color: AppColors.grayscale,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                message.message,
                                style: TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                message.time,
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(width: 8),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primaryDark,
                                ),
                                child: Text(
                                  '1',
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
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 80),
        ],
      ),
    );
  }
}

class Message {
  final String userName;
  final String message;
  final String time;
  final bool opened;

  Message({
    required this.userName,
    required this.message,
    required this.time,
    required this.opened,
  });
}
