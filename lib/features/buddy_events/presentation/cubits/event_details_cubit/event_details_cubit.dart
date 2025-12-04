import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/buddy_events/data/models/buddy_event_id.dart';
import 'package:zheeta/features/buddy_events/domain/usecases/get_event_details_usecase.dart';

part 'event_details_state.dart';

@prod
@injectable
class EventDetailsCubit extends Cubit<EventDetailsState> {
  final GetBuddyEventDetails _getBuddyEventDetails;

  EventDetailsCubit({
    required GetBuddyEventDetails getBuddyEventDetails,
  })  : _getBuddyEventDetails = getBuddyEventDetails,
        super(EventDetailsState.initial());

  Future<void> fetchEventDetails({
    required String eventId,
    required String creatorId,
  }) async {
    emit(state.copyWith(status: EventDetailsStatus.loading));

    final result = await _getBuddyEventDetails.call(
      EventDetailsParams(eventId: eventId, creatorId: creatorId),
    );

    result.fold(
      (error) {
        emit(state.copyWith(
          status: EventDetailsStatus.error,
          errorMessage: error.message,
        ));
      },
      (data) {
        emit(state.copyWith(
          status: EventDetailsStatus.loaded,
          event: data,
        ));
      },
    );
  }

  void reset() => emit(EventDetailsState.initial());
}
