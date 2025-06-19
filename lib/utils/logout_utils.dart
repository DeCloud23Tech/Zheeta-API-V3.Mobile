import 'package:flutter/material.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/common/storage/token_storage/i_token_storage.dart';
import 'package:zheeta/common/storage/user_storage/i_user_storage.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/core/router/app_router.dart';
import 'package:zheeta/core/router/app_router.gr.dart';
import 'package:zheeta/utils/token_utils.dart';

Future<void> logout(BuildContext context) async {
  try {
    final ITokenStorage tokenStorage = locator<ITokenStorage>();
    final IUserStorage userStorage = locator<IUserStorage>();

    // Clear token and user storage
    await tokenStorage.clear();
    await TokenUtil.clearToken();
    await userStorage.clear();

    // Navigate to the sign-in screen
    router.replaceAll([const SignInRoute()]);
  } catch (error, stackTrace) {
    print("Logout failed: $error\n$stackTrace");
    NotifyUser.showSnackBar('Failed to log out. Please try again.');
  }
}
