import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:zheeta/app/storage/local_storage.dart';

final LocalStorage storage = LocalStorageImpl(Hive.box('app-local-storage'));

class LocalStorageImpl implements LocalStorage {
  final Box appLocalStorage;
  LocalStorageImpl(this.appLocalStorage);

  @override
  Future setString(String key, String value) async {
    await appLocalStorage.put(key, value);
  }

  @override
  String? getString(String key) {
    return appLocalStorage.get(key);
  }

  @override
  Future setJson(String key, Map<String, dynamic> value) async {
    await appLocalStorage.put(key, jsonEncode(value));
  }

  @override
  Map<String, dynamic>? getJson(String key) {
    return appLocalStorage.get(key) != null ? jsonDecode(appLocalStorage.get(key)) : null;
  }

  @override
  Future addToJsonList(String key, Map<String, dynamic> value) async {
    List<Map<String, dynamic>> oldList = getJsonList(key);
    oldList.add(value);
    await appLocalStorage.put(key, jsonEncode(oldList));
  }

  @override
  List<Map<String, dynamic>> getJsonList(String key) {
    return appLocalStorage.get(key) == null ? [] : jsonDecode(appLocalStorage.get(key));
  }

  @override
  Future setBool(String key, bool value) async {
    await appLocalStorage.put(key, value);
  }

  @override
  bool? getBool(String key) {
    return appLocalStorage.get(key);
  }

  @override
  Future delete(String key) async {
    await appLocalStorage.delete(key);
  }

  @override
  Future clear() async {
    await appLocalStorage.clear();
  }

  @override
  Future removeAllExcept(List<String> keys) async {
    List<String> keysToRemove = [];
    appLocalStorage.keys.map((key) {
      if (!keys.contains(key)) {
        keysToRemove.add(key);
      }
    });
    await appLocalStorage.deleteAll(keysToRemove);
  }
}
