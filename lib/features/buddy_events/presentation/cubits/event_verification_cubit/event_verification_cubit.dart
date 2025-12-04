import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/buddy_events/data/models/buddy_event_verification.dart';
import 'package:zheeta/features/buddy_events/domain/usecases/buddy_event_verification/get_event_verification_usecase.dart';

part 'event_verification_state.dart';

@prod
@injectable
class EventVerificationCubit extends Cubit<EventVerificationState> {
  final GetBuddyEventVerificationById _getVerification;

  EventVerificationCubit({
    required GetBuddyEventVerificationById getVerification,
  })  : _getVerification = getVerification,
        super(EventVerificationState.initial());

  Future<void> fetchVerification(String id) async {
    emit(state.copyWith(status: EventVerificationStatus.loading));

    final result = await _getVerification.call(id);

    result.fold(
      (error) {
        print("EventVerificationCubit error: ${error.message}");
        emit(state.copyWith(
          status: EventVerificationStatus.error,
          errorMessage: error.message,
        ));
      },
      (data) {
        print("EventVerificationCubit fetched: $data");
        emit(state.copyWith(
          status: EventVerificationStatus.loaded,
          verification: data,
        ));
      },
    );
  }

  void reset() => emit(EventVerificationState.initial());
}
