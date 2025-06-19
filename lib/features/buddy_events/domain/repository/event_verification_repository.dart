import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_event_verification.dart';

abstract class EventVerificationRepository {

  // ResultVoid createBuddyEventVerification({
  //   required String userId,
  //   required String country,
  //   required List<String> proofOfAddressUrls,
  //   required List<String> proofOfIdentityUrls,
  //   required String proofOfFacialVideoUrl,
  //   required String nationIdentityNumber,
  //   required List<String> otherDocUrls,
  // });

  ResultFuture<BuddyEventVerification?> getBuddyEventVerificationById(
      {required String id});
}
