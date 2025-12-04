import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/features/connections/data/models/user_downline_model.dart';
import 'package:zheeta/features/connections/domain/usecases/user_downlines_usecase.dart';

/// Cubit to fetch user downlines with pagination
@prod
@injectable
class UserDownlinesCubit
    extends PaginationCubit<UserDownlineModel, PaginationParam> {
  final GetUserDownlines _getUserDownlines;

  UserDownlinesCubit({
    required GetUserDownlines getUserDownlines,
  })  : _getUserDownlines = getUserDownlines,
        super(
          fetchPage: ((params) async {
            final result = await getUserDownlines.call(params);

            return result.fold(
              (error) {
                print("UserDownlinesCubit error: ${error.message}");
                throw Exception(error.message);
              },
              (item) {
                print("UserDownlinesCubit fetched ${item.data.length} items");
                return item.data; // Adjust based on your model
              },
            );
          }),
          baseParams: PaginationParam(pageNo: 1, pageSize: 15),
        );

  Future<void> refreshDownlines() async => reset();
}
