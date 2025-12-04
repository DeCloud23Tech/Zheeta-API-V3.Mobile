import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/features/buddy_events/data/models/created_buddy_event.dart';
import 'package:zheeta/features/buddy_events/domain/usecases/created_event_usecase.dart';

/// Cubit to fetch all created events with pagination
@prod
@injectable
class CreatedEventsCubit
    extends PaginationCubit<CreatedBuddyEvent, PaginationParam> {
  final GetAllCreatedEvents _getAllCreatedEvents;

  CreatedEventsCubit({
    required GetAllCreatedEvents getAllCreatedEvents,
  })  : _getAllCreatedEvents = getAllCreatedEvents,
        super(
          fetchPage: ((params) async {
            final result = await getAllCreatedEvents.call(params);

            return result.fold(
              (error) {
                print("CreatedEventsCubit error: ${error.message}");
                throw Exception(error.message);
              },
              (data) {
                print("CreatedEventsCubit fetched ${data.length} items");
                return data;
              },
            );
          }),
          baseParams: PaginationParam(pageNo: 1, pageSize: 15),
        );

  Future<void> refreshCreatedEvents() async => reset();
}
