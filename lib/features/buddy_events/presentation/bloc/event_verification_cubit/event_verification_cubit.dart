import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/buddy_events/domain/usecase/buddy_event_verification/get_event_verification_usecase.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_event_verification.dart';

part 'event_verification_state.dart';

@prod
@LazySingleton()
class EventVerificationCubit extends Cubit<EventVerificationState> {
  final GetBuddyEventVerificationById getBuddyEventVerificationById;

  EventVerificationCubit({
    required this.getBuddyEventVerificationById,
  }) : super(EventVerificationInitial());

  Future<EventVerificationLoaded?> fetchEventVerificationCubit({required String id}) async {
    emit(EventVerificationLoading());

    final result = await getBuddyEventVerificationById(id);

    return result.fold(
          (failure) {
        emit(EventVerificationError(failure.message));
        return null;
      },
          (verification) {
        final loadedState = EventVerificationLoaded(verification);
        emit(loadedState);
        return loadedState;
      },
    );
  }

}
