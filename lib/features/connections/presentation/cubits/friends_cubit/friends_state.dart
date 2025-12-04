part of 'friends_cubit.dart';

abstract class FriendsState extends Equatable {
  final String? errorMessage;
  final bool isLoading;
  final bool isProcessingFriendRequest;
  final bool isSendingFriendRequest;
  final bool isSendingBulkFriendRequests;

  const FriendsState({
    this.errorMessage,
    this.isLoading = false,
    this.isProcessingFriendRequest = false,
    this.isSendingFriendRequest = false,
    this.isSendingBulkFriendRequests = false,
  });

  @override
  List<Object?> get props => [
        errorMessage,
        isLoading,
        isProcessingFriendRequest,
        isSendingFriendRequest,
        isSendingBulkFriendRequests,
      ];

  FriendsState copyWith({
    String? errorMessage,
    bool? isLoading,
    bool? isProcessingFriendRequest,
    bool? isSendingFriendRequest,
    bool? isSendingBulkFriendRequests,
  });
}

class FriendsInitial extends FriendsState {
  const FriendsInitial();

  @override
  FriendsInitial copyWith({
    String? errorMessage,
    bool? isLoading,
    bool? isProcessingFriendRequest,
    bool? isSendingFriendRequest,
    bool? isSendingBulkFriendRequests,
  }) {
    return const FriendsInitial();
  }
}

class FriendsDataState extends FriendsState {
  const FriendsDataState({
    super.errorMessage,
    super.isLoading,
    super.isProcessingFriendRequest,
    super.isSendingFriendRequest,
    super.isSendingBulkFriendRequests,
  });

  @override
  FriendsDataState copyWith({
    String? errorMessage,
    bool? isLoading,
    bool? isProcessingFriendRequest,
    bool? isSendingFriendRequest,
    bool? isSendingBulkFriendRequests,
  }) {
    return FriendsDataState(
      errorMessage: errorMessage,
      isLoading: isLoading ?? this.isLoading,
      isProcessingFriendRequest:
          isProcessingFriendRequest ?? this.isProcessingFriendRequest,
      isSendingFriendRequest:
          isSendingFriendRequest ?? this.isSendingFriendRequest,
      isSendingBulkFriendRequests:
          isSendingBulkFriendRequests ?? this.isSendingBulkFriendRequests,
    );
  }
}

// --- Specific Success States ---

class FriendRequestProcessedSuccessState extends FriendsDataState {
  const FriendRequestProcessedSuccessState({
    super.isProcessingFriendRequest = false,
    super.errorMessage,
  });
}

class FriendRequestSentSuccessState extends FriendsDataState {
  const FriendRequestSentSuccessState({
    super.isSendingFriendRequest = false,
    super.errorMessage,
  });
}

class BulkFriendRequestsSentSuccessState extends FriendsDataState {
  const BulkFriendRequestsSentSuccessState({
    super.isSendingBulkFriendRequests = false,
    super.errorMessage,
  });
}
