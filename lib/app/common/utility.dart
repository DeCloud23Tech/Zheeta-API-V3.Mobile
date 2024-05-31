import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

enum MediaType { IMAGE, VIDEO, UNKNOWN }

class Utility {
  static MediaType getMediaType(String url) {
    Uri uri = Uri.parse(url);
    String typeString = uri.path.substring(uri.path.length - 3).toLowerCase();
    if (typeString == "jpg" || typeString == "jpeg" || typeString == "png") {
      return MediaType.IMAGE;
    }
    if (typeString == "mp4") {
      return MediaType.VIDEO;
    } else {
      return MediaType.UNKNOWN;
    }
  }

  static Future<Uint8List?> getVideoThumbnail(String path) async {
    final fileName = await VideoThumbnail.thumbnailData(
      video: path,

      imageFormat: ImageFormat.JPEG,
      maxHeight:
          64, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
      quality: 75,
    );
    return fileName;
  }

  static Future<ImageProvider<Object>>? processImage(Uint8List data) async {
    return MemoryImage(data);
  }
}
