import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/storage/user_storage/i_user_storage.dart';
import 'package:zheeta/features/authentication/data/model/register_user_model.dart';

@prod
@LazySingleton(as: IUserStorage)
class UserStorage implements IUserStorage {
  final FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      resetOnError: true,
      encryptedSharedPreferences: true, // Ensures data is removed on uninstall
    ), // Resets storage on error
  );

  UserStorage();

  RegisterUserModel? cachedUser;

  @override
  Future<void> clear() async {
    cachedUser = null;
    await _storage.delete(key: "REGISTERED_USER");
    // await _storage.delete(key: "USER_EMAIL");
    // or use await _storage.deleteAll(); if you want to wipe everything
  }

  @override
  Future<RegisterUserModel?> read() async {
    if (cachedUser != null) {
      return cachedUser;
    }
    final json = await _storage.read(key: "REGISTERED_USER");
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
    return _storage.write(key: "REGISTERED_USER", value: encodedString);
  }

  @override
  Future<void> saveEmail(String email) {
    return _storage.write(key: "USER_EMAIL", value: email);
  }

  @override
  Future<String?> getEmail() {
    return _storage.read(key: "USER_EMAIL");
  }
}
