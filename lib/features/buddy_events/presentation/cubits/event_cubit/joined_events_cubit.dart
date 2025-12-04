import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/features/buddy_events/data/models/joined_buddy_event.dart';
import 'package:zheeta/features/buddy_events/domain/usecases/joined_event_usecase.dart';

/// Cubit to fetch all joined events with pagination
@prod
@injectable
class JoinedEventsCubit
    extends PaginationCubit<JoinedBuddyEvent, PaginationParam> {
  final GetAllJoinedEvents _getAllJoinedEvents;

  JoinedEventsCubit({
    required GetAllJoinedEvents getAllJoinedEvents,
  })  : _getAllJoinedEvents = getAllJoinedEvents,
        super(
          fetchPage: ((params) async {
            final result = await getAllJoinedEvents.call(params);

            return result.fold(
              (error) {
                print("JoinedEventsCubit error: ${error.message}");
                throw Exception(error.message);
              },
              (data) {
                print("JoinedEventsCubit fetched ${data.length} items");
                return data;
              },
            );
          }),
          baseParams: PaginationParam(pageNo: 1, pageSize: 15),
        );

  Future<void> refreshJoinedEvents() async => reset();
}
