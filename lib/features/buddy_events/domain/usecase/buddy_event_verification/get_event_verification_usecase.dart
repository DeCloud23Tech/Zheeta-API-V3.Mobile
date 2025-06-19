import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/buddy_events/domain/repository/event_verification_repository.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_event_verification.dart';

@prod
@LazySingleton()
class GetBuddyEventVerificationById extends UsecaseWithParams<BuddyEventVerification?, String> {
  const GetBuddyEventVerificationById(this._repo);

  final EventVerificationRepository _repo;

  @override
  ResultFuture<BuddyEventVerification?> call(String params) async =>
      await _repo.getBuddyEventVerificationById(id: params);
}
