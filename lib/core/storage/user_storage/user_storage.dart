import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/model/register_user_model.dart';
import 'package:zheeta/core/storage/user_storage/i_user_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserStorage implements IUserStorage {
  final FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      resetOnError: true,
      encryptedSharedPreferences: true, // Ensures data is removed on uninstall
    ),
  );

  UserStorage(); // Constructor for injectable

  RegisterUserModel? cachedUser;

  static const String _userStorageFirstRunKey =
      'user_storage_first_run_after_install';
  static const String _registeredUserKey = "REGISTERED_USER";
  static const String _userEmailKey = "USER_EMAIL";
  static const String _rememberedEmailKey = "REMEMBERED_USER_EMAIL";
  static const String _rememberedPasswordKey = "REMEMBERED_USER_PASSWORD";

  @PostConstruct()
  Future<void> init() async {
    await _clearSecureStorageOnFirstRun();
  }

  Future<void> _clearSecureStorageOnFirstRun() async {
    final prefs = await SharedPreferences.getInstance();
    final hasRunBefore = prefs.getBool(_userStorageFirstRunKey) ?? false;

    if (!hasRunBefore) {
      // This is the first run after install (or reinstall)
      // Clear specific keys related to user data, or deleteAll if all secure storage should be wiped
      await _storage.delete(key: _registeredUserKey);
      await _storage.delete(key: _userEmailKey);
      await _storage.delete(key: _rememberedEmailKey);
      await _storage.delete(key: _rememberedPasswordKey);
      // If you want to wipe ALL secure storage for this app on reinstall, use:
      // await _storage.deleteAll();
      await prefs.setBool(_userStorageFirstRunKey, true); // Mark as run
      print(
          "User secure storage cleared on first run after install/reinstall.");
    }
  }

  @override
  Future<void> clear() async {
    cachedUser = null;
    await _storage.delete(key: _registeredUserKey);
    // await _storage.delete(key: _userEmailKey);
  }

  @override
  Future<RegisterUserModel?> read() async {
    if (cachedUser != null) {
      return cachedUser;
    }
    final json = await _storage.read(key: _registeredUserKey);
    if (json == null) return null;
    try {
      var jsonDecoded = jsonDecode(json);
      return cachedUser = RegisterUserModel.fromJson(jsonDecoded);
    } on FormatException {
      return null;
    } on PlatformException {
      return null;
    }
  }

  @override
  Future<void> save(RegisterUserModel user) {
    cachedUser = user;
    var encodedString = jsonEncode(user.toJson());
    return _storage.write(key: _registeredUserKey, value: encodedString);
  }

  @override
  Future<void> saveEmail(String email) {
    return _storage.write(key: _userEmailKey, value: email);
  }

  @override
  Future<String?> getEmail() {
    return _storage.read(key: _userEmailKey);
  }

  @override
  Future<void> saveRememberedCredentials({
    required String email,
    required String password,
  }) async {
    await _storage.write(key: _rememberedEmailKey, value: email);
    await _storage.write(key: _rememberedPasswordKey, value: password);
  }

  @override
  Future<String?> getRememberedEmail() {
    return _storage.read(key: _rememberedEmailKey);
  }

  @override
  Future<String?> getRememberedPassword() {
    return _storage.read(key: _rememberedPasswordKey);
  }

  @override
  Future<void> clearRememberedCredentials() async {
    await _storage.delete(key: _rememberedEmailKey);
    await _storage.delete(key: _rememberedPasswordKey);
  }
}
