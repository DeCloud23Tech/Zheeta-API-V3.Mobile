import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/connections/data/model/user_downline_model.dart';
import 'package:zheeta/connections/domain/repository/user_downline_repository.dart';

import '../../../../app/common/param/pagination_param.dart';

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
