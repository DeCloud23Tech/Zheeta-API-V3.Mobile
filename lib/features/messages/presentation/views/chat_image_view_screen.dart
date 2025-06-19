import 'package:flutter/material.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/widgets/back_button.dart';

class ImageViewerScreen extends StatelessWidget {
  final String imageUrl;

  const ImageViewerScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0,
        leading: AppBackButton(),
      ),
      body: Center(
        child: InteractiveViewer(
          child: SizedBox(
            width: 300,
            height: 300,
            child: Image.network(
              imageUrl,
              fit: BoxFit.fitHeight,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: progress.expectedTotalBytes != null
                        ? progress.cumulativeBytesLoaded /
                        (progress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.error, color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
