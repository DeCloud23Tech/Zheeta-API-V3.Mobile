import 'package:flutter/material.dart';
import 'package:zheeta/common/constants/color.dart';

class LoadingScreen extends StatelessWidget {
  final Color? backgroundColor;
  final String? loaderImagePath;

  const LoadingScreen({
    super.key,
    this.backgroundColor,
    this.loaderImagePath = "assets/images/welcome.png",
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ModalBarrier(
          dismissible: false,
          color: backgroundColor ?? AppColors.primaryDark,
          semanticsLabel: 'Loading',
          barrierSemanticsDismissible: false,
        ),
        Align(
          alignment: Alignment.center,
          child: AnimatedLoaderImage(
            imagePath: loaderImagePath ?? "assets/images/welcome.png",
          ),
        ),
      ],
    );
  }
}

class AnimatedLoaderImage extends StatefulWidget {
  final String imagePath;

  const AnimatedLoaderImage({super.key, required this.imagePath});

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
      duration: const Duration(seconds: 5),
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
    return RotationTransition(
      turns: _controller,
      child: Image.asset(
        widget.imagePath,
        width: MediaQuery.of(context).size.width * .8, // Set the desired size of the loader image
        // height: 50,
      ),
    );
  }
}
