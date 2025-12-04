import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/features/connections/data/models/all_friends_model.dart';
import 'package:zheeta/features/connections/domain/usecases/get_all_friends_usecase.dart';

/// Cubit to fetch all friends with pagination
@prod
@injectable
class AllFriendsCubit extends PaginationCubit<FriendModel, PaginationParam> {
  final GetAllFriends _getAllFriends;

  AllFriendsCubit({
    required GetAllFriends getAllFriends,
  })  : _getAllFriends = getAllFriends,
        super(
          fetchPage: ((params) async {
            final result = await getAllFriends.call(params);

            return result.fold(
              (error) {
                print("AllFriendsCubit error: ${error.message}");
                throw Exception(error.message);
              },
              (item) {
                print("AllFriendsCubit fetched ${item.data.length} items");
                return item.data; // Adjust based on your model
              },
            );
          }),
          baseParams: PaginationParam(pageNo: 1, pageSize: 15),
        );

  Future<void> refreshFriends() async => reset();
}
