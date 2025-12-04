// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buddy_event_verification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BuddyEventVerification _$BuddyEventVerificationFromJson(
        Map<String, dynamic> json) =>
    _BuddyEventVerification(
      id: json['id'] as String,
      userId: json['userId'] as String,
      country: json['country'] as String,
      status: (json['status'] as num).toInt(),
      statusDescription: json['statusDescription'] as String,
      proofOfAddressUrls: (json['proofOfAddressUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      proofOfIdentityUrls: (json['proofOfIdentityUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      proofOfFacialVideoUrl: json['proofOfFacialVideoUrl'] as String,
      nationIdentityNumber: json['nationIdentityNumber'] as String,
      otherDocUrls: (json['otherDocUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$BuddyEventVerificationToJson(
        _BuddyEventVerification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'country': instance.country,
      'status': instance.status,
      'statusDescription': instance.statusDescription,
      'proofOfAddressUrls': instance.proofOfAddressUrls,
      'proofOfIdentityUrls': instance.proofOfIdentityUrls,
      'proofOfFacialVideoUrl': instance.proofOfFacialVideoUrl,
      'nationIdentityNumber': instance.nationIdentityNumber,
      'otherDocUrls': instance.otherDocUrls,
    };
