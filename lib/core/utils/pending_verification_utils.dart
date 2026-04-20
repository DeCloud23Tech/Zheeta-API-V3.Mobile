import 'dart:convert';

import 'package:zheeta/core/storage/storage/i_storage.dart';
import 'package:zheeta/di/di.dart';

class PendingVerificationData {
  final bool isPhoneNumber;
  final String phoneNumber;
  final String? countryCode;
  final String email;
  final int createdAtMillis;

  const PendingVerificationData({
    required this.isPhoneNumber,
    required this.phoneNumber,
    required this.countryCode,
    required this.email,
    required this.createdAtMillis,
  });

  Map<String, dynamic> toJson() {
    return {
      'isPhoneNumber': isPhoneNumber,
      'phoneNumber': phoneNumber,
      'countryCode': countryCode,
      'email': email,
      'createdAtMillis': createdAtMillis,
    };
  }

  factory PendingVerificationData.fromJson(Map<String, dynamic> json) {
    return PendingVerificationData(
      isPhoneNumber: json['isPhoneNumber'] as bool? ?? false,
      phoneNumber: json['phoneNumber'] as String? ?? '',
      countryCode: json['countryCode'] as String?,
      email: json['email'] as String? ?? '',
      createdAtMillis: json['createdAtMillis'] as int? ?? 0,
    );
  }
}

class PendingVerificationUtils {
  static const String _pendingVerificationKey = 'pending_verification_data';
  static const Duration _ttl = Duration(minutes: 30);

  static IStorage get _storage => locator<IStorage>();

  static Future<void> save({
    required bool isPhoneNumber,
    required String phoneNumber,
    required String? countryCode,
    required String email,
  }) async {
    final payload = PendingVerificationData(
      isPhoneNumber: isPhoneNumber,
      phoneNumber: phoneNumber,
      countryCode: countryCode,
      email: email,
      createdAtMillis: DateTime.now().millisecondsSinceEpoch,
    );

    await _storage.setString(_pendingVerificationKey, jsonEncode(payload));
  }

  static Future<PendingVerificationData?> read() async {
    final raw = await _storage.getString(_pendingVerificationKey);
    if (raw == null || raw.isEmpty) return null;

    try {
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      final data = PendingVerificationData.fromJson(decoded);
      final nowMillis = DateTime.now().millisecondsSinceEpoch;
      final isExpired = nowMillis - data.createdAtMillis > _ttl.inMilliseconds;
      if (isExpired) {
        await clear();
        return null;
      }
      return data;
    } catch (_) {
      await clear();
      return null;
    }
  }

  static Future<void> clear() async {
    await _storage.remove(_pendingVerificationKey);
  }
}
