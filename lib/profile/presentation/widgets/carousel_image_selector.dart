import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/mixins/image_picker.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';

class ImageSelectionGrid extends StatefulWidget {
  final List<File> selectedImages;
  final Function(List<File>) onImagesChanged; // Callback function
  final List<UserCarousels>? carouselImageUrls;

  ImageSelectionGrid({
    required this.selectedImages,
    required this.onImagesChanged,
    this.carouselImageUrls,
  });

  @override
  _ImageSelectionGridState createState() => _ImageSelectionGridState();
}

class _ImageSelectionGridState extends State<ImageSelectionGrid>
    with ImagePickerMixin {
  late List<File?> replacedImages; // Track replaced images

  @override
  void initState() {
    super.initState();
    replacedImages =
        List<File?>.filled(widget.carouselImageUrls?.length ?? 0, null);
  }

  Future<void> _getImage() async {
    final image = await pickImageFromGallery(); // Use the mixin method
    if (image != null) {
      setState(() {
        widget.selectedImages.add(image);
        widget.onImagesChanged(
            widget.selectedImages); // Call the callback function
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      widget.selectedImages.removeAt(index);
      widget
          .onImagesChanged(widget.selectedImages); // Call the callback function
    });
  }

  void _replaceImage(int index) async {
    final newImage = await pickImageFromGallery();
    if (newImage != null) {
      setState(() {
        // Replace image at specified index in replacedImages
        replacedImages[index] = newImage;
        // Update selectedImages or call onImagesChanged as necessary
        widget.onImagesChanged(replacedImages.whereType<File>().toList());
      });
    }
  }

  void _revertImage(int index) {
    setState(() {
      // Reset the replaced image to null
      replacedImages[index] = null;
      widget.onImagesChanged(
        replacedImages.whereType<File>().toList(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: GridView.count(
        mainAxisSpacing: 30.0,
        crossAxisSpacing: 15.0,
        crossAxisCount: 3,
        childAspectRatio: .63,
        padding: EdgeInsets.zero,
        children: List.generate(6, (index) {
          //  to upload new carousel images
          if (index < widget.selectedImages.length &&
              widget.carouselImageUrls == null) {
            return Stack(
              children: [
                GestureDetector(
                  onTap: () => _removeImage(index),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: AspectRatio(
                      aspectRatio: .65,
                      child: Image.file(widget.selectedImages[index],
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () => _removeImage(index),
                    child: Container(
                      height: 30,
                      width: 30,
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.white),
                        color: AppColors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        size: 18.0,
                      ),
                    ),
                  ),
                ),
              ],
            );
            // to edit uploaded carousel images
          } else if (index < (widget.carouselImageUrls?.length ?? 0)) {
            {
              final imageFile = replacedImages[index];
              return Stack(
                children: [
                  GestureDetector(
                    onTap: () => _revertImage(index),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: AspectRatio(
                        aspectRatio: .65,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            imageFile != null
                                ? Image.file(imageFile, fit: BoxFit.cover)
                                : Image.network(
                                    widget.carouselImageUrls![index]
                                        .carouselPhotoUrl
                              !,
                                    fit: BoxFit.cover,
                                  ),
                            if (imageFile !=
                                null) // Show revert icon only if replaced
                              Positioned(
                                top: 5,
                                left: 5,
                                child: Icon(
                                  Icons.refresh, // Revert icon
                                  size: 20.0,
                                  color: AppColors.white,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () => _replaceImage(index),
                      child: Container(
                        height: 30,
                        width: 30,
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.white),
                          color: AppColors.grey,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.edit,
                          size: 18.0,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          } else {
            return Stack(
              children: [
                GestureDetector(
                  onTap: () => _getImage(),
                  child: AspectRatio(
                    aspectRatio: .65,
                    child: DottedBorder(
                      dashPattern: [8, 4],
                      strokeWidth: 1.5,
                      color: AppColors.grayscale,
                      strokeCap: StrokeCap.round,
                      borderType: BorderType.RRect,
                      radius: Radius.circular(5),
                      child: Container(
                        color: AppColors.primaryLightBackground,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () => _getImage(),
                    child: Container(
                      height: 30,
                      width: 30,
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.white),
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        size: 18.0,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
