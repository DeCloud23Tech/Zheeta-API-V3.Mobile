import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:zheeta/core/constants/utility.dart';

class MediaContainer extends StatefulWidget {
  final String mediaPath;
  final double height;
  final double width;

  const MediaContainer({
    super.key,
    required this.mediaPath,
    this.height = 150,
    this.width = 125,
  });

  @override
  State<MediaContainer> createState() => _MediaContainerState();
}

class _MediaContainerState extends State<MediaContainer> {
  late final MediaType mediaType;

  @override
  void initState() {
    super.initState();
    mediaType = Utility.getMediaType(widget.mediaPath);
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.mediaPath,
      height: widget.height,
      width: widget.width,
      fit: BoxFit.cover,
      imageBuilder: (context, imageProvider) =>
          _buildMediaContainer(imageProvider),
      placeholder: (context, url) => const Center(
        child: SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
      errorWidget: (context, url, error) => const Center(
        child: Icon(Icons.broken_image, color: Colors.grey),
      ),
    );
  }

  Widget _buildMediaContainer(ImageProvider<Object> imageProvider) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: imageProvider,
        ),
      ),
      child: mediaType == MediaType.video
          ? const Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Icon(
                  Icons.videocam_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            )
          : null,
    );
  }
}
