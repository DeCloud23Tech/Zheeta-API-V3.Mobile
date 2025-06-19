import 'package:flutter/material.dart';

class StackedAvatars extends StatelessWidget {
  final List<String> avatarUrls;

  const StackedAvatars({required this.avatarUrls, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70, // Adjust width to fit avatars
      child: Stack(
        children: List.generate(avatarUrls.length, (index) {
          return Positioned(
            top: 0,
            bottom: 0,
            left: index * 18.0, // Adjust spacing between avatars
            child: CircleAvatar(
              radius: 12, // Adjust size of each avatar
              backgroundImage: NetworkImage(avatarUrls[index]),
              backgroundColor: Colors.grey, // Placeholder color
            ),
          );
        }),
      ),
    );
  }
}
