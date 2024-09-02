part of 'friends_cubit.dart';

abstract class FriendsState extends Equatable {
  const FriendsState();

  @override
  List<Object> get props => [];
}

class FriendsInitial extends FriendsState {}

class FriendsLoading extends FriendsState {}

class FriendsSuccess extends FriendsState {
  final FriendsListModel friends;

  const FriendsSuccess(this.friends);

  @override
  List<Object> get props => [friends];
}

class FriendsError extends FriendsState {
  final String message;

  const FriendsError(this.message);

  @override
  List<Object> get props => [message];
}

class FriendsPendingSuccess extends FriendsState {
  final GetPendingFriendsModel friends;

  const FriendsPendingSuccess({required this.friends});

  @override
  List<Object> get props => [friends];

  FriendsPendingSuccess copyWith({
    GetPendingFriendsModel? friends,
  }) {
    return FriendsPendingSuccess(
      friends: friends ?? this.friends,
    );
  }
}

class FriendRequestProcessing extends FriendsState {}

class FriendRequestProcessed extends FriendsState {}

class FriendRequestError extends FriendsState {
  final String message;

  const FriendRequestError(this.message);

  @override
  List<Object> get props => [message];
}
