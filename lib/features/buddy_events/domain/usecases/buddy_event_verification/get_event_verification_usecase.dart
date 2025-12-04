import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/buddy_events/data/models/buddy_event_verification.dart';
import 'package:zheeta/features/buddy_events/domain/repositories/event_verification_repository.dart';

@prod
@LazySingleton()
class GetBuddyEventVerificationById
    extends UsecaseWithParams<BuddyEventVerification?, String> {
  const GetBuddyEventVerificationById(this._repo);

  final IEventVerificationRepository _repo;

  @override
  ResultFuture<BuddyEventVerification?> call(String params) async =>
      await _repo.getBuddyEventVerificationById(id: params);
}
