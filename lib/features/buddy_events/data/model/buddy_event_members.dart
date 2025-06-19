import 'package:freezed_annotation/freezed_annotation.dart';

part 'buddy_event_members.freezed.dart';
part 'buddy_event_members.g.dart';

@freezed
class BuddyEventMember with _$BuddyEventMember {
  factory BuddyEventMember({
    required String userId,
    required String username,
    required String profilePicture,
  }) = _BuddyEventMember;

  factory BuddyEventMember.fromJson(Map<String, dynamic> json) => _$BuddyEventMemberFromJson(json);
}
