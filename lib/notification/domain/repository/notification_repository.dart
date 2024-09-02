import 'package:zheeta/notification/data/model/notification_model.dart';
import '../../../app/common/type_def.dart';

abstract class NotificationRepository {
  ResultFuture<List<NotificationModel>> getNotifications(
      {required int pageNumber, required int pageSize});

}
