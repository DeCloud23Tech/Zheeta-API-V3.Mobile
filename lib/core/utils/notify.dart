import 'package:flutter/material.dart';
import 'package:zheeta/router/app_router.dart';
import 'package:zheeta/shared/enums/snackbar_type.dart';

class NotifyUser {
  static void showSnackBar(String message,
      {SnackBarType type = SnackBarType.info}) {
    try {
      final context = router.navigatorKey.currentContext;
      if (context == null) return;

      // Prevent duplicates
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      // Clean message
      final cleanedMessage = message.replaceFirst('Exception:', '').trim();
      if (cleanedMessage.isEmpty) return;

      final (bgColor, icon) = _getStyle(type);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 8),
              Expanded(child: Text(cleanedMessage)),
            ],
          ),
          backgroundColor: bgColor,
          behavior: SnackBarBehavior.fixed,
          action: SnackBarAction(
            label: 'OK',
            textColor: Colors.white,
            onPressed: () {},
          ),
        ),
      );
    } catch (e, stack) {
      debugPrint('NotifyUser.showSnackBar error: $e\n$stack');
    }
  }

  static (Color, IconData) _getStyle(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return (Colors.green, Icons.check_circle);
      case SnackBarType.error:
        return (Colors.red, Icons.error);
      case SnackBarType.warning:
        return (Colors.orange, Icons.warning);
      case SnackBarType.info:
        return (Colors.black, Icons.info);
    }
  }
}
