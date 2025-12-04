import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/features/buddy_events/data/models/created_buddy_event.dart';
import 'package:zheeta/features/buddy_events/domain/usecases/created_event_usecase.dart';

/// Cubit to fetch all profile created events with pagination
@prod
@injectable
class ProfileCreatedEventsCubit
    extends PaginationCubit<CreatedBuddyEvent, PaginationParam> {
  final GetAllCreatedEvents _getAllProfileCreatedEvents;

  ProfileCreatedEventsCubit({
    required GetAllCreatedEvents getAllProfileCreatedEvents,
    @factoryParam String? userId, // et userId from DI
  })  : _getAllProfileCreatedEvents = getAllProfileCreatedEvents,
        super(
          fetchPage: ((params) async {
            final result = await getAllProfileCreatedEvents.call(params);

            return result.fold(
              (error) {
                print("ProfileCreatedEventsCubit error: ${error.message}");
                throw Exception(error.message);
              },
              (data) {
                print("ProfileCreatedEventsCubit fetched ${data.length} items");
                return data;
              },
            );
          }),
          baseParams: PaginationParam(pageNo: 1, pageSize: 15, userId: userId),
        );

  /// Refresh the list of profile created events
  Future<void> refreshProfileCreatedEvents() async => reset();
}
