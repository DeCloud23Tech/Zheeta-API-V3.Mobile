import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/connections/data/models/bulk_friend_request_model.dart';
import 'package:zheeta/features/connections/data/requests/friend_request_model.dart';
import 'package:zheeta/features/connections/domain/usecases/process_friend_request_usecase.dart';
import 'package:zheeta/features/connections/domain/usecases/send_bulk_friend_request_usecases.dart';
import 'package:zheeta/features/connections/domain/usecases/send_friend_request_usecases.dart';
import 'package:zheeta/shared/enums/type_of_request.dart';

part 'friends_state.dart';

@prod
@LazySingleton()
class FriendsCubit extends Cubit<FriendsState> {
  final ProcessFriendRequest processFriendRequest;
  final SendFriendRequest sendFriendRequest;
  final SendBulkFriendRequest sendBulkFriendRequest;

  FriendsCubit({
    required this.processFriendRequest,
    required this.sendFriendRequest,
    required this.sendBulkFriendRequest,
  }) : super(const FriendsInitial());

  Future<void> processFriendRequestsCubit(FriendRequest request) async {
    emit((state is FriendsDataState
            ? state as FriendsDataState
            : const FriendsDataState())
        .copyWith(
      isProcessingFriendRequest: true,
      errorMessage: null,
    ));

    final result = await processFriendRequest.call(request);
    result.fold(
      (failure) => emit((state is FriendsDataState
              ? state as FriendsDataState
              : const FriendsDataState())
          .copyWith(
        isProcessingFriendRequest: false,
        errorMessage: failure.message,
      )),
      (_) {
        emit(FriendRequestProcessedSuccessState(
          isProcessingFriendRequest: false,
        ));
      },
    );
  }

  Future<void> sendFriendRequestCubit({
    required String receiverId,
    required TypeOfRequest type,
  }) async {
    emit((state is FriendsDataState
            ? state as FriendsDataState
            : const FriendsDataState())
        .copyWith(
      isSendingFriendRequest: true,
      errorMessage: null,
    ));

    final result = await sendFriendRequest
        .call(SendRequestParams(receiverId: receiverId, typeOfRequest: type));

    result.fold(
      (fail) => emit((state is FriendsDataState
              ? state as FriendsDataState
              : const FriendsDataState())
          .copyWith(
        isSendingFriendRequest: false,
        errorMessage: fail.message,
      )),
      (_) {
        emit(FriendRequestSentSuccessState(
          isSendingFriendRequest: false,
        ));
      },
    );
  }

  Future<void> sendBulkFriendRequestsCubit({
    required List<BulkFriendRequestModel> friendList,
  }) async {
    emit((state is FriendsDataState
            ? state as FriendsDataState
            : const FriendsDataState())
        .copyWith(
      isSendingBulkFriendRequests: true,
      errorMessage: null,
    ));

    final result = await sendBulkFriendRequest
        .call(SendBulkFriendRequestParams(friendList: friendList));

    result.fold(
      (failure) => emit((state is FriendsDataState
              ? state as FriendsDataState
              : const FriendsDataState())
          .copyWith(
        isSendingBulkFriendRequests: false,
        errorMessage: failure.message,
      )),
      (_) {
        emit(BulkFriendRequestsSentSuccessState(
          isSendingBulkFriendRequests: false,
        ));
      },
    );
  }
}
