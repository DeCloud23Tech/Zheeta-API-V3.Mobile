import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/features/profile/data/models/blocked_user_model.dart';
import 'package:zheeta/features/profile/domain/usecases/user_profile_access_usecases.dart';

/// Cubit to fetch blocked users with pagination
@prod
@injectable
class BlockedUsersCubit extends PaginationCubit<BlockedUser, PaginationParam> {
  final GetBlockedUsers _getBlockedUsers;

  BlockedUsersCubit({
    required GetBlockedUsers getBlockedUsers,
  })  : _getBlockedUsers = getBlockedUsers,
        super(
          fetchPage: ((params) async {
            final result = await getBlockedUsers.call(params);

            return result.fold(
              (error) {
                print("BlockedUsersCubit error: ${error.message}");
                throw Exception(error.message);
              },
              (item) {
                print("BlockedUsersCubit fetched ${item.data.length} items");
                return item.data;
              },
            );
          }),
          baseParams: PaginationParam(pageNo: 1, pageSize: 15),
        );

  Future<void> refreshBlockedUsers() async => reset();
}
