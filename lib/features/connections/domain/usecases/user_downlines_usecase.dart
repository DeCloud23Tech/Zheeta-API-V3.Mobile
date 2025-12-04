import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/connections/data/models/user_downline_model.dart';
import 'package:zheeta/features/connections/domain/repositories/user_downline_repository.dart';

@prod
@LazySingleton()
class GetUserDownlines
    extends UsecaseWithParams<UserDownlineListModel, PaginationParam> {
  const GetUserDownlines(this._repo);

  final IUserDownlineRepository _repo;

  @override
  ResultFuture<UserDownlineListModel> call(PaginationParam params) async =>
      await _repo.getDownlines(
        pageNumber: params.pageNo,
        pageSize: params.pageSize,
      );
}
