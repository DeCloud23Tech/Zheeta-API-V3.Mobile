import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/features/buddy_events/data/models/buddy_events_feed.dart';
import 'package:zheeta/features/buddy_events/domain/usecases/get_event_feed_usecase.dart';

/// Cubit to fetch Buddy Events Feed with pagination
@prod
@injectable
class BuddyEventsFeedCubit
    extends PaginationCubit<BuddyEvent, PaginationParam> {
  final GetBuddyEventsFeed _getBuddyEventsFeed;

  BuddyEventsFeedCubit({
    required GetBuddyEventsFeed getBuddyEventsFeed,
  })  : _getBuddyEventsFeed = getBuddyEventsFeed,
        super(
          fetchPage: ((params) async {
            final result = await getBuddyEventsFeed.call(params);

            return result.fold(
              (error) {
                print("BuddyEventsFeedCubit error: ${error.message}");
                throw Exception(error.message);
              },
              (data) {
                print("BuddyEventsFeedCubit fetched ${data.length} items");
                return data;
              },
            );
          }),
          baseParams: PaginationParam(pageNo: 1, pageSize: 15),
        );

  Future<void> refreshBuddyEventsFeed() async => reset();
}
