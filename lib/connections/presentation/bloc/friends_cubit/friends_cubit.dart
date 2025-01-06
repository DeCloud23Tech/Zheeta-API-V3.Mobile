import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/enums/type_of_request.dart';
import 'package:zheeta/app/common/param/pagination_param.dart';
import 'package:zheeta/connections/data/model/all_friends_model.dart';
import 'package:zheeta/connections/data/model/get_pending_friends_model.dart';
import 'package:zheeta/connections/data/request/friend_request_model.dart';
import 'package:zheeta/connections/domain/usecase/ref_usecases/get_all_friends_usecase.dart';
import 'package:zheeta/connections/domain/usecase/ref_usecases/get_pending_friends_usecase.dart';
import 'package:zheeta/connections/domain/usecase/ref_usecases/process_friend_request_usecase.dart';
import 'package:zheeta/connections/domain/usecase/ref_usecases/send_friend_request_usecases.dart';


part 'friends_state.dart';

@prod
@LazySingleton()
class FriendsCubit extends Cubit<FriendsState> {
  final GetAllFriends getAllFriends;
  final GetPendingFriends getPendingFriends;
  final ProcessFriendRequest processFriendRequest;
  final SendFriendRequest sendFriendRequest;

  FriendsCubit({
    required this.getAllFriends,
    required this.getPendingFriends,
    required this.processFriendRequest,
    required this.sendFriendRequest,
  }) : super(FriendsInitial());

  Future<void> fetchFriendsCubit(PaginationParam request) async {
    emit(FriendsLoading());
    final result = await getAllFriends(request);
    result.fold(
      (failure) => emit(FriendsError(failure.message)),
      (friends) => emit(FriendsSuccess(friends)),
    );
  }

  Future<void> fetchFriendRequestsCubit(PaginationParam request) async {
    emit(FriendsLoading());
    final result = await getPendingFriends(request);
    print(result);
    result.fold(
      (failure) => emit(FriendsError(failure.message)),
      (friends) => emit(FriendsPendingSuccess(friends)),
    );
  }

  Future<void> processFriendRequestsCubit(FriendRequest request) async {
    emit(FriendRequestProcessing());
    final result = await processFriendRequest(request);
    result.fold(
      (failure) => emit(FriendRequestError(failure.message)),
      (_) => emit(FriendRequestProcessed()),
    );
  }

  Future<void> sendFriendRequestCubit(
      {required String receiverId, required TypeOfRequest type}) async {
    // emit(MatchesLoadingState());
    var result = await sendFriendRequest(
        SendRequestParams(receiverId: receiverId, typeOfRequest: type));

    result.fold(
      (fail) {
        // emit(MatchesErrorState(fail.message));
      },
      (success) {
        // emit(MatchesFriendRequestSentState());
      },
    );
  }
}
