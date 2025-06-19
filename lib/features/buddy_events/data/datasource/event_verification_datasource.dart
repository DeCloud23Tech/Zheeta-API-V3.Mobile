import 'package:zheeta/features/buddy_events/data/model/buddy_event_verification.dart';

abstract class EventVerificationDataSource {
  Future<BuddyEventVerification?> getBuddyEventVerificationById(
      {required String id});
}
