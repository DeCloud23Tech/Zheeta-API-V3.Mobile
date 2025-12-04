import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:zheeta/core/storage/token_storage/i_token_storage.dart';
import 'package:zheeta/core/storage/user_storage/i_user_storage.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/core/utils/token_utils.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/router/app_router.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/enums/snackbar_type.dart';

Future<void> logout(BuildContext context) async {
  try {
    final tokenStorage = locator<ITokenStorage>();
    final userStorage = locator<IUserStorage>();

    // Clear local storage and cached token
    await tokenStorage.clear();
    await TokenUtil.clearToken();
    await userStorage.clear();

    // Navigate to sign-in screen
    router.replaceAll([const SignInRoute()]);
  } catch (error, stackTrace) {
    debugPrint("Logout failed: $error\n$stackTrace");
    NotifyUser.showSnackBar('Logout failed. Please try again.',
        type: SnackBarType.error);
  }
}
