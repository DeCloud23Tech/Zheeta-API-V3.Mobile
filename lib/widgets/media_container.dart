import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:zheeta/app/common/utility.dart';

class MediaContainer extends StatefulWidget {
  final String mediaPath;

  const MediaContainer({super.key, required this.mediaPath});

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

  // Future<ImageProvider<Object>> _getVideoThumbnail() async {
  //   final thumbnailData = await Utility.getVideoThumbnail(widget.mediaPath);
  //   return thumbnailData != null
  //       ? MemoryImage(thumbnailData)
  //       : throw Exception("Failed to load thumbnail");
  // }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.mediaPath,
      height: 150,
      width: 125,
      fit: BoxFit.cover,
      imageBuilder: (context, imageProvider) =>
          _buildMediaContainer(imageProvider),
      // placeholder: (context, url) =>
      //     const Center(child: CircularProgressIndicator()),
      // errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

  Widget _buildMediaContainer(ImageProvider<Object> imageProvider) {
    return Container(
      height: 170,
      width: 122,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: imageProvider,
        ),
      ),
      child: mediaType == MediaType.VIDEO
          ? const Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.video_camera_back_rounded,
                color: Colors.white,
              ),
            )
          : null,
    );
  }
}
