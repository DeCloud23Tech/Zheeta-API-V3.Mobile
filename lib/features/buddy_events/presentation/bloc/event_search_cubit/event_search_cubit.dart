import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_search_response.dart';
import 'package:zheeta/features/buddy_events/domain/usecase/search_event_usecase.dart';

part 'event_search_state.dart';

@prod
@LazySingleton()
class EventSearchCubit extends Cubit<EventSearchState> {
  final SearchBuddyEvent searchBuddyEvent;

  EventSearchCubit({
    required this.searchBuddyEvent,
  }) : super(EventSearchInitial());

  Future<void> searchEvents({
    required String searchWord,
    required int pageNo,
    required int pageSize,
  }) async {
    emit(EventSearchLoading());

    final result = await searchBuddyEvent(
      SearchBuddyEventParams(
        searchWord: searchWord,
        pageNo: pageNo,
        pageSize: pageSize,
      ),
    );

    result.fold(
      (failure) => emit(EventSearchFailure(failure.message)),
      (response) => emit(EventSearchSuccess(response)),
    );
  }
}
