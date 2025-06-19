import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/param/pagination_param.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/connections/data/model/user_downline_model.dart';
import 'package:zheeta/features/connections/domain/repository/user_downline_repository.dart';


@prod
@LazySingleton()
class GetUserDownlines
    extends UsecaseWithParams<UserDownlineListModel, PaginationParam> {
  const GetUserDownlines(this._repo);

  final UserDownlineRepository _repo;

  @override
  ResultFuture<UserDownlineListModel> call(PaginationParam params) async =>
      await _repo.getDownlines(
        pageNumber: params.pageNo,
        pageSize: params.pageSize,
      );
}
