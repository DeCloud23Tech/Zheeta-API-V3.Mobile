import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/notification/data/model/notification_model.dart';

import '../../../app/common/param/pagination_param.dart';
import '../../domain/usecase/notification_usecase.dart';

part 'notification_state.dart';

@prod
@LazySingleton()
class NotificationCubit extends Cubit<NotificationState> {
  final GetAllNotifications getAllNotifications;

  int currentPage = 1;
  bool isFetching = false;
  bool hasReachedMax = false;
  List<NotificationModel> cachedNotifications = [];
  double? scrollPosition;

  NotificationCubit({
    required this.getAllNotifications,
  }) : super(NotificationInitial());

  Future<void> fetchNotifications({bool isRefresh = false}) async {
    if (isFetching) return;
    if (hasReachedMax && !isRefresh) return;

    isFetching = true;

    if (isRefresh) {
      currentPage = 1;
      hasReachedMax = false;
      cachedNotifications.clear();
    }

    emit(NotificationLoading());

    var result = await getAllNotifications(
        PaginationParam(pageNo: currentPage, pageSize: 10));
    result.fold(
      (fail) {
        emit(NotificationError(fail.message));
        isFetching = false;
      },
      (success) {
        if (isRefresh) {
          cachedNotifications = success;
        } else {
          cachedNotifications.addAll(success);
        }

        emit(NotificationSuccess(
          List<NotificationModel>.from(cachedNotifications),
          success.isEmpty,
        ));

        if (success.isNotEmpty) {
          currentPage++;
        } else {
          hasReachedMax = true;
        }

        isFetching = false;
      },
    );
  }
}
