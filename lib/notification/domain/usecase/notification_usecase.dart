import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/param/pagination_param.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/notification/data/model/notification_model.dart';
import 'package:zheeta/notification/domain/repository/notification_repository.dart';

@prod
@LazySingleton()
class GetAllNotifications
    extends UsecaseWithParams<List<NotificationModel>, PaginationParam> {
  const GetAllNotifications(this._repo);

  final NotificationRepository _repo;

  @override
  ResultFuture<List<NotificationModel>> call(PaginationParam params) async =>
      await _repo.getNotifications(
          pageNumber: params.pageNo, pageSize: params.pageSize);
}
