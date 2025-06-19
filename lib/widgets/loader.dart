import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:zheeta/common/constants/color.dart';

// class Loader {
//   static void show(BuildContext context) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) => const Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
//
//   static void hide(BuildContext context) {
//     Navigator.of(context).pop();
//   }
// }

Widget loadingIndicator() => Padding(
      padding: const EdgeInsets.all(100.0),
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            color: AppColors.grayscale,
            strokeWidth: 2,
          ),
        ),
      ),
    );

Widget loadingMatches(String message) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated Loader
          const SpinKitThreeBounce(
            color: AppColors.white,
            size: 40.0,
          ),
          const SizedBox(height: 20), // Spacing
          // Message Text
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
