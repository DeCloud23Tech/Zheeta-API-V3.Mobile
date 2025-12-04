import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/core/constants/color.dart';

class CustomNetworkImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String? imageUrl;
  final BoxFit fit;
  final BorderRadiusGeometry? borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;

  const CustomNetworkImage({
    super.key,
    this.height,
    this.width,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    final validUrl = (imageUrl?.trim().isNotEmpty ?? false)
        ? imageUrl!
        : "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png";

    final img = CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: validUrl,
      fit: fit,
      placeholder: (context, url) =>
          placeholder ??
          const Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CupertinoActivityIndicator(),
            ),
          ),
      errorWidget: (context, url, error) =>
          errorWidget ??
          Center(
            child: Icon(
              Icons.broken_image,
              color: AppColors.grey,
              size: width ?? 40,
            ),
          ),
    );

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        child: img,
      );
    }

    return img;
  }
}
