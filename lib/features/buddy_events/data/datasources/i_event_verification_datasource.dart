import 'package:zheeta/features/buddy_events/data/models/buddy_event_verification.dart';

abstract class IEventVerificationDataSource {
  Future<BuddyEventVerification?> getBuddyEventVerificationById(
      {required String id});
}
