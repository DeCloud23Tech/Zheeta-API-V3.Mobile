import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/mixin/image_picker.dart';
import 'package:zheeta/features/profile/data/models/user_profile_model.dart';
import 'package:zheeta/shared/widgets/network_image.dart';

class ImageSelectionGrid extends StatefulWidget {
  final List<File> selectedImages;
  final Function(List<File>) onImagesChanged;
  final List<UserCarousels>? carouselImageUrls;

  const ImageSelectionGrid({
    super.key,
    required this.selectedImages,
    required this.onImagesChanged,
    this.carouselImageUrls,
  });

  @override
  ImageSelectionGridState createState() => ImageSelectionGridState();
}

class ImageSelectionGridState extends State<ImageSelectionGrid>
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
                                        .carouselPhotoUrl!,
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
                      options: RectDottedBorderOptions(
                        dashPattern: [8, 4],
                        strokeWidth: 1.5,
                        color: AppColors.grey.withValues(alpha: 0.5),
                        strokeCap: StrokeCap.round,
                      ),
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

class CarouselImageEditor extends StatefulWidget {
  final List<UserCarousels>? imageUrls;
  final Function(File, String) onImageChanged;
  final List<File> selectedImages;
  final Function(List<File>) onImagesChanged;

  const CarouselImageEditor({
    super.key,
    required this.imageUrls,
    required this.onImageChanged,
    required this.selectedImages,
    required this.onImagesChanged,
  });

  @override
  CarouselImageEditorState createState() => CarouselImageEditorState();
}

class CarouselImageEditorState extends State<CarouselImageEditor>
    with ImagePickerMixin {
  late List<ValueNotifier<File?>> replacedImages;
  late List<ValueNotifier<File?>> newImages;

  @override
  void initState() {
    super.initState();
    // Initialize replacedImages with null values for each image URL
    replacedImages = List.generate(
      widget.imageUrls?.length ?? 0,
      (index) => ValueNotifier<File?>(null),
    );
    // Initialize newImages with the selectedImages
    newImages = widget.selectedImages
        .map((file) => ValueNotifier<File?>(file))
        .toList();
  }

  Future<void> _getImage() async {
    final image = await pickImageFromGallery();
    if (image != null) {
      setState(() {
        newImages.add(ValueNotifier(image));
        widget.selectedImages.add(image);
        widget.onImagesChanged(widget.selectedImages);
      });
    }
  }

  Future<void> _replaceImage(int index) async {
    final newImage = await pickImageFromGallery();
    if (newImage != null) {
      // If the index is within the existing images range
      if (index < (widget.imageUrls?.length ?? 0)) {
        replacedImages[index].value = newImage;
        widget.onImageChanged(
            newImage, widget.imageUrls?[index].carouselPhotoUrl ?? '');
      }
      // If the index is within the new images range
      else if (index - (widget.imageUrls?.length ?? 0) < newImages.length) {
        final newIndex = index - (widget.imageUrls?.length ?? 0);
        newImages[newIndex].value = newImage;
        widget.selectedImages[newIndex] = newImage;
        widget.onImagesChanged(widget.selectedImages);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Calculate total items (existing + new + empty slots up to 6)
    final totalExisting = widget.imageUrls?.length ?? 0;
    final totalNew = newImages.length;
    final totalItems =
        totalExisting + totalNew < 6 ? 6 : totalExisting + totalNew;

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: .63,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 30.0,
      ),
      itemCount: totalItems,
      itemBuilder: (context, index) {
        // Check if this is an existing image
        if (index < totalExisting) {
          return _buildExistingImageItem(index);
        }
        // Check if this is a new image
        else if (index - totalExisting < totalNew) {
          return _buildNewImageItem(index - totalExisting);
        }
        // Otherwise, it's an empty slot
        else {
          return _buildAddImageItem();
        }
      },
    );
  }

  Widget _buildExistingImageItem(int index) {
    return ValueListenableBuilder<File?>(
      valueListenable: replacedImages[index],
      builder: (context, file, child) {
        return Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: AspectRatio(
                  aspectRatio: .65,
                  child: file != null
                      ? Image.file(file, fit: BoxFit.cover)
                      : GestureDetector(
                          onTap: () => _replaceImage(index),
                          child: CustomNetworkImage(
                            imageUrl: widget.imageUrls![index].carouselPhotoUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => _replaceImage(index),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black54,
                  ),
                  child: const Icon(Icons.edit, color: Colors.white, size: 20),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildNewImageItem(int index) {
    return ValueListenableBuilder<File?>(
      valueListenable: newImages[index],
      builder: (context, file, child) {
        return Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: AspectRatio(
                  aspectRatio: .65,
                  child: file != null
                      ? Image.file(file, fit: BoxFit.cover)
                      : Container(), // Shouldn't happen as we have the file
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () =>
                    _replaceImage(index + (widget.imageUrls?.length ?? 0)),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black54,
                  ),
                  child: const Icon(Icons.edit, color: Colors.white, size: 20),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAddImageItem() {
    return GestureDetector(
      onTap: _getImage,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.grey,
          size: 40,
        ),
      ),
    );
  }
}
