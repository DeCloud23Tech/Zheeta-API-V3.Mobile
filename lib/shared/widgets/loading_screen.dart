import 'package:flutter/material.dart';
import 'package:zheeta/core/constants/color.dart';

/// Fullscreen loading overlay with optional background color and loader image.
class LoadingScreen extends StatelessWidget {
  final Color backgroundColor;
  final String loaderImagePath;

  const LoadingScreen({
    super.key,
    this.backgroundColor = AppColors.primaryDark,
    this.loaderImagePath = "assets/images/welcome.png",
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const ModalBarrier(
          dismissible: false,
          semanticsLabel: 'Loading',
          barrierSemanticsDismissible: false,
        ),
        Container(
          color: backgroundColor,
        ),
        AnimatedLoaderImage(imagePath: loaderImagePath),
      ],
    );
  }
}

/// Loader image with infinite rotation.
class AnimatedLoaderImage extends StatefulWidget {
  final String imagePath;

  const AnimatedLoaderImage({
    super.key,
    required this.imagePath,
  });

  @override
  State<AnimatedLoaderImage> createState() => _AnimatedLoaderImageState();
}

class _AnimatedLoaderImageState extends State<AnimatedLoaderImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return RotationTransition(
      turns: _controller,
      child: Image.asset(
        widget.imagePath,
        width: screenWidth * 0.75,
      ),
    );
  }
}
