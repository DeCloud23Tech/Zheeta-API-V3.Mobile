import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

mixin ImagePickerMixin {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    return pickedFile != null ? _compressImage(File(pickedFile.path)) : null;
  }

  Future<File?> pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    return pickedFile != null ? _compressImage(File(pickedFile.path)) : null;
  }

  Future<List<File>> pickMultipleImagesFromGallery(
      {required int maxImages}) async {
    final pickedFiles = await _picker.pickMultiImage();
    List<File> files = pickedFiles.map((e) => File(e.path)).toList();

    // Enforce maxImages limit
    if (files.length > maxImages) {
      files = files.sublist(0, maxImages);
    }

    // Compress images
    List<File> compressedFiles = [];
    for (File file in files) {
      final compressedFile = await _compressImage(file);
      if (compressedFile != null) {
        compressedFiles.add(compressedFile);
      }
    }
    return compressedFiles;
  }

  /// Compresses the image to reduce file size
  Future<File?> _compressImage(File file) async {
    final dir = await getTemporaryDirectory();
    final targetPath =
        path.join(dir.path, '${DateTime.now().millisecondsSinceEpoch}.jpg');

    final compressedFile = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path, targetPath,
        quality: 80 // Best balance between size & clarity
        );

    return compressedFile != null ? File(compressedFile.path) : null;
  }
}
