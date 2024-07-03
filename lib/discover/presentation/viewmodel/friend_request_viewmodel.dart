import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/enums/type_of_request.dart';
import 'package:zheeta/discover/data/request/send_bulk_request.dart';
import 'package:zheeta/discover/presentation/bloc/matches_bloc/matches_cubit.dart';

@prod
@LazySingleton()
class FriendRequestViewModel {
  List<FriendListRequest> _bulkRequestList = [];

  void addToList(FriendListRequest value) => _bulkRequestList.add(value);

  void clearBulkList() => _bulkRequestList.clear();

  Future<void> sendFriendRequest(
    BuildContext context, {
    required String receiverId,
    required TypeOfRequest typeOfRequest,
  }) async {
    await context
        .read<MatchesCubit>()
        .sendFriendRequestCubit(receiverId: receiverId, type: typeOfRequest);
  }

  Future<void> sendBulkFriendRequest(BuildContext context) async {
    if (_bulkRequestList.length > 0) {
      SendBulkRequest request = SendBulkRequest(friendList: _bulkRequestList);
      await context
          .read<MatchesCubit>()
          .sendBulkFriendRequestCubit(request: request);
      clearBulkList();
    }
  }
}
