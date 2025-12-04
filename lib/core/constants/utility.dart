import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as p;

enum MediaType { image, video, unknown }

class Utility {
  static MediaType getMediaType(String url) {
    final extension = p.extension(url).toLowerCase();

    switch (extension) {
      case '.jpg':
      case '.jpeg':
      case '.png':
        return MediaType.image;
      case '.mp4':
        return MediaType.video;
      default:
        return MediaType.unknown;
    }
  }

  // Example (uncomment if you add `video_thumbnail` package):
  // static Future<Uint8List?> getVideoThumbnail(String path) async {
  //   return await VideoThumbnail.thumbnailData(
  //     video: path,
  //     imageFormat: ImageFormat.JPEG,
  //     maxHeight: 64, // height of the thumbnail
  //     quality: 75,
  //   );
  // }

  static ImageProvider processImage(Uint8List data) {
    return MemoryImage(data);
  }
}
