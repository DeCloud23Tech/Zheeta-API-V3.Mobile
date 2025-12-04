import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/model/login_user_model.dart';
import 'package:zheeta/core/storage/token_storage/i_token_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage implements ITokenStorage {
  final FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      resetOnError: true,
      encryptedSharedPreferences: true, // Ensures data is removed on uninstall
    ),
  );

  LoginUserModel? cachedUser;

  static const String _firstRunKey = 'first_run_after_install';
  static const String _loggedInTokenKey = "LOGGEDIN_TOKEN";

  @PostConstruct()
  Future<void> init() async {
    await _clearSecureStorageOnFirstRun();
  }

  Future<void> _clearSecureStorageOnFirstRun() async {
    final prefs = await SharedPreferences.getInstance();
    final hasRunBefore = prefs.getBool(_firstRunKey) ?? false;

    if (!hasRunBefore) {
      // This is the first run after install (or reinstall)
      await _storage.deleteAll(); // Clear all secure storage entries
      await prefs.setBool(_firstRunKey, true); // Mark as run
      print("Secure storage cleared on first run after install/reinstall.");
    }
  }

  @override
  Future<void> clear() async {
    cachedUser = null;
    await _storage.delete(key: _loggedInTokenKey);
  }

  @override
  Future<LoginUserModel?> read() async {
    if (cachedUser != null) {
      return cachedUser;
    }
    final json = await _storage.read(key: _loggedInTokenKey);
    if (json == null) return null;
    try {
      var jsonDecoded = jsonDecode(json);
      return cachedUser = LoginUserModel.fromJson(jsonDecoded);
    } on FormatException {
      return null;
    } on PlatformException {
      return null;
    }
  }

  @override
  Future<void> save(LoginUserModel user) {
    cachedUser = user;
    var encodedString = jsonEncode(user.toJson());
    return _storage.write(key: _loggedInTokenKey, value: encodedString);
  }
}
