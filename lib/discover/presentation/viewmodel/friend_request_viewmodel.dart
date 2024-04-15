import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/app/common/enums/type_of_request.dart';
import 'package:zheeta/discover/presentation/bloc/matches_cubit.dart';

// final friendRequestViewModelProvider = StateNotifierProvider<FriendRequestViewModel, FriendRequestState>(
//   (ref) {
//     final _useCase = locator<FriendRequestUseCase>();
//     return FriendRequestViewModel(_useCase);
//   },
// );

class FriendRequestViewModel {
  FriendRequestViewModel();

  Future<void> sendFriendRequest(
    BuildContext context, {
    required String receiverId,
    required TypeOfRequest typeOfRequest,
  }) async {
    await context
        .read<MatchesCubit>()
        .sendFriendRequestCubit(receiverId: receiverId, type: typeOfRequest);
  }
}
