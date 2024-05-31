import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../activity/data/models/activity_model.dart';
import '../../../widgets/media_container.dart';

class PostsWidget extends ConsumerStatefulWidget {
  final bool isVideo;
  final List<ActivityModel>? medias;

  PostsWidget({super.key, this.isVideo = false, required this.medias});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostsWidgetState();
}

class _PostsWidgetState extends ConsumerState<PostsWidget> {
  @override
  Widget build(BuildContext context) {
    print(widget.medias);
    // List<String> theMedia = [];
    // if(widget.medias != null){
    //   theMedia = widget.medias?.map((e) => e.mediaCollectionURL[0]).toList();
    // }
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: double.infinity,
        child: Wrap(
            runSpacing: 10,
            alignment: WrapAlignment.spaceBetween,
            // runAlignment: WrapAlignment.spaceBetween,
          children: widget.medias!
              .where((e) => e.mediaCollectionURL != null && e.mediaCollectionURL.isNotEmpty)
              .map((e) => MediaContainer(mediaPath: e.mediaCollectionURL[0]))
              .toList(),

          // children: [
          //   ...List.generate(10, (index) {
          //     return MediaContainer();
          //     // return Container(
          //     //   height: 170,
          //     //   width: 122,
          //     //   decoration:
          //     //       BoxDecoration(borderRadius: BorderRadius.circular(10)),
          //     //   clipBehavior: Clip.hardEdge,
          //     //   child: Image.asset('assets/images/post.png', fit: BoxFit.cover),
          //     // );
          //   })
          // ],
        ),
      ),
    );
  }
}
