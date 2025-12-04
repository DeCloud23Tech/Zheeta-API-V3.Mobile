import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/features/connections/data/models/get_pending_friends_model.dart';
import 'package:zheeta/features/connections/domain/usecases/get_pending_friends_usecase.dart';

/// Cubit to fetch pending friends with pagination
@prod
@injectable
class PendingFriendsCubit
    extends PaginationCubit<FriendRequestModel, PaginationParam> {
  final GetPendingFriends _getPendingFriends;

  PendingFriendsCubit({
    required GetPendingFriends getPendingFriends,
  })  : _getPendingFriends = getPendingFriends,
        super(
          fetchPage: ((params) async {
            final result = await getPendingFriends.call(params);

            return result.fold(
              (error) {
                print("PendingFriendsCubit error: ${error.message}");
                throw Exception(error.message);
              },
              (item) {
                print("PendingFriendsCubit fetched ${item.data.length} items");
                return item.data; // Adjust based on your model
              },
            );
          }),
          baseParams: PaginationParam(pageNo: 1, pageSize: 15),
        );

  Future<void> refreshPendingFriends() async => reset();
}
