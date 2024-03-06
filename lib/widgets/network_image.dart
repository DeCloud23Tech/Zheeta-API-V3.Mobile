import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';

class CustomNetworkImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String? imageUrl;
  final BoxFit? fit;
  const CustomNetworkImage({super.key, this.height, this.width, required this.imageUrl, this.fit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imageUrl ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png",
      fit: fit,
      placeholder: (context, url) => const Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            color: AppColors.primaryDark,
            strokeWidth: 2,
          ),
        ),
      ),
    );
  }
}
