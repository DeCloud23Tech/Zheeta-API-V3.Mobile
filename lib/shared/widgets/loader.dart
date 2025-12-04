import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:zheeta/core/constants/color.dart';

/// Simple circular loading indicator with optional padding.
Widget loadingIndicator({double padding = 100.0}) => Center(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            color: AppColors.grayscale,
            strokeWidth: 2,
          ),
        ),
      ),
    );

/// Fullscreen loader with animated bounce and message.
Widget loadingMatches(String message) => const _LoadingMessage(message: '');

class _LoadingMessage extends StatelessWidget {
  final String message;

  const _LoadingMessage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, // Keeps it centered vertically
        children: [
          const SpinKitThreeBounce(
            color: AppColors.white,
            size: 40.0,
          ),
          const SizedBox(height: 20),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
