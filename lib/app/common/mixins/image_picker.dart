import 'dart:io';
import 'package:image_picker/image_picker.dart';

mixin ImagePickerMixin {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    return pickedFile != null ? File(pickedFile.path) : null;
  }

  Future<File?> pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    return pickedFile != null ? File(pickedFile.path) : null;
  }

  Future<List<File>> pickMultipleImagesFromGallery({required int maxImages}) async {
    final pickedFiles = await _picker.pickMultiImage();
    final files = pickedFiles.map((e) => File(e.path)).toList();

    // Enforce maxImages limit
    if (files.length > maxImages) {
      return files.sublist(0, maxImages);
    }
    return files;
  }
}
