import '../model/notification_model.dart';

abstract class NotificationDataSource {
  Future<List<NotificationModel>> getNotifications(
  {required int pageNumber, required int pageSize});

}
