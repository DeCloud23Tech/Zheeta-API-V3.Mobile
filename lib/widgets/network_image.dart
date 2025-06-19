import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/common/constants/color.dart';

class CustomNetworkImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String? imageUrl;
  final BoxFit fit;

  const CustomNetworkImage({
    super.key,
    this.height,
    this.width,
    required this.imageUrl,
    this.fit = BoxFit.cover, // Default fit to prevent null errors
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imageUrl?.isNotEmpty == true
          ? imageUrl!
          : "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png",
      fit: fit,
      placeholder: (context, url) => const Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CupertinoActivityIndicator(
            color: Colors.grey, // Fix: Now the loader is visible
          ),
        ),
      ),
      errorWidget: (context, url, error) => Center(
        child: Icon(Icons.broken_image, color: AppColors.grey, size: width ?? 40),
      ),
    );
  }
}
