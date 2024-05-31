import 'package:flutter/material.dart';
import 'package:zheeta/app/common/utility.dart';

class MediaContainer extends StatefulWidget {
  String mediaPath;
  MediaContainer({super.key, required this.mediaPath});

  @override
  State<MediaContainer> createState() => _MediaContainerState();
}

class _MediaContainerState extends State<MediaContainer> {
  MediaType mediaType = MediaType.IMAGE;
  ImageProvider? videoThumb;

  @override
  void initState() {
    mediaType = Utility.getMediaType(widget.mediaPath);
    super.initState();
  }

  Future<ImageProvider<Object>>? processImage() async {
    var theData = await Utility.getVideoThumbnail(widget.mediaPath);

    // videoThumb = mediaType == MediaType.VIDEO && theData != null
    //     ? await Utility.processImage(theData)
    //     : null;
    if (theData != null) return MemoryImage(theData);
    throw Exception();
  }

  @override
  Widget build(BuildContext context) {
    return mediaType == MediaType.VIDEO
        ? FutureBuilder(
            future: processImage(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Container(
                    height: 170,
                    width: 122,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.cover, image: snapshot.data!)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.video_camera_back_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ));
              } else {
                return SizedBox();
              }
            })
        : Container(
            height: 170,
            width: 122,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(widget.mediaPath))));
    // return Container(
    //   height: 170,
    //   width: 122,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    //   clipBehavior: Clip.hardEdge,
    //   child: Stack(
    //     children: [
    //       mediaType == MediaType.VIDEO
    //           ? FutureBuilder(
    //               future: processImage(),
    //               builder: (context, snapshot) {
    //                 if (snapshot.data != null) {
    //                   return Image(
    //                     image: snapshot.data!,
    //                   );
    //                 } else {
    //                   return SizedBox();
    //                 }
    //               })
    //           : Image.network(widget.mediaPath),
    //       if (mediaType == MediaType.VIDEO)
    //         Positioned(
    //           child: Icon(Icons.video_camera_back_rounded),
    //           top: 10,
    //           right: 10,
    //         )
    //     ],
    //   ),
    // );
  }
}
