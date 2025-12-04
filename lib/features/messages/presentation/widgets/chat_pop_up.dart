import 'package:flutter/material.dart';

// Make sure to define your ChatOption enum and _ChatOptionsHeader class above this.
// For demonstration, I'll include them here.
enum ChatOption { report, block }

class _ChatOptionsHeader extends PopupMenuEntry<Never> {
  const _ChatOptionsHeader();
  @override
  double get height => kMinInteractiveDimension / 1.5;
  @override
  bool represents(Never? value) => false;
  @override
  _ChatOptionsHeaderState createState() => _ChatOptionsHeaderState();
}

class _ChatOptionsHeaderState extends State<_ChatOptionsHeader> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.fromLTRB(66.0, 8.0, 66.0, 0.0),
        child: SizedBox.shrink()
        // Text(
        //   'Chat options',
        //   style: TextStyle(
        //     color: Colors.grey,
        //     fontSize: 14,
        //     fontWeight: FontWeight.normal,
        //   ),
        // ),
        );
  }
}

class ChatOptionsButton extends StatelessWidget {
  const ChatOptionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ChatOption>(
      // Callback when an item is selected from the menu
      onSelected: (ChatOption result) {
        switch (result) {
          case ChatOption.report:
            // Implement your "Report user" logic here
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Reporting user...')),
            );
            break;
          case ChatOption.block:
            // Implement your "Block user" logic here
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Blocking user...')),
            );
            break;
        }
      },
      // The icon that triggers the popup menu
      icon: const Icon(
        Icons.more_horiz, // Horizontal ellipsis icon
        color: Colors.white, // Color of the icon
        size: 30, // Adjust size as needed
      ),
      // Styling for the popup menu itself
      color: Colors.white, // Background color of the popup
      surfaceTintColor: Colors.transparent, // Prevents theme tint
      shadowColor: Colors.grey.withValues(alpha: 0.5), // Subtle shadow
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(8), // Rounded corners for the popup box
      ),
      // Build the list of menu items
      itemBuilder: (BuildContext context) => <PopupMenuEntry<ChatOption>>[
        const _ChatOptionsHeader(), // Our custom header
        PopupMenuItem<ChatOption>(
          value: ChatOption.report,
          child: Text(
            'Report user',
            style: TextStyle(
              color: Colors.blueGrey[700], // Darker text color
              fontSize: 16,
            ),
          ),
        ),
        PopupMenuItem<ChatOption>(
          value: ChatOption.block,
          child: Text(
            'Block user',
            style: TextStyle(
              color: Colors.blueGrey[700], // Darker text color
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
