import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';

import '../chat_texts_screen.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool isMe;

  const MessageBubble({
    Key? key,
    required this.message,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: isMe ? AppColors.primaryDark : AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
              bottomLeft: isMe ? Radius.circular(16.0) : Radius.circular(0.0),
              bottomRight: isMe ? Radius.circular(0.0) : Radius.circular(16.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (message.text!.isNotEmpty)
                Text(
                  message.text!,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: isMe ? Colors.white : Colors.black,
                  ),
                ),
            ],
          ),
        ),
        if (!isMe)
          CustomPaint(
            painter:
            TrianglePainter(isMe ? AppColors.primaryDark : AppColors.white, isMe),
          ),
      ],
    );
  }
}

class ImageMessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool isMe;

  const ImageMessageBubble({
    Key? key,
    required this.message,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          child: Column(
            crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              if (message.image != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.file(
                    message.image!,
                    width: 169.0,
                    height: 209.0,
                    fit: BoxFit.cover,
                  ),
                ),
              if (message.text!.isNotEmpty)
                Container(
                  margin: EdgeInsets.only(top: 4.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: isMe ? AppColors.primaryDark : AppColors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Text(
                    message.text!,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: isMe ? Colors.white : Colors.black,
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (!isMe)
          CustomPaint(
            painter:
            TrianglePainter(isMe ? AppColors.primaryDark : AppColors.white, isMe),
          ),
      ],
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;
  final bool isMe;

  TrianglePainter(this.color, this.isMe);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = color;
    var path = Path();

    if (isMe) {
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height);
      path.close();
    } else {
      path.lineTo(0, 0);
      path.lineTo(size.width, size.height / 2);
      path.lineTo(0, size.height);
      path.close();
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
