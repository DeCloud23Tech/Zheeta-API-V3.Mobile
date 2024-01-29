import 'package:flutter/widgets.dart';

class MediaContainer extends StatelessWidget {
  bool mediaIsVideo;
  String mediaPath;
  MediaContainer(
      {super.key, required this.mediaIsVideo, required this.mediaPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Image.network(mediaPath),
    );
  }
}
