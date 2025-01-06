import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/mixins/image_picker.dart';

class MediaPicker extends StatefulWidget {
  final Function(List<File>) onMediaFilesChanged;
  final List<File> initialMediaFiles;
  final int maxImages; // Add maxImages field

  const MediaPicker({
    Key? key,
    required this.onMediaFilesChanged,
    this.initialMediaFiles = const [],
    this.maxImages = 3, // Default max is 3, can be customized
  }) : super(key: key);

  @override
  _MediaPickerState createState() => _MediaPickerState();
}

class _MediaPickerState extends State<MediaPicker> with ImagePickerMixin {
  late List<File> mediaFiles;

  @override
  void initState() {
    super.initState();
    mediaFiles = List.from(widget.initialMediaFiles);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () async {
            if (mediaFiles.length >= widget.maxImages) {
              // Show a message if the user tries to select more than allowed
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:
                      Text('You can select up to ${widget.maxImages} images.'),
                ),
              );
              return;
            }

            final images = await pickMultipleImagesFromGallery(
              maxImages: widget.maxImages - mediaFiles.length,
            );
            if (images.isNotEmpty) {
              setState(() {
                mediaFiles.addAll(images);
              });
              widget.onMediaFilesChanged(mediaFiles);
            }
            // final image = await pickImageFromGallery();
            // if (image != null) {
            //   setState(() {
            //     mediaFiles.add(image);
            //   });
            //   widget.onMediaFilesChanged(mediaFiles);
            // }
          },
          child: DottedBorder(
            dashPattern: [8, 4],
            strokeWidth: 1.5,
            color: Colors.grey.withOpacity(0.5),
            strokeCap: StrokeCap.round,
            borderType: BorderType.RRect,
            radius: Radius.circular(10),
            child: Container(
              color: Colors.white,
              width: 85,
              height: 85,
              padding: const EdgeInsets.all(8),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: SvgPicture.asset(
                          'assets/images/icons/add-media.svg',
                          width: 12,
                          height: 12,
                        ),
                      ),
                      const TextSpan(
                        text: ' Add',
                        style: TextStyle(
                            color: AppColors.primaryDark,
                            fontWeight: FontWeight.w600,
                            fontSize: 10),
                      ),
                      const TextSpan(
                        text: ' image',
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(mediaFiles.length, (index) {
              return Stack(
                children: [
                  Container(
                    width: 85,
                    height: 85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: FileImage(mediaFiles[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          mediaFiles.removeAt(index);
                        });
                        widget.onMediaFilesChanged(mediaFiles);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.grey,
                          size: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
