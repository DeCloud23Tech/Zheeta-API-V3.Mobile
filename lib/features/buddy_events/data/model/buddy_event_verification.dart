import 'package:freezed_annotation/freezed_annotation.dart';

part 'buddy_event_verification.freezed.dart';
part 'buddy_event_verification.g.dart';

@freezed
class BuddyEventVerification with _$BuddyEventVerification {
  const factory BuddyEventVerification({
    required String id,
    required String userId,
    required String country,
    required int status,
    required String statusDescription,
    required List<String> proofOfAddressUrls,
    required List<String> proofOfIdentityUrls,
    required String proofOfFacialVideoUrl,
    required String nationIdentityNumber,
    required List<String> otherDocUrls,
  }) = _BuddyEventVerification;

  factory BuddyEventVerification.fromJson(Map<String, dynamic> json) =>
      _$BuddyEventVerificationFromJson(json);
}
